// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_suggested_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetSuggestedProductModel _$GetSuggestedProductModelFromJson(
  Map<String, dynamic> json,
) => _GetSuggestedProductModel(
  productName: json['product_name'] as String?,
  brand: json['brand'] as String?,
  nutritionGrade: json['nutrition_grade'] as String?,
  imageUrl: json['image_url'] as String?,
  barcode: json['barcode'] as String?,
);

Map<String, dynamic> _$GetSuggestedProductModelToJson(
  _GetSuggestedProductModel instance,
) => <String, dynamic>{
  'product_name': instance.productName,
  'brand': instance.brand,
  'nutrition_grade': instance.nutritionGrade,
  'image_url': instance.imageUrl,
  'barcode': instance.barcode,
};
