import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_products_model.freezed.dart';
part 'get_all_products_model.g.dart';

@freezed
abstract class GetAllProductsModel with _$GetAllProductsModel {
  const factory GetAllProductsModel({
    @JsonKey(name: "count") int? count,
    @JsonKey(name: "page") dynamic page,
    @JsonKey(name: "page_count") int? pageCount,
    @JsonKey(name: "page_size") int? pageSize,
    @JsonKey(name: "products") List<Product>? products,
    @JsonKey(name: "skip") int? skip,
  }) = _GetAllProductsModel;

  factory GetAllProductsModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsModelFromJson(json);
}

@freezed
abstract class Product with _$Product {
  const factory Product({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "brands") String? brands,
    @JsonKey(name: "image_front_small_url") String? imageFrontSmallUrl,
    @JsonKey(name: "nutriscore_grade") String? nutriscoreGrade,
    @JsonKey(name: "nutriscore_score") dynamic nutriscoreScore,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "quantity") String? quantity,
    @JsonKey(name: "categories") String? categories,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
