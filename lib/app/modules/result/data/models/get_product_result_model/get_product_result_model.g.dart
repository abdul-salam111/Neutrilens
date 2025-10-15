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
  novaGroup: (json['nova_group'] as num?)?.toInt(),
  additivesN: (json['additives_n'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'brands': instance.brands,
  'image_front_small_url': instance.imageFrontSmallUrl,
  'nutrient_levels_tags': instance.nutrientLevelsTags,
  'nutriments': instance.nutriments,
  'nutriscore_grade': instance.nutriscoreGrade,
  'nutriscore_score': instance.nutriscoreScore,
  'product_name': instance.productName,
  'nova_group': instance.novaGroup,
  'additives_n': instance.additivesN,
};

_Nutriments _$NutrimentsFromJson(Map<String, dynamic> json) => _Nutriments(
  fat: (json['fat'] as num?)?.toDouble(),
  fiber: (json['fiber'] as num?)?.toDouble(),
  salt: (json['salt'] as num?)?.toDouble(),
  saturatedFat: (json['saturated-fat'] as num?)?.toDouble(),
  sodium: (json['sodium'] as num?)?.toDouble(),
  sugars: (json['sugars'] as num?)?.toDouble(),
  energyKcal: (json['energy-kcal'] as num?)?.toDouble(),
  proteins: (json['proteins'] as num?)?.toDouble(),
  fat100g: (json['fat_100g'] as num?)?.toDouble(),
  fiber100g: (json['fiber_100g'] as num?)?.toDouble(),
  salt100g: (json['salt_100g'] as num?)?.toDouble(),
  saturatedFat100g: (json['saturated-fat_100g'] as num?)?.toDouble(),
  sodium100g: (json['sodium_100g'] as num?)?.toDouble(),
  sugars100g: (json['sugars_100g'] as num?)?.toDouble(),
  energyKcal100g: (json['energy-kcal_100g'] as num?)?.toDouble(),
  proteins100g: (json['proteins_100g'] as num?)?.toDouble(),
);

Map<String, dynamic> _$NutrimentsToJson(_Nutriments instance) =>
    <String, dynamic>{
      'fat': instance.fat,
      'fiber': instance.fiber,
      'salt': instance.salt,
      'saturated-fat': instance.saturatedFat,
      'sodium': instance.sodium,
      'sugars': instance.sugars,
      'energy-kcal': instance.energyKcal,
      'proteins': instance.proteins,
      'fat_100g': instance.fat100g,
      'fiber_100g': instance.fiber100g,
      'salt_100g': instance.salt100g,
      'saturated-fat_100g': instance.saturatedFat100g,
      'sodium_100g': instance.sodium100g,
      'sugars_100g': instance.sugars100g,
      'energy-kcal_100g': instance.energyKcal100g,
      'proteins_100g': instance.proteins100g,
    };
