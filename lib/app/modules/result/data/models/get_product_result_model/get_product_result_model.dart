import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_product_result_model.freezed.dart';
part 'get_product_result_model.g.dart';

@freezed
abstract class GetProductResultModel with _$GetProductResultModel {
  const factory GetProductResultModel({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "product") Product? product,
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "status_verbose") String? statusVerbose,
  }) = _GetProductResultModel;

  factory GetProductResultModel.fromJson(Map<String, dynamic> json) =>
      _$GetProductResultModelFromJson(json);
}

@freezed
abstract class Product with _$Product {
  const factory Product({
    @JsonKey(name: "brands") String? brands,
    @JsonKey(name: "image_front_small_url") String? imageFrontSmallUrl,
    @JsonKey(name: "nutrient_levels_tags") List<String>? nutrientLevelsTags,
    @JsonKey(name: "nutriments") Nutriments? nutriments,
    @JsonKey(name: "nutriscore_grade") String? nutriscoreGrade,
    @JsonKey(name: "nutriscore_score") int? nutriscoreScore,
    @JsonKey(name: "product_name") String? productName,
    // REMOVED: nova_group from Product level (it's in nutriments)
    @JsonKey(name: "additives_n") int? additivesN,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
abstract class Nutriments with _$Nutriments {
  const factory Nutriments({
    // Basic nutrients
    @JsonKey(name: "fat") double? fat,
    @JsonKey(name: "fiber") double? fiber,
    @JsonKey(name: "salt") double? salt,
    @JsonKey(name: "saturated-fat") double? saturatedFat,
    @JsonKey(name: "sodium") double? sodium,
    @JsonKey(name: "sugars") double? sugars,
    @JsonKey(name: "energy-kcal") double? energyKcal,
    @JsonKey(name: "proteins") double? proteins,
    @JsonKey(name: "carbohydrates") double? carbohydrates,
    
    // Per 100g values (MOST IMPORTANT - always prefer these)
    @JsonKey(name: "fat_100g") double? fat100g,
    @JsonKey(name: "fiber_100g") double? fiber100g,
    @JsonKey(name: "salt_100g") double? salt100g,
    @JsonKey(name: "saturated-fat_100g") double? saturatedFat100g,
    @JsonKey(name: "sodium_100g") double? sodium100g,
    @JsonKey(name: "sugars_100g") double? sugars100g,
    @JsonKey(name: "energy-kcal_100g") double? energyKcal100g,
    @JsonKey(name: "proteins_100g") double? proteins100g,
    @JsonKey(name: "carbohydrates_100g") double? carbohydrates100g,
    
    // CRITICAL: NOVA group is inside nutriments!
    @JsonKey(name: "nova-group") int? novaGroup,
    @JsonKey(name: "nova-group_100g") int? novaGroup100g,
    
    // Nutrition scores
    @JsonKey(name: "nutrition-score-fr") int? nutritionScoreFr,
    @JsonKey(name: "nutrition-score-fr_100g") int? nutritionScoreFr100g,
  }) = _Nutriments;

  factory Nutriments.fromJson(Map<String, dynamic> json) =>
      _$NutrimentsFromJson(json);
}