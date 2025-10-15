// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_product_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetProductResultModel {

@JsonKey(name: "code") String? get code;@JsonKey(name: "product") Product? get product;@JsonKey(name: "status") int? get status;@JsonKey(name: "status_verbose") String? get statusVerbose;
/// Create a copy of GetProductResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductResultModelCopyWith<GetProductResultModel> get copyWith => _$GetProductResultModelCopyWithImpl<GetProductResultModel>(this as GetProductResultModel, _$identity);

  /// Serializes this GetProductResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductResultModel&&(identical(other.code, code) || other.code == code)&&(identical(other.product, product) || other.product == product)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusVerbose, statusVerbose) || other.statusVerbose == statusVerbose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,product,status,statusVerbose);

@override
String toString() {
  return 'GetProductResultModel(code: $code, product: $product, status: $status, statusVerbose: $statusVerbose)';
}


}

/// @nodoc
abstract mixin class $GetProductResultModelCopyWith<$Res>  {
  factory $GetProductResultModelCopyWith(GetProductResultModel value, $Res Function(GetProductResultModel) _then) = _$GetProductResultModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "code") String? code,@JsonKey(name: "product") Product? product,@JsonKey(name: "status") int? status,@JsonKey(name: "status_verbose") String? statusVerbose
});


$ProductCopyWith<$Res>? get product;

}
/// @nodoc
class _$GetProductResultModelCopyWithImpl<$Res>
    implements $GetProductResultModelCopyWith<$Res> {
  _$GetProductResultModelCopyWithImpl(this._self, this._then);

  final GetProductResultModel _self;
  final $Res Function(GetProductResultModel) _then;

/// Create a copy of GetProductResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = freezed,Object? product = freezed,Object? status = freezed,Object? statusVerbose = freezed,}) {
  return _then(_self.copyWith(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,statusVerbose: freezed == statusVerbose ? _self.statusVerbose : statusVerbose // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of GetProductResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [GetProductResultModel].
extension GetProductResultModelPatterns on GetProductResultModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetProductResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetProductResultModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetProductResultModel value)  $default,){
final _that = this;
switch (_that) {
case _GetProductResultModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetProductResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _GetProductResultModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "code")  String? code, @JsonKey(name: "product")  Product? product, @JsonKey(name: "status")  int? status, @JsonKey(name: "status_verbose")  String? statusVerbose)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetProductResultModel() when $default != null:
return $default(_that.code,_that.product,_that.status,_that.statusVerbose);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "code")  String? code, @JsonKey(name: "product")  Product? product, @JsonKey(name: "status")  int? status, @JsonKey(name: "status_verbose")  String? statusVerbose)  $default,) {final _that = this;
switch (_that) {
case _GetProductResultModel():
return $default(_that.code,_that.product,_that.status,_that.statusVerbose);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "code")  String? code, @JsonKey(name: "product")  Product? product, @JsonKey(name: "status")  int? status, @JsonKey(name: "status_verbose")  String? statusVerbose)?  $default,) {final _that = this;
switch (_that) {
case _GetProductResultModel() when $default != null:
return $default(_that.code,_that.product,_that.status,_that.statusVerbose);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetProductResultModel implements GetProductResultModel {
  const _GetProductResultModel({@JsonKey(name: "code") this.code, @JsonKey(name: "product") this.product, @JsonKey(name: "status") this.status, @JsonKey(name: "status_verbose") this.statusVerbose});
  factory _GetProductResultModel.fromJson(Map<String, dynamic> json) => _$GetProductResultModelFromJson(json);

@override@JsonKey(name: "code") final  String? code;
@override@JsonKey(name: "product") final  Product? product;
@override@JsonKey(name: "status") final  int? status;
@override@JsonKey(name: "status_verbose") final  String? statusVerbose;

/// Create a copy of GetProductResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetProductResultModelCopyWith<_GetProductResultModel> get copyWith => __$GetProductResultModelCopyWithImpl<_GetProductResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetProductResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetProductResultModel&&(identical(other.code, code) || other.code == code)&&(identical(other.product, product) || other.product == product)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusVerbose, statusVerbose) || other.statusVerbose == statusVerbose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,product,status,statusVerbose);

@override
String toString() {
  return 'GetProductResultModel(code: $code, product: $product, status: $status, statusVerbose: $statusVerbose)';
}


}

/// @nodoc
abstract mixin class _$GetProductResultModelCopyWith<$Res> implements $GetProductResultModelCopyWith<$Res> {
  factory _$GetProductResultModelCopyWith(_GetProductResultModel value, $Res Function(_GetProductResultModel) _then) = __$GetProductResultModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "code") String? code,@JsonKey(name: "product") Product? product,@JsonKey(name: "status") int? status,@JsonKey(name: "status_verbose") String? statusVerbose
});


@override $ProductCopyWith<$Res>? get product;

}
/// @nodoc
class __$GetProductResultModelCopyWithImpl<$Res>
    implements _$GetProductResultModelCopyWith<$Res> {
  __$GetProductResultModelCopyWithImpl(this._self, this._then);

  final _GetProductResultModel _self;
  final $Res Function(_GetProductResultModel) _then;

/// Create a copy of GetProductResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? product = freezed,Object? status = freezed,Object? statusVerbose = freezed,}) {
  return _then(_GetProductResultModel(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,statusVerbose: freezed == statusVerbose ? _self.statusVerbose : statusVerbose // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of GetProductResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$Product {

@JsonKey(name: "brands") String? get brands;@JsonKey(name: "image_front_small_url") String? get imageFrontSmallUrl;@JsonKey(name: "nutrient_levels_tags") List<String>? get nutrientLevelsTags;@JsonKey(name: "nutriments") Nutriments? get nutriments;@JsonKey(name: "nutriscore_grade") String? get nutriscoreGrade;@JsonKey(name: "nutriscore_score") int? get nutriscoreScore;@JsonKey(name: "product_name") String? get productName;// Added fields for NutriLens scoring
@JsonKey(name: "nova_group") int? get novaGroup;@JsonKey(name: "additives_n") int? get additivesN;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.brands, brands) || other.brands == brands)&&(identical(other.imageFrontSmallUrl, imageFrontSmallUrl) || other.imageFrontSmallUrl == imageFrontSmallUrl)&&const DeepCollectionEquality().equals(other.nutrientLevelsTags, nutrientLevelsTags)&&(identical(other.nutriments, nutriments) || other.nutriments == nutriments)&&(identical(other.nutriscoreGrade, nutriscoreGrade) || other.nutriscoreGrade == nutriscoreGrade)&&(identical(other.nutriscoreScore, nutriscoreScore) || other.nutriscoreScore == nutriscoreScore)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.novaGroup, novaGroup) || other.novaGroup == novaGroup)&&(identical(other.additivesN, additivesN) || other.additivesN == additivesN));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brands,imageFrontSmallUrl,const DeepCollectionEquality().hash(nutrientLevelsTags),nutriments,nutriscoreGrade,nutriscoreScore,productName,novaGroup,additivesN);

@override
String toString() {
  return 'Product(brands: $brands, imageFrontSmallUrl: $imageFrontSmallUrl, nutrientLevelsTags: $nutrientLevelsTags, nutriments: $nutriments, nutriscoreGrade: $nutriscoreGrade, nutriscoreScore: $nutriscoreScore, productName: $productName, novaGroup: $novaGroup, additivesN: $additivesN)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "brands") String? brands,@JsonKey(name: "image_front_small_url") String? imageFrontSmallUrl,@JsonKey(name: "nutrient_levels_tags") List<String>? nutrientLevelsTags,@JsonKey(name: "nutriments") Nutriments? nutriments,@JsonKey(name: "nutriscore_grade") String? nutriscoreGrade,@JsonKey(name: "nutriscore_score") int? nutriscoreScore,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "nova_group") int? novaGroup,@JsonKey(name: "additives_n") int? additivesN
});


$NutrimentsCopyWith<$Res>? get nutriments;

}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? brands = freezed,Object? imageFrontSmallUrl = freezed,Object? nutrientLevelsTags = freezed,Object? nutriments = freezed,Object? nutriscoreGrade = freezed,Object? nutriscoreScore = freezed,Object? productName = freezed,Object? novaGroup = freezed,Object? additivesN = freezed,}) {
  return _then(_self.copyWith(
brands: freezed == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as String?,imageFrontSmallUrl: freezed == imageFrontSmallUrl ? _self.imageFrontSmallUrl : imageFrontSmallUrl // ignore: cast_nullable_to_non_nullable
as String?,nutrientLevelsTags: freezed == nutrientLevelsTags ? _self.nutrientLevelsTags : nutrientLevelsTags // ignore: cast_nullable_to_non_nullable
as List<String>?,nutriments: freezed == nutriments ? _self.nutriments : nutriments // ignore: cast_nullable_to_non_nullable
as Nutriments?,nutriscoreGrade: freezed == nutriscoreGrade ? _self.nutriscoreGrade : nutriscoreGrade // ignore: cast_nullable_to_non_nullable
as String?,nutriscoreScore: freezed == nutriscoreScore ? _self.nutriscoreScore : nutriscoreScore // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,novaGroup: freezed == novaGroup ? _self.novaGroup : novaGroup // ignore: cast_nullable_to_non_nullable
as int?,additivesN: freezed == additivesN ? _self.additivesN : additivesN // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrimentsCopyWith<$Res>? get nutriments {
    if (_self.nutriments == null) {
    return null;
  }

  return $NutrimentsCopyWith<$Res>(_self.nutriments!, (value) {
    return _then(_self.copyWith(nutriments: value));
  });
}
}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "brands")  String? brands, @JsonKey(name: "image_front_small_url")  String? imageFrontSmallUrl, @JsonKey(name: "nutrient_levels_tags")  List<String>? nutrientLevelsTags, @JsonKey(name: "nutriments")  Nutriments? nutriments, @JsonKey(name: "nutriscore_grade")  String? nutriscoreGrade, @JsonKey(name: "nutriscore_score")  int? nutriscoreScore, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "nova_group")  int? novaGroup, @JsonKey(name: "additives_n")  int? additivesN)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.brands,_that.imageFrontSmallUrl,_that.nutrientLevelsTags,_that.nutriments,_that.nutriscoreGrade,_that.nutriscoreScore,_that.productName,_that.novaGroup,_that.additivesN);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "brands")  String? brands, @JsonKey(name: "image_front_small_url")  String? imageFrontSmallUrl, @JsonKey(name: "nutrient_levels_tags")  List<String>? nutrientLevelsTags, @JsonKey(name: "nutriments")  Nutriments? nutriments, @JsonKey(name: "nutriscore_grade")  String? nutriscoreGrade, @JsonKey(name: "nutriscore_score")  int? nutriscoreScore, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "nova_group")  int? novaGroup, @JsonKey(name: "additives_n")  int? additivesN)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.brands,_that.imageFrontSmallUrl,_that.nutrientLevelsTags,_that.nutriments,_that.nutriscoreGrade,_that.nutriscoreScore,_that.productName,_that.novaGroup,_that.additivesN);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "brands")  String? brands, @JsonKey(name: "image_front_small_url")  String? imageFrontSmallUrl, @JsonKey(name: "nutrient_levels_tags")  List<String>? nutrientLevelsTags, @JsonKey(name: "nutriments")  Nutriments? nutriments, @JsonKey(name: "nutriscore_grade")  String? nutriscoreGrade, @JsonKey(name: "nutriscore_score")  int? nutriscoreScore, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "nova_group")  int? novaGroup, @JsonKey(name: "additives_n")  int? additivesN)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.brands,_that.imageFrontSmallUrl,_that.nutrientLevelsTags,_that.nutriments,_that.nutriscoreGrade,_that.nutriscoreScore,_that.productName,_that.novaGroup,_that.additivesN);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product implements Product {
  const _Product({@JsonKey(name: "brands") this.brands, @JsonKey(name: "image_front_small_url") this.imageFrontSmallUrl, @JsonKey(name: "nutrient_levels_tags") final  List<String>? nutrientLevelsTags, @JsonKey(name: "nutriments") this.nutriments, @JsonKey(name: "nutriscore_grade") this.nutriscoreGrade, @JsonKey(name: "nutriscore_score") this.nutriscoreScore, @JsonKey(name: "product_name") this.productName, @JsonKey(name: "nova_group") this.novaGroup, @JsonKey(name: "additives_n") this.additivesN}): _nutrientLevelsTags = nutrientLevelsTags;
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override@JsonKey(name: "brands") final  String? brands;
@override@JsonKey(name: "image_front_small_url") final  String? imageFrontSmallUrl;
 final  List<String>? _nutrientLevelsTags;
@override@JsonKey(name: "nutrient_levels_tags") List<String>? get nutrientLevelsTags {
  final value = _nutrientLevelsTags;
  if (value == null) return null;
  if (_nutrientLevelsTags is EqualUnmodifiableListView) return _nutrientLevelsTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "nutriments") final  Nutriments? nutriments;
@override@JsonKey(name: "nutriscore_grade") final  String? nutriscoreGrade;
@override@JsonKey(name: "nutriscore_score") final  int? nutriscoreScore;
@override@JsonKey(name: "product_name") final  String? productName;
// Added fields for NutriLens scoring
@override@JsonKey(name: "nova_group") final  int? novaGroup;
@override@JsonKey(name: "additives_n") final  int? additivesN;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.brands, brands) || other.brands == brands)&&(identical(other.imageFrontSmallUrl, imageFrontSmallUrl) || other.imageFrontSmallUrl == imageFrontSmallUrl)&&const DeepCollectionEquality().equals(other._nutrientLevelsTags, _nutrientLevelsTags)&&(identical(other.nutriments, nutriments) || other.nutriments == nutriments)&&(identical(other.nutriscoreGrade, nutriscoreGrade) || other.nutriscoreGrade == nutriscoreGrade)&&(identical(other.nutriscoreScore, nutriscoreScore) || other.nutriscoreScore == nutriscoreScore)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.novaGroup, novaGroup) || other.novaGroup == novaGroup)&&(identical(other.additivesN, additivesN) || other.additivesN == additivesN));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brands,imageFrontSmallUrl,const DeepCollectionEquality().hash(_nutrientLevelsTags),nutriments,nutriscoreGrade,nutriscoreScore,productName,novaGroup,additivesN);

@override
String toString() {
  return 'Product(brands: $brands, imageFrontSmallUrl: $imageFrontSmallUrl, nutrientLevelsTags: $nutrientLevelsTags, nutriments: $nutriments, nutriscoreGrade: $nutriscoreGrade, nutriscoreScore: $nutriscoreScore, productName: $productName, novaGroup: $novaGroup, additivesN: $additivesN)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "brands") String? brands,@JsonKey(name: "image_front_small_url") String? imageFrontSmallUrl,@JsonKey(name: "nutrient_levels_tags") List<String>? nutrientLevelsTags,@JsonKey(name: "nutriments") Nutriments? nutriments,@JsonKey(name: "nutriscore_grade") String? nutriscoreGrade,@JsonKey(name: "nutriscore_score") int? nutriscoreScore,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "nova_group") int? novaGroup,@JsonKey(name: "additives_n") int? additivesN
});


@override $NutrimentsCopyWith<$Res>? get nutriments;

}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? brands = freezed,Object? imageFrontSmallUrl = freezed,Object? nutrientLevelsTags = freezed,Object? nutriments = freezed,Object? nutriscoreGrade = freezed,Object? nutriscoreScore = freezed,Object? productName = freezed,Object? novaGroup = freezed,Object? additivesN = freezed,}) {
  return _then(_Product(
brands: freezed == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as String?,imageFrontSmallUrl: freezed == imageFrontSmallUrl ? _self.imageFrontSmallUrl : imageFrontSmallUrl // ignore: cast_nullable_to_non_nullable
as String?,nutrientLevelsTags: freezed == nutrientLevelsTags ? _self._nutrientLevelsTags : nutrientLevelsTags // ignore: cast_nullable_to_non_nullable
as List<String>?,nutriments: freezed == nutriments ? _self.nutriments : nutriments // ignore: cast_nullable_to_non_nullable
as Nutriments?,nutriscoreGrade: freezed == nutriscoreGrade ? _self.nutriscoreGrade : nutriscoreGrade // ignore: cast_nullable_to_non_nullable
as String?,nutriscoreScore: freezed == nutriscoreScore ? _self.nutriscoreScore : nutriscoreScore // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,novaGroup: freezed == novaGroup ? _self.novaGroup : novaGroup // ignore: cast_nullable_to_non_nullable
as int?,additivesN: freezed == additivesN ? _self.additivesN : additivesN // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrimentsCopyWith<$Res>? get nutriments {
    if (_self.nutriments == null) {
    return null;
  }

  return $NutrimentsCopyWith<$Res>(_self.nutriments!, (value) {
    return _then(_self.copyWith(nutriments: value));
  });
}
}


/// @nodoc
mixin _$Nutriments {

@JsonKey(name: "fat") double? get fat;@JsonKey(name: "fiber") double? get fiber;@JsonKey(name: "salt") double? get salt;@JsonKey(name: "saturated-fat") double? get saturatedFat;@JsonKey(name: "sodium") double? get sodium;@JsonKey(name: "sugars") double? get sugars;// Added fields for fallback calculation
@JsonKey(name: "energy-kcal") double? get energyKcal;@JsonKey(name: "proteins") double? get proteins;// Per 100g values (more reliable)
@JsonKey(name: "fat_100g") double? get fat100g;@JsonKey(name: "fiber_100g") double? get fiber100g;@JsonKey(name: "salt_100g") double? get salt100g;@JsonKey(name: "saturated-fat_100g") double? get saturatedFat100g;@JsonKey(name: "sodium_100g") double? get sodium100g;@JsonKey(name: "sugars_100g") double? get sugars100g;@JsonKey(name: "energy-kcal_100g") double? get energyKcal100g;@JsonKey(name: "proteins_100g") double? get proteins100g;
/// Create a copy of Nutriments
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrimentsCopyWith<Nutriments> get copyWith => _$NutrimentsCopyWithImpl<Nutriments>(this as Nutriments, _$identity);

  /// Serializes this Nutriments to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Nutriments&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.fiber, fiber) || other.fiber == fiber)&&(identical(other.salt, salt) || other.salt == salt)&&(identical(other.saturatedFat, saturatedFat) || other.saturatedFat == saturatedFat)&&(identical(other.sodium, sodium) || other.sodium == sodium)&&(identical(other.sugars, sugars) || other.sugars == sugars)&&(identical(other.energyKcal, energyKcal) || other.energyKcal == energyKcal)&&(identical(other.proteins, proteins) || other.proteins == proteins)&&(identical(other.fat100g, fat100g) || other.fat100g == fat100g)&&(identical(other.fiber100g, fiber100g) || other.fiber100g == fiber100g)&&(identical(other.salt100g, salt100g) || other.salt100g == salt100g)&&(identical(other.saturatedFat100g, saturatedFat100g) || other.saturatedFat100g == saturatedFat100g)&&(identical(other.sodium100g, sodium100g) || other.sodium100g == sodium100g)&&(identical(other.sugars100g, sugars100g) || other.sugars100g == sugars100g)&&(identical(other.energyKcal100g, energyKcal100g) || other.energyKcal100g == energyKcal100g)&&(identical(other.proteins100g, proteins100g) || other.proteins100g == proteins100g));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fat,fiber,salt,saturatedFat,sodium,sugars,energyKcal,proteins,fat100g,fiber100g,salt100g,saturatedFat100g,sodium100g,sugars100g,energyKcal100g,proteins100g);

@override
String toString() {
  return 'Nutriments(fat: $fat, fiber: $fiber, salt: $salt, saturatedFat: $saturatedFat, sodium: $sodium, sugars: $sugars, energyKcal: $energyKcal, proteins: $proteins, fat100g: $fat100g, fiber100g: $fiber100g, salt100g: $salt100g, saturatedFat100g: $saturatedFat100g, sodium100g: $sodium100g, sugars100g: $sugars100g, energyKcal100g: $energyKcal100g, proteins100g: $proteins100g)';
}


}

/// @nodoc
abstract mixin class $NutrimentsCopyWith<$Res>  {
  factory $NutrimentsCopyWith(Nutriments value, $Res Function(Nutriments) _then) = _$NutrimentsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "fat") double? fat,@JsonKey(name: "fiber") double? fiber,@JsonKey(name: "salt") double? salt,@JsonKey(name: "saturated-fat") double? saturatedFat,@JsonKey(name: "sodium") double? sodium,@JsonKey(name: "sugars") double? sugars,@JsonKey(name: "energy-kcal") double? energyKcal,@JsonKey(name: "proteins") double? proteins,@JsonKey(name: "fat_100g") double? fat100g,@JsonKey(name: "fiber_100g") double? fiber100g,@JsonKey(name: "salt_100g") double? salt100g,@JsonKey(name: "saturated-fat_100g") double? saturatedFat100g,@JsonKey(name: "sodium_100g") double? sodium100g,@JsonKey(name: "sugars_100g") double? sugars100g,@JsonKey(name: "energy-kcal_100g") double? energyKcal100g,@JsonKey(name: "proteins_100g") double? proteins100g
});




}
/// @nodoc
class _$NutrimentsCopyWithImpl<$Res>
    implements $NutrimentsCopyWith<$Res> {
  _$NutrimentsCopyWithImpl(this._self, this._then);

  final Nutriments _self;
  final $Res Function(Nutriments) _then;

/// Create a copy of Nutriments
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fat = freezed,Object? fiber = freezed,Object? salt = freezed,Object? saturatedFat = freezed,Object? sodium = freezed,Object? sugars = freezed,Object? energyKcal = freezed,Object? proteins = freezed,Object? fat100g = freezed,Object? fiber100g = freezed,Object? salt100g = freezed,Object? saturatedFat100g = freezed,Object? sodium100g = freezed,Object? sugars100g = freezed,Object? energyKcal100g = freezed,Object? proteins100g = freezed,}) {
  return _then(_self.copyWith(
fat: freezed == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double?,fiber: freezed == fiber ? _self.fiber : fiber // ignore: cast_nullable_to_non_nullable
as double?,salt: freezed == salt ? _self.salt : salt // ignore: cast_nullable_to_non_nullable
as double?,saturatedFat: freezed == saturatedFat ? _self.saturatedFat : saturatedFat // ignore: cast_nullable_to_non_nullable
as double?,sodium: freezed == sodium ? _self.sodium : sodium // ignore: cast_nullable_to_non_nullable
as double?,sugars: freezed == sugars ? _self.sugars : sugars // ignore: cast_nullable_to_non_nullable
as double?,energyKcal: freezed == energyKcal ? _self.energyKcal : energyKcal // ignore: cast_nullable_to_non_nullable
as double?,proteins: freezed == proteins ? _self.proteins : proteins // ignore: cast_nullable_to_non_nullable
as double?,fat100g: freezed == fat100g ? _self.fat100g : fat100g // ignore: cast_nullable_to_non_nullable
as double?,fiber100g: freezed == fiber100g ? _self.fiber100g : fiber100g // ignore: cast_nullable_to_non_nullable
as double?,salt100g: freezed == salt100g ? _self.salt100g : salt100g // ignore: cast_nullable_to_non_nullable
as double?,saturatedFat100g: freezed == saturatedFat100g ? _self.saturatedFat100g : saturatedFat100g // ignore: cast_nullable_to_non_nullable
as double?,sodium100g: freezed == sodium100g ? _self.sodium100g : sodium100g // ignore: cast_nullable_to_non_nullable
as double?,sugars100g: freezed == sugars100g ? _self.sugars100g : sugars100g // ignore: cast_nullable_to_non_nullable
as double?,energyKcal100g: freezed == energyKcal100g ? _self.energyKcal100g : energyKcal100g // ignore: cast_nullable_to_non_nullable
as double?,proteins100g: freezed == proteins100g ? _self.proteins100g : proteins100g // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Nutriments].
extension NutrimentsPatterns on Nutriments {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Nutriments value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Nutriments() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Nutriments value)  $default,){
final _that = this;
switch (_that) {
case _Nutriments():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Nutriments value)?  $default,){
final _that = this;
switch (_that) {
case _Nutriments() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "fat")  double? fat, @JsonKey(name: "fiber")  double? fiber, @JsonKey(name: "salt")  double? salt, @JsonKey(name: "saturated-fat")  double? saturatedFat, @JsonKey(name: "sodium")  double? sodium, @JsonKey(name: "sugars")  double? sugars, @JsonKey(name: "energy-kcal")  double? energyKcal, @JsonKey(name: "proteins")  double? proteins, @JsonKey(name: "fat_100g")  double? fat100g, @JsonKey(name: "fiber_100g")  double? fiber100g, @JsonKey(name: "salt_100g")  double? salt100g, @JsonKey(name: "saturated-fat_100g")  double? saturatedFat100g, @JsonKey(name: "sodium_100g")  double? sodium100g, @JsonKey(name: "sugars_100g")  double? sugars100g, @JsonKey(name: "energy-kcal_100g")  double? energyKcal100g, @JsonKey(name: "proteins_100g")  double? proteins100g)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Nutriments() when $default != null:
return $default(_that.fat,_that.fiber,_that.salt,_that.saturatedFat,_that.sodium,_that.sugars,_that.energyKcal,_that.proteins,_that.fat100g,_that.fiber100g,_that.salt100g,_that.saturatedFat100g,_that.sodium100g,_that.sugars100g,_that.energyKcal100g,_that.proteins100g);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "fat")  double? fat, @JsonKey(name: "fiber")  double? fiber, @JsonKey(name: "salt")  double? salt, @JsonKey(name: "saturated-fat")  double? saturatedFat, @JsonKey(name: "sodium")  double? sodium, @JsonKey(name: "sugars")  double? sugars, @JsonKey(name: "energy-kcal")  double? energyKcal, @JsonKey(name: "proteins")  double? proteins, @JsonKey(name: "fat_100g")  double? fat100g, @JsonKey(name: "fiber_100g")  double? fiber100g, @JsonKey(name: "salt_100g")  double? salt100g, @JsonKey(name: "saturated-fat_100g")  double? saturatedFat100g, @JsonKey(name: "sodium_100g")  double? sodium100g, @JsonKey(name: "sugars_100g")  double? sugars100g, @JsonKey(name: "energy-kcal_100g")  double? energyKcal100g, @JsonKey(name: "proteins_100g")  double? proteins100g)  $default,) {final _that = this;
switch (_that) {
case _Nutriments():
return $default(_that.fat,_that.fiber,_that.salt,_that.saturatedFat,_that.sodium,_that.sugars,_that.energyKcal,_that.proteins,_that.fat100g,_that.fiber100g,_that.salt100g,_that.saturatedFat100g,_that.sodium100g,_that.sugars100g,_that.energyKcal100g,_that.proteins100g);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "fat")  double? fat, @JsonKey(name: "fiber")  double? fiber, @JsonKey(name: "salt")  double? salt, @JsonKey(name: "saturated-fat")  double? saturatedFat, @JsonKey(name: "sodium")  double? sodium, @JsonKey(name: "sugars")  double? sugars, @JsonKey(name: "energy-kcal")  double? energyKcal, @JsonKey(name: "proteins")  double? proteins, @JsonKey(name: "fat_100g")  double? fat100g, @JsonKey(name: "fiber_100g")  double? fiber100g, @JsonKey(name: "salt_100g")  double? salt100g, @JsonKey(name: "saturated-fat_100g")  double? saturatedFat100g, @JsonKey(name: "sodium_100g")  double? sodium100g, @JsonKey(name: "sugars_100g")  double? sugars100g, @JsonKey(name: "energy-kcal_100g")  double? energyKcal100g, @JsonKey(name: "proteins_100g")  double? proteins100g)?  $default,) {final _that = this;
switch (_that) {
case _Nutriments() when $default != null:
return $default(_that.fat,_that.fiber,_that.salt,_that.saturatedFat,_that.sodium,_that.sugars,_that.energyKcal,_that.proteins,_that.fat100g,_that.fiber100g,_that.salt100g,_that.saturatedFat100g,_that.sodium100g,_that.sugars100g,_that.energyKcal100g,_that.proteins100g);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Nutriments implements Nutriments {
  const _Nutriments({@JsonKey(name: "fat") this.fat, @JsonKey(name: "fiber") this.fiber, @JsonKey(name: "salt") this.salt, @JsonKey(name: "saturated-fat") this.saturatedFat, @JsonKey(name: "sodium") this.sodium, @JsonKey(name: "sugars") this.sugars, @JsonKey(name: "energy-kcal") this.energyKcal, @JsonKey(name: "proteins") this.proteins, @JsonKey(name: "fat_100g") this.fat100g, @JsonKey(name: "fiber_100g") this.fiber100g, @JsonKey(name: "salt_100g") this.salt100g, @JsonKey(name: "saturated-fat_100g") this.saturatedFat100g, @JsonKey(name: "sodium_100g") this.sodium100g, @JsonKey(name: "sugars_100g") this.sugars100g, @JsonKey(name: "energy-kcal_100g") this.energyKcal100g, @JsonKey(name: "proteins_100g") this.proteins100g});
  factory _Nutriments.fromJson(Map<String, dynamic> json) => _$NutrimentsFromJson(json);

@override@JsonKey(name: "fat") final  double? fat;
@override@JsonKey(name: "fiber") final  double? fiber;
@override@JsonKey(name: "salt") final  double? salt;
@override@JsonKey(name: "saturated-fat") final  double? saturatedFat;
@override@JsonKey(name: "sodium") final  double? sodium;
@override@JsonKey(name: "sugars") final  double? sugars;
// Added fields for fallback calculation
@override@JsonKey(name: "energy-kcal") final  double? energyKcal;
@override@JsonKey(name: "proteins") final  double? proteins;
// Per 100g values (more reliable)
@override@JsonKey(name: "fat_100g") final  double? fat100g;
@override@JsonKey(name: "fiber_100g") final  double? fiber100g;
@override@JsonKey(name: "salt_100g") final  double? salt100g;
@override@JsonKey(name: "saturated-fat_100g") final  double? saturatedFat100g;
@override@JsonKey(name: "sodium_100g") final  double? sodium100g;
@override@JsonKey(name: "sugars_100g") final  double? sugars100g;
@override@JsonKey(name: "energy-kcal_100g") final  double? energyKcal100g;
@override@JsonKey(name: "proteins_100g") final  double? proteins100g;

/// Create a copy of Nutriments
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrimentsCopyWith<_Nutriments> get copyWith => __$NutrimentsCopyWithImpl<_Nutriments>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutrimentsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Nutriments&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.fiber, fiber) || other.fiber == fiber)&&(identical(other.salt, salt) || other.salt == salt)&&(identical(other.saturatedFat, saturatedFat) || other.saturatedFat == saturatedFat)&&(identical(other.sodium, sodium) || other.sodium == sodium)&&(identical(other.sugars, sugars) || other.sugars == sugars)&&(identical(other.energyKcal, energyKcal) || other.energyKcal == energyKcal)&&(identical(other.proteins, proteins) || other.proteins == proteins)&&(identical(other.fat100g, fat100g) || other.fat100g == fat100g)&&(identical(other.fiber100g, fiber100g) || other.fiber100g == fiber100g)&&(identical(other.salt100g, salt100g) || other.salt100g == salt100g)&&(identical(other.saturatedFat100g, saturatedFat100g) || other.saturatedFat100g == saturatedFat100g)&&(identical(other.sodium100g, sodium100g) || other.sodium100g == sodium100g)&&(identical(other.sugars100g, sugars100g) || other.sugars100g == sugars100g)&&(identical(other.energyKcal100g, energyKcal100g) || other.energyKcal100g == energyKcal100g)&&(identical(other.proteins100g, proteins100g) || other.proteins100g == proteins100g));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fat,fiber,salt,saturatedFat,sodium,sugars,energyKcal,proteins,fat100g,fiber100g,salt100g,saturatedFat100g,sodium100g,sugars100g,energyKcal100g,proteins100g);

@override
String toString() {
  return 'Nutriments(fat: $fat, fiber: $fiber, salt: $salt, saturatedFat: $saturatedFat, sodium: $sodium, sugars: $sugars, energyKcal: $energyKcal, proteins: $proteins, fat100g: $fat100g, fiber100g: $fiber100g, salt100g: $salt100g, saturatedFat100g: $saturatedFat100g, sodium100g: $sodium100g, sugars100g: $sugars100g, energyKcal100g: $energyKcal100g, proteins100g: $proteins100g)';
}


}

/// @nodoc
abstract mixin class _$NutrimentsCopyWith<$Res> implements $NutrimentsCopyWith<$Res> {
  factory _$NutrimentsCopyWith(_Nutriments value, $Res Function(_Nutriments) _then) = __$NutrimentsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "fat") double? fat,@JsonKey(name: "fiber") double? fiber,@JsonKey(name: "salt") double? salt,@JsonKey(name: "saturated-fat") double? saturatedFat,@JsonKey(name: "sodium") double? sodium,@JsonKey(name: "sugars") double? sugars,@JsonKey(name: "energy-kcal") double? energyKcal,@JsonKey(name: "proteins") double? proteins,@JsonKey(name: "fat_100g") double? fat100g,@JsonKey(name: "fiber_100g") double? fiber100g,@JsonKey(name: "salt_100g") double? salt100g,@JsonKey(name: "saturated-fat_100g") double? saturatedFat100g,@JsonKey(name: "sodium_100g") double? sodium100g,@JsonKey(name: "sugars_100g") double? sugars100g,@JsonKey(name: "energy-kcal_100g") double? energyKcal100g,@JsonKey(name: "proteins_100g") double? proteins100g
});




}
/// @nodoc
class __$NutrimentsCopyWithImpl<$Res>
    implements _$NutrimentsCopyWith<$Res> {
  __$NutrimentsCopyWithImpl(this._self, this._then);

  final _Nutriments _self;
  final $Res Function(_Nutriments) _then;

/// Create a copy of Nutriments
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fat = freezed,Object? fiber = freezed,Object? salt = freezed,Object? saturatedFat = freezed,Object? sodium = freezed,Object? sugars = freezed,Object? energyKcal = freezed,Object? proteins = freezed,Object? fat100g = freezed,Object? fiber100g = freezed,Object? salt100g = freezed,Object? saturatedFat100g = freezed,Object? sodium100g = freezed,Object? sugars100g = freezed,Object? energyKcal100g = freezed,Object? proteins100g = freezed,}) {
  return _then(_Nutriments(
fat: freezed == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double?,fiber: freezed == fiber ? _self.fiber : fiber // ignore: cast_nullable_to_non_nullable
as double?,salt: freezed == salt ? _self.salt : salt // ignore: cast_nullable_to_non_nullable
as double?,saturatedFat: freezed == saturatedFat ? _self.saturatedFat : saturatedFat // ignore: cast_nullable_to_non_nullable
as double?,sodium: freezed == sodium ? _self.sodium : sodium // ignore: cast_nullable_to_non_nullable
as double?,sugars: freezed == sugars ? _self.sugars : sugars // ignore: cast_nullable_to_non_nullable
as double?,energyKcal: freezed == energyKcal ? _self.energyKcal : energyKcal // ignore: cast_nullable_to_non_nullable
as double?,proteins: freezed == proteins ? _self.proteins : proteins // ignore: cast_nullable_to_non_nullable
as double?,fat100g: freezed == fat100g ? _self.fat100g : fat100g // ignore: cast_nullable_to_non_nullable
as double?,fiber100g: freezed == fiber100g ? _self.fiber100g : fiber100g // ignore: cast_nullable_to_non_nullable
as double?,salt100g: freezed == salt100g ? _self.salt100g : salt100g // ignore: cast_nullable_to_non_nullable
as double?,saturatedFat100g: freezed == saturatedFat100g ? _self.saturatedFat100g : saturatedFat100g // ignore: cast_nullable_to_non_nullable
as double?,sodium100g: freezed == sodium100g ? _self.sodium100g : sodium100g // ignore: cast_nullable_to_non_nullable
as double?,sugars100g: freezed == sugars100g ? _self.sugars100g : sugars100g // ignore: cast_nullable_to_non_nullable
as double?,energyKcal100g: freezed == energyKcal100g ? _self.energyKcal100g : energyKcal100g // ignore: cast_nullable_to_non_nullable
as double?,proteins100g: freezed == proteins100g ? _self.proteins100g : proteins100g // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
