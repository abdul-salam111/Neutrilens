import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neutri_lens/app/core/services/session_manager.dart';
import 'package:neutri_lens/app/modules/auth/data/models/get_goals_diet_list/get_goals_diet_list.dart';
import 'package:neutri_lens/app/modules/result/data/models/get_goals_pref_response/get_goals_and_preferences_response.dart';
import 'package:neutri_lens/app/modules/result/data/models/get_product_result_model/get_product_result_model.dart';
import 'package:neutri_lens/app/modules/result/data/models/get_suggested_product/get_suggested_product_model.dart';
import 'package:neutri_lens/app/modules/result/domain/abstract_repositories/product_repository.dart';
import 'package:neutri_lens/app/modules/settings/presentation/controllers/settings_controller.dart';

import '../../data/models/goals_and_pref_request_model/goals_and_preference_request_model.dart';
import '../../data/models/upload_product_record/upload_product_record_model.dart';

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
  final ProductRepository _getProductResultRepo;
  ResultController(this._getProductResultRepo);

  final isLoading = false.obs;
  final getProductResultModel = Rxn<GetProductResultModel>();
  final errorMessage = RxnString();
  final Rx<Color> backgroundColor = Colors.white.obs;
  final Rx<String> grade = "".obs;
  final List<Map<String, dynamic>> nutritionDetails = [];

  // Score-related observables
  final Rx<double> foodScore = 0.0.obs;
  final Rx<double> processedScore = 0.0.obs;
  final Rx<double> nutriLensScore = 0.0.obs;
  final Rx<String> scoringMethod = "".obs;
  final RxList<String> scoreExplanation = <String>[].obs;

  // Helper functions
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

    // Sugar penalty - use 100g values
    double sugars = nutriments.sugars100g ?? nutriments.sugars ?? 0;
    score -= 1.5 * sugars;
    if (sugars > 0) explain.add("Sugar -${(1.5 * sugars).round()}");

    // Saturated fat penalty
    double satFat = nutriments.saturatedFat100g ?? nutriments.saturatedFat ?? 0;
    score -= 2.0 * satFat;
    if (satFat > 0) explain.add("SatFat -${(2 * satFat).round()}");

    // Sodium calculation (FIXED: proper salt to sodium conversion)
    double? sodium = nutriments.sodium100g ?? nutriments.sodium;
    if (sodium == null) {
      double? salt = nutriments.salt100g ?? nutriments.salt;
      if (salt != null) {
        // FIXED: salt to sodium conversion
        // 1g salt = 0.4g sodium (salt is ~40% sodium)
        sodium = salt * 0.4;
      }
    }
    if (sodium != null) {
      // Sodium penalty (in mg): max 20 points deduction
      double sodiumMg = sodium * 1000; // convert g to mg
      double penalty = min(sodiumMg / 100.0, 20);
      score -= penalty;
      if (penalty > 0) explain.add("Sodium -${penalty.round()}");
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
      // Numeric fallback from nutriscore_score
      food = clampValue(100 * (40 - nutriScore) / 55, 0, 100);
      explain.add("From nutriscore_score = $nutriScore");
      method = "direct";
    }

    if (food == null) {
      // Full fallback calculation
      food = fallbackFoodScore(product.nutriments);
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
          if (salt != null) sodium = salt * 0.4; // FIXED conversion
        }
        if (sodium != null) {
          double sodiumMg = sodium * 1000;
          double penalty = min(sodiumMg / 100.0, 20);
          if (penalty > 0) explain.add("Sodium -${penalty.round()}");
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

      method = "fallback";
    }

    // --- Processed score (FIXED: NOVA is in nutriments!) ---
    // CRITICAL: NOVA group is inside nutriments, not at product level
    int? nova = product.nutriments?.novaGroup;

    if (nova != null) {
      print("✅ Found NOVA group in nutriments: $nova");
    } else {
      print("⚠️ NOVA group not found in nutriments");
    }

    double? processed = mapNovaTo100(nova);

    if (processed == null) {
      // Fallback based on additives
      int additives = product.additivesN ?? 0;
      processed = max(15, 95 - additives * 10).toDouble();
      print(
        "📊 Using additives fallback: $additives additives = $processed score",
      );
    } else {
      print("✅ Using NOVA group $nova = $processed score");
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

  String _getNutrientLevel(String tag) {
    if (tag.contains('high')) return 'high';
    if (tag.contains('moderate')) return 'moderate';
    if (tag.contains('low')) return 'low';
    return 'unknown';
  }

  Future<GetProductResultModel> getProductDetails(String code) async {
    isLoading.value = true;
    errorMessage.value = null;
    final barCode = code;
    final result = await _getProductResultRepo.getProductResult(
      barCode: barCode,
    );

    return result.match(
      (error) {
        isLoading.value = false;
        errorMessage.value = error.toString();
         throw error;
      },
      (model) {
        isLoading.value = false;
        getProductResultModel.value = model;

        // Compute NutriLens scores
        final scores = computeNutriLensScores(model.product);

        // Update observables
        foodScore.value = scores.foodScore;
        processedScore.value = scores.processedScore;
        nutriLensScore.value = scores.nutriLensScore;
        scoringMethod.value = scores.method;
        scoreExplanation.value = List<String>.from(
          scores.debug["explainFood"] ?? [],
        );

        // Set grade based on NutriLens score
        grade.value = getScoreGrade(scores.nutriLensScore);
        backgroundColor.value = getScoreColor(scores.nutriLensScore);

        // Debug logging
        print("🎯 Food Score: ${scores.foodScore}");
        print("🏭 Processed Score: ${scores.processedScore}");
        print("⭐ NutriLens Score: ${scores.nutriLensScore}");
        print("📊 Method: ${scores.method}");
        print("🔍 Debug: ${scores.debug}");

        // Build nutrition details
        nutritionDetails.clear();
        final nutriments = model.product?.nutriments;
        final nutrientTags = model.product?.nutrientLevelsTags ?? [];

        if (nutriments != null) {
          for (int i = 0; i < nutrientTags.length; i++) {
            final tag = nutrientTags[i];

            String? nutrientValue;
            String? nutrientUnit;
            String displayName = '';

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
        }

        uploadScannedProduct(barCode, model.product?.productName ?? "Unknown");
        return model;
      },
    );
  }

  var suggestproductError = "".obs;
  getSuggestedProduct(List<String> tags) async {
    suggestproductError.value = "";
    isLoadingSuggested.value = true;

    final response = await _getProductResultRepo.getSuggestedProducts(
      tags: tags,
    );

    response.fold(
      (failure) {
        suggestproductError.value = failure.toString();
        isLoadingSuggested.value = false;
      },
      (model) async {
        isLoadingSuggested.value = false;
        suggestedProducts.value = model;
      },
    );
  }

  Future uploadScannedProduct(String barcode, String productName) async {
    final response = await _getProductResultRepo.uploadScannedProduct(
      UploadProductRecordModel(
        barcode: barcode,
        productName: productName,
        foodIqScore: nutriLensScore.value,
      ),
    );
    response.fold(
      (failure) {
        print("Upload failed: $failure");
      },
      (model) {
        print("Upload successful");
      },
    );
  }

  final RxList<SuggestedProduct> suggestedProducts = <SuggestedProduct>[].obs;
  final isLoadingSuggested = false.obs;

  void resetControllerForNewProduct() {
    isLoading.value = true;
    getProductResultModel.value = null;
    suggestedProducts.value = [];
    isLoadingSuggested.value = true;
    errorMessage.value = null;
    backgroundColor.value = Colors.white;
    grade.value = "";
    foodScore.value = 0.0;
    processedScore.value = 0.0;
    nutriLensScore.value = 0.0;
    scoringMethod.value = "";
    scoreExplanation.clear();
    nutritionDetails.clear();
  }

  ////code for getting goals and preferences
  ///final getGoalsAndPreferencesList = GetGoalsAndPreferencesResponse().obs;
  var isGettingGoals = false.obs;
  var getGoalsAndPreferencesList = GetGoalsAndPreferencesResponse().obs;
  // Add this to ResultController class

  final selectedGoals = <DietPreference>[].obs;
  final selectedPref = <DietPreference>[].obs;

  // Computed property for goals NOT met
  List<DietPreference> get goalsNotMet {
    final metGoalIds =
        getGoalsAndPreferencesList.value.goalsMet?.map((g) => g.id).toList() ??
        [];

    return selectedGoals
        .where((goal) => !metGoalIds.contains(goal.id))
        .toList();
  }

  List<DietPreference> get prefNotMet {
    final metPrefIds =
        getGoalsAndPreferencesList.value.preferencesViolated
            ?.map((g) => g.id)
            .toList() ??
        [];

    return selectedPref.where((goal) => !metPrefIds.contains(goal.id)).toList();
  }

  // Computed property for goals that ARE met
  List<DietPreference> get goalsMetList {
    final metGoalIds =
        getGoalsAndPreferencesList.value.goalsMet?.map((g) => g.id).toList() ??
        [];

    return selectedGoals.where((goal) => metGoalIds.contains(goal.id)).toList();
  }

  List<DietPreference> get prefMetList {
    final metPrefIds =
        getGoalsAndPreferencesList.value.preferencesViolated
            ?.map((g) => g.id)
            .toList() ??
        [];

    return selectedPref.where((goal) => metPrefIds.contains(goal.id)).toList();
  }

  Future getGoalsAndPreferences(
    GoalsAndPreferenceRequestModel goalsAndPreferenceRequestModel,
  ) async {
    suggestproductError.value = "";
    isGettingGoals.value = true;

    final response = await _getProductResultRepo.getGoalsAndPreferences(
      goalsAndPreferenceRequestModel: goalsAndPreferenceRequestModel,
    );

    response.fold(
      (failure) {
        suggestproductError.value = failure.toString();
        isGettingGoals.value = false;
        print("❌ Goals API Error: ${failure.toString()}");
      },
      (model) async {
        print("✅ Goals API Response: $model");
        print(
          "🎯 Goals Met from API: ${model.goalsMet?.map((g) => g.name).toList()}",
        );

        isGettingGoals.value = false;
        getGoalsAndPreferencesList.value = model;

        // Get all goals list from settings controller
        final settingController = Get.find<SettingsController>();
        await settingController.getGoalsAndDietList();
        var goalsList = settingController.goals;
        var prefList = settingController.allergensToAvoid;
        // Get user's selected goal IDs
        var selectedGoalsIds = SessionController().getUserDetails.goals;
        var selectedPreferences =
            SessionController().getUserDetails.dietPreferences;

        // Filter to get only selected goals
        selectedGoals.value = goalsList
            .where((element) => selectedGoalsIds?.contains(element.id) ?? false)
            .toList();

        selectedPref.value = prefList
            .where(
              (element) => selectedPreferences?.contains(element.id) ?? false,
            )
            .toList();

        print(
          "📋 User's Selected Goals: ${selectedGoals.map((g) => g.name).toList()}",
        );
        print("✅ Goals Met: ${goalsMetList.map((g) => g.name).toList()}");
        print("❌ Goals NOT Met: ${goalsNotMet.map((g) => g.name).toList()}");
      },
    );
  }

  // @override
  // void onReady() {
  //   // TODO: implement onReady
  //   super.onReady();
  //   getGoalsAndPreferences(Get.arguments);
  // }
}
