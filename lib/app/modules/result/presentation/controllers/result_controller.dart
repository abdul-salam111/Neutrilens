// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neutri_lens/app/modules/result/data/models/get_product_result_model.dart';
import 'package:neutri_lens/app/modules/result/data/resppsitory/get_product_result_repo.dart';

class ResultController extends GetxController {
  final GetProductResultRepo _getProductResultRepo;
  ResultController(this._getProductResultRepo);

  final isLoading = false.obs;
  final getProductResultModel = Rxn<GetProductResultModel>();
  final errorMessage = RxnString();
  final Rx<Color> backgroundColor = Colors.white.obs;
  final Rx<String> grade = "".obs;
  final List<Map<String, dynamic>> nutritionDetails = [];
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
        grade.value = model.product?.nutriscoreGrade ?? "a";
        backgroundColor.value = grade.value == 'a'
            ? Colors.green
            : grade.value == 'b'
            ? Colors.lightGreen
            : grade.value == "c"
            ? Colors.orangeAccent
            : grade.value == "d"
            ? Colors.orange
            : Colors.red;

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
            nutrientValue = '${nutriments.fat ?? nutriments.fat ?? 0}';
            nutrientUnit = nutriments.fat.toString();
            displayName = 'Fat';
          } else if (tag.contains('saturated-fat')) {
            nutrientValue =
                '${nutriments.saturatedFat ?? nutriments.saturatedFat ?? 0}';
            nutrientUnit = nutriments.saturatedFat.toString();
            displayName = 'Saturated Fat';
          } else if (tag.contains('sugars')) {
            nutrientValue = '${nutriments.sugars ?? nutriments.sugars ?? 0}';
            nutrientUnit = nutriments.sugars.toString();
            displayName = 'Sugars';
          } else if (tag.contains('salt')) {
            nutrientValue = '${nutriments.salt ?? nutriments.salt ?? 0}';
            nutrientUnit = nutriments.salt.toString();
            displayName = 'Salt';
          }

          if (nutrientValue != null) {
            nutritionDetails.add({
              "tag": tag,
              "display_name": displayName,
              "value": nutrientValue,
              "unit": nutrientUnit ?? 'g',
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
