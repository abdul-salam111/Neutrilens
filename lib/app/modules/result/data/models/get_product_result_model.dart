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
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
abstract class Nutriments with _$Nutriments {
  const factory Nutriments({
    @JsonKey(name: "fat") double? fat,
    @JsonKey(name: "fiber") double? fiber,
    @JsonKey(name: "salt") double? salt,
    @JsonKey(name: "saturated-fat") double? saturatedFat,
    @JsonKey(name: "sodium") double? sodium,
    @JsonKey(name: "sugars") double? sugars,
  }) = _Nutriments;

  factory Nutriments.fromJson(Map<String, dynamic> json) =>
      _$NutrimentsFromJson(json);
}
