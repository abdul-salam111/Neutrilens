// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetProductResultModel _$GetProductResultModelFromJson(
  Map<String, dynamic> json,
) => _GetProductResultModel(
  code: json['code'] as String?,
  product: json['product'] == null
      ? null
      : Product.fromJson(json['product'] as Map<String, dynamic>),
  status: (json['status'] as num?)?.toInt(),
  statusVerbose: json['status_verbose'] as String?,
);

Map<String, dynamic> _$GetProductResultModelToJson(
  _GetProductResultModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'product': instance.product,
  'status': instance.status,
  'status_verbose': instance.statusVerbose,
};

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  brands: json['brands'] as String?,
  imageFrontSmallUrl: json['image_front_small_url'] as String?,
  nutrientLevelsTags: (json['nutrient_levels_tags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  nutriments: json['nutriments'] == null
      ? null
      : Nutriments.fromJson(json['nutriments'] as Map<String, dynamic>),
  nutriscoreGrade: json['nutriscore_grade'] as String?,
  nutriscoreScore: (json['nutriscore_score'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'brands': instance.brands,
  'image_front_small_url': instance.imageFrontSmallUrl,
  'nutrient_levels_tags': instance.nutrientLevelsTags,
  'nutriments': instance.nutriments,
  'nutriscore_grade': instance.nutriscoreGrade,
  'nutriscore_score': instance.nutriscoreScore,
  'product_name': instance.productName,
};

_Nutriments _$NutrimentsFromJson(Map<String, dynamic> json) => _Nutriments(
  fat: (json['fat'] as num?)?.toDouble(),
  fiber: (json['fiber'] as num?)?.toDouble(),
  salt: (json['salt'] as num?)?.toDouble(),
  saturatedFat: (json['saturated-fat'] as num?)?.toDouble(),
  sodium: (json['sodium'] as num?)?.toDouble(),
  sugars: (json['sugars'] as num?)?.toDouble(),
);

Map<String, dynamic> _$NutrimentsToJson(_Nutriments instance) =>
    <String, dynamic>{
      'fat': instance.fat,
      'fiber': instance.fiber,
      'salt': instance.salt,
      'saturated-fat': instance.saturatedFat,
      'sodium': instance.sodium,
      'sugars': instance.sugars,
    };
