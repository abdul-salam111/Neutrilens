// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetAllProductsModel _$GetAllProductsModelFromJson(Map<String, dynamic> json) =>
    _GetAllProductsModel(
      count: (json['count'] as num?)?.toInt(),
      page: json['page'],
      pageCount: (json['page_count'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      skip: (json['skip'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetAllProductsModelToJson(
  _GetAllProductsModel instance,
) => <String, dynamic>{
  'count': instance.count,
  'page': instance.page,
  'page_count': instance.pageCount,
  'page_size': instance.pageSize,
  'products': instance.products,
  'skip': instance.skip,
};

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  brands: json['brands'] as String?,
  imageFrontSmallUrl: json['image_front_small_url'] as String?,
  nutriscoreGrade: json['nutriscore_grade'] as String?,
  nutriscoreScore: json['nutriscore_score'],
  productName: json['product_name'] as String?,
  quantity: json['quantity'] as String?,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'brands': instance.brands,
  'image_front_small_url': instance.imageFrontSmallUrl,
  'nutriscore_grade': instance.nutriscoreGrade,
  'nutriscore_score': instance.nutriscoreScore,
  'product_name': instance.productName,
  'quantity': instance.quantity,
};
