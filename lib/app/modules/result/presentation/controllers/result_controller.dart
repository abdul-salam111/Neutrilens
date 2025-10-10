import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neutri_lens/app/modules/result/data/models/get_product_result_model.dart';
import 'package:neutri_lens/app/modules/result/data/resppsitory/get_product_result_repo.dart';

class NutriLensScores {
  final double foodScore;
  final double processedScore;
  final double nutriLensScore;
  final String method;
  final Map<String, dynamic> debug;

  NutriLensScores({
    required this.foodScore,
    required this.processedScore,
    required this.nutriLensScore,
    required this.method,
    required this.debug,
  });

  Map<String, dynamic> toJson() => {
    "foodScore": {
      "value": foodScore.round(),
      "basis": debug["basisFood"],
      "grade": debug["grade"],
      "method": method,
      "explain": debug["explainFood"],
    },
    "processedScore": {
      "value": processedScore.round(),
      "basis": debug["basisProcessed"],
      "novaGroup": debug["novaGroup"],
    },
    "nutriLensScore": nutriLensScore.round(),
  };
}

class ResultController extends GetxController {
  final GetProductResultRepo _getProductResultRepo;
  ResultController(this._getProductResultRepo);

  final isLoading = false.obs;
  final getProductResultModel = Rxn<GetProductResultModel>();
  final errorMessage = RxnString();
  final Rx<Color> backgroundColor = Colors.white.obs;
  final Rx<String> grade = "".obs;
  final List<Map<String, dynamic>> nutritionDetails = [];

  // New score-related observables
  final Rx<double> foodScore = 0.0.obs;
  final Rx<double> processedScore = 0.0.obs;
  final Rx<double> nutriLensScore = 0.0.obs;
  final Rx<String> scoringMethod = "".obs;
  final RxList<String> scoreExplanation = <String>[].obs;

  // Helper functions from client's code
  double? mapNutriScoreLetterTo100(String? letter) {
    if (letter == null) return null;
    const tbl = {'a': 95, 'b': 80, 'c': 65, 'd': 45, 'e': 25};
    return tbl[letter.toLowerCase()]?.toDouble();
  }

  double? mapNovaTo100(int? nova) {
    if (nova == null) return null;
    const tbl = {1: 95, 2: 75, 3: 50, 4: 15};
    return tbl[nova]?.toDouble();
  }

  double clampValue(double value, double minVal, double maxVal) =>
      value < minVal ? minVal : (value > maxVal ? maxVal : value);

  double fallbackFoodScore(Nutriments? nutriments) {
    if (nutriments == null) return 50.0;

    double score = 100;
    final explain = <String>[];

    // Use 100g values preferentially, fall back to regular values
    double sugars = nutriments.sugars100g ?? nutriments.sugars ?? 0;
    score -= 1.5 * sugars;
    if (sugars > 0) explain.add("Sugar -${(1.5 * sugars).round()}");

    double satFat = nutriments.saturatedFat100g ?? nutriments.saturatedFat ?? 0;
    score -= 2.0 * satFat;
    if (satFat > 0) explain.add("SatFat -${(2 * satFat).round()}");

    // Sodium calculation (prefer sodium_100g, then salt_100g conversion)
    double? sodium = nutriments.sodium100g ?? nutriments.sodium;
    if (sodium == null) {
      double? salt = nutriments.salt100g ?? nutriments.salt;
      if (salt != null) {
        sodium = salt * 400; // salt → sodium conversion
      }
    }
    if (sodium != null) {
      double penalty = min(sodium / 10.0, 20);
      score -= penalty;
      explain.add("Sodium -${penalty.round()}");
    }

    // Energy penalty
    double kcal = nutriments.energyKcal100g ?? nutriments.energyKcal ?? 0;
    double energyPenalty = min(kcal / 20.0, 15);
    score -= energyPenalty;
    if (energyPenalty > 0) explain.add("Energy -${energyPenalty.round()}");

    // Fiber bonus
    double fiber = nutriments.fiber100g ?? nutriments.fiber ?? 0;
    double fiberBonus = min(fiber * 3.0, 15);
    score += fiberBonus;
    if (fiberBonus > 0) explain.add("Fiber +${fiberBonus.round()}");

    // Protein bonus
    double protein = nutriments.proteins100g ?? nutriments.proteins ?? 0;
    double proteinBonus = min(protein * 2.0, 10);
    score += proteinBonus;
    if (proteinBonus > 0) explain.add("Protein +${proteinBonus.round()}");

    score = clampValue(score, 0, 100);
    explain.insert(0, "Fallback computed");

    return score;
  }

  NutriLensScores computeNutriLensScores(Product? product) {
    if (product == null) {
      return NutriLensScores(
        foodScore: 50,
        processedScore: 50,
        nutriLensScore: 50,
        method: "default",
        debug: {
          "basisFood": "none",
          "grade": null,
          "basisProcessed": "none",
          "novaGroup": null,
          "explainFood": ["No product data available"],
        },
      );
    }

    // --- Food score ---
    String? gradeValue = product.nutriscoreGrade;
    int? nutriScore = product.nutriscoreScore;

    double? food = mapNutriScoreLetterTo100(gradeValue);
    String method = "direct";
    final explain = <String>[];

    // Check if grade is "unknown" - treat as null
    if (gradeValue == "unknown") {
      gradeValue = null;
      food = null;
    }

    if (food == null && nutriScore != null) {
      // numeric fallback
      food = clampValue(100 * (40 - nutriScore) / 55, 0, 100);
      explain.add("From nutriscore_score = $nutriScore");
      method = "direct";
    }

    if (food == null) {
      food = fallbackFoodScore(product.nutriments);
      // Get explanation for fallback
      final nutriments = product.nutriments;

      if (nutriments != null) {
        double sugars = nutriments.sugars100g ?? nutriments.sugars ?? 0;
        if (sugars > 0) explain.add("Sugar -${(1.5 * sugars).round()}");

        double satFat =
            nutriments.saturatedFat100g ?? nutriments.saturatedFat ?? 0;
        if (satFat > 0) explain.add("SatFat -${(2 * satFat).round()}");

        double? sodium = nutriments.sodium100g ?? nutriments.sodium;
        if (sodium == null) {
          double? salt = nutriments.salt100g ?? nutriments.salt;
          if (salt != null) sodium = salt * 400;
        }
        if (sodium != null) {
          double penalty = min(sodium / 10.0, 20);
          explain.add("Sodium -${penalty.round()}");
        }

        double kcal = nutriments.energyKcal100g ?? nutriments.energyKcal ?? 0;
        double energyPenalty = min(kcal / 20.0, 15);
        if (energyPenalty > 0) explain.add("Energy -${energyPenalty.round()}");

        double fiber = nutriments.fiber100g ?? nutriments.fiber ?? 0;
        double fiberBonus = min(fiber * 3.0, 15);
        if (fiberBonus > 0) explain.add("Fiber +${fiberBonus.round()}");

        double protein = nutriments.proteins100g ?? nutriments.proteins ?? 0;
        double proteinBonus = min(protein * 2.0, 10);
        if (proteinBonus > 0) explain.add("Protein +${proteinBonus.round()}");
      }

      explain.insert(0, "Fallback computed");
      method = "fallback";
    }

    // --- Processed score ---
    int? nova = product.novaGroup;
    double? processed = mapNovaTo100(nova);

    if (processed == null) {
      // Fallback based on additives
      int additives = product.additivesN ?? 0;
      processed = max(15, 95 - additives * 10).toDouble();
    }

    // --- Combined NutriLens score ---
    double nutrilens = (0.7 * food) + (0.3 * processed);

    return NutriLensScores(
      foodScore: food,
      processedScore: processed,
      nutriLensScore: nutrilens,
      method: method,
      debug: {
        "basisFood": gradeValue != null ? "nutri-score" : "nutrition-data",
        "grade": gradeValue,
        "basisProcessed": nova != null ? "nova" : "additives",
        "novaGroup": nova,
        "explainFood": explain,
      },
    );
  }

  Color getScoreColor(double score) {
    if (score >= 80) return Colors.green;
    if (score >= 65) return Colors.lightGreen;
    if (score >= 50) return Colors.orangeAccent;
    if (score >= 35) return Colors.red;
    return Colors.red;
  }

  String getScoreGrade(double score) {
    if (score >= 80) return 'a';
    if (score >= 65) return 'b';
    if (score >= 50) return 'c';
    if (score >= 35) return 'd';
    return 'e';
  }

  Future getProductDetails() async {
    isLoading.value = true;
    errorMessage.value = null;
    final barCode = Get.arguments.toString();
    final result = await _getProductResultRepo.getProductResult(
      barCode: barCode,
    );

    return result.match(
      (error) {
        isLoading.value = false;
        errorMessage.value = error.toString();
      },
      (model) {
        isLoading.value = false;
        getProductResultModel.value = model;

        // Compute NutriLens scores using client's algorithm
        final scores = computeNutriLensScores(model.product);

        // Update observables with computed scores
        foodScore.value = scores.foodScore;
        processedScore.value = scores.processedScore;
        nutriLensScore.value = scores.nutriLensScore;
        scoringMethod.value = scores.method;
        scoreExplanation.value = List<String>.from(
          scores.debug["explainFood"] ?? [],
        );

        // Set grade based on NutriLens score (not just nutriscore_grade)
        grade.value = getScoreGrade(scores.nutriLensScore);
        backgroundColor.value = getScoreColor(scores.nutriLensScore);

        // Build nutrition details
        nutritionDetails.clear();
        final nutriments = model.product?.nutriments;
        final nutrientTags = model.product?.nutrientLevelsTags ?? [];

        if (nutriments == null) return;

        for (int i = 0; i < nutrientTags.length; i++) {
          final tag = nutrientTags[i];

          String? nutrientValue;
          String? nutrientUnit;
          String displayName = '';

          // Get value and unit based on tag
          if (tag.contains('fat') && !tag.contains('saturated')) {
            nutrientValue = '${nutriments.fat100g ?? nutriments.fat ?? 0}';
            nutrientUnit = 'g';
            displayName = 'Fat';
          } else if (tag.contains('saturated-fat')) {
            nutrientValue =
                '${nutriments.saturatedFat100g ?? nutriments.saturatedFat ?? 0}';
            nutrientUnit = 'g';
            displayName = 'Saturated Fat';
          } else if (tag.contains('sugars')) {
            nutrientValue =
                '${nutriments.sugars100g ?? nutriments.sugars ?? 0}';
            nutrientUnit = 'g';
            displayName = 'Sugars';
          } else if (tag.contains('salt')) {
            nutrientValue = '${nutriments.salt100g ?? nutriments.salt ?? 0}';
            nutrientUnit = 'g';
            displayName = 'Salt';
          }

          if (nutrientValue != null) {
            nutritionDetails.add({
              "tag": tag,
              "display_name": displayName,
              "value": nutrientValue,
              "unit": nutrientUnit,
              "level": _getNutrientLevel(tag),
            });
          }
        }
      },
    );
  }

  String _getNutrientLevel(String tag) {
    if (tag.contains('high')) return 'high';
    if (tag.contains('moderate')) return 'moderate';
    if (tag.contains('low')) return 'low';
    return 'unknown';
  }

  @override
  void onInit() {
    super.onInit();
    getProductDetails();
  }
}
