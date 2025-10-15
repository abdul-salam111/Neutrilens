// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_suggested_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetSuggestedProductModel {

@JsonKey(name: "product_name") String? get productName;@JsonKey(name: "brand") String? get brand;@JsonKey(name: "nutrition_grade") String? get nutritionGrade;@JsonKey(name: "image_url") String? get imageUrl;
/// Create a copy of GetSuggestedProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSuggestedProductModelCopyWith<GetSuggestedProductModel> get copyWith => _$GetSuggestedProductModelCopyWithImpl<GetSuggestedProductModel>(this as GetSuggestedProductModel, _$identity);

  /// Serializes this GetSuggestedProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSuggestedProductModel&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.nutritionGrade, nutritionGrade) || other.nutritionGrade == nutritionGrade)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,brand,nutritionGrade,imageUrl);

@override
String toString() {
  return 'GetSuggestedProductModel(productName: $productName, brand: $brand, nutritionGrade: $nutritionGrade, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $GetSuggestedProductModelCopyWith<$Res>  {
  factory $GetSuggestedProductModelCopyWith(GetSuggestedProductModel value, $Res Function(GetSuggestedProductModel) _then) = _$GetSuggestedProductModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "product_name") String? productName,@JsonKey(name: "brand") String? brand,@JsonKey(name: "nutrition_grade") String? nutritionGrade,@JsonKey(name: "image_url") String? imageUrl
});




}
/// @nodoc
class _$GetSuggestedProductModelCopyWithImpl<$Res>
    implements $GetSuggestedProductModelCopyWith<$Res> {
  _$GetSuggestedProductModelCopyWithImpl(this._self, this._then);

  final GetSuggestedProductModel _self;
  final $Res Function(GetSuggestedProductModel) _then;

/// Create a copy of GetSuggestedProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productName = freezed,Object? brand = freezed,Object? nutritionGrade = freezed,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,nutritionGrade: freezed == nutritionGrade ? _self.nutritionGrade : nutritionGrade // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetSuggestedProductModel].
extension GetSuggestedProductModelPatterns on GetSuggestedProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetSuggestedProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetSuggestedProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetSuggestedProductModel value)  $default,){
final _that = this;
switch (_that) {
case _GetSuggestedProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetSuggestedProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _GetSuggestedProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "product_name")  String? productName, @JsonKey(name: "brand")  String? brand, @JsonKey(name: "nutrition_grade")  String? nutritionGrade, @JsonKey(name: "image_url")  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetSuggestedProductModel() when $default != null:
return $default(_that.productName,_that.brand,_that.nutritionGrade,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "product_name")  String? productName, @JsonKey(name: "brand")  String? brand, @JsonKey(name: "nutrition_grade")  String? nutritionGrade, @JsonKey(name: "image_url")  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _GetSuggestedProductModel():
return $default(_that.productName,_that.brand,_that.nutritionGrade,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "product_name")  String? productName, @JsonKey(name: "brand")  String? brand, @JsonKey(name: "nutrition_grade")  String? nutritionGrade, @JsonKey(name: "image_url")  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _GetSuggestedProductModel() when $default != null:
return $default(_that.productName,_that.brand,_that.nutritionGrade,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetSuggestedProductModel implements GetSuggestedProductModel {
  const _GetSuggestedProductModel({@JsonKey(name: "product_name") this.productName, @JsonKey(name: "brand") this.brand, @JsonKey(name: "nutrition_grade") this.nutritionGrade, @JsonKey(name: "image_url") this.imageUrl});
  factory _GetSuggestedProductModel.fromJson(Map<String, dynamic> json) => _$GetSuggestedProductModelFromJson(json);

@override@JsonKey(name: "product_name") final  String? productName;
@override@JsonKey(name: "brand") final  String? brand;
@override@JsonKey(name: "nutrition_grade") final  String? nutritionGrade;
@override@JsonKey(name: "image_url") final  String? imageUrl;

/// Create a copy of GetSuggestedProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetSuggestedProductModelCopyWith<_GetSuggestedProductModel> get copyWith => __$GetSuggestedProductModelCopyWithImpl<_GetSuggestedProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetSuggestedProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSuggestedProductModel&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.nutritionGrade, nutritionGrade) || other.nutritionGrade == nutritionGrade)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,brand,nutritionGrade,imageUrl);

@override
String toString() {
  return 'GetSuggestedProductModel(productName: $productName, brand: $brand, nutritionGrade: $nutritionGrade, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$GetSuggestedProductModelCopyWith<$Res> implements $GetSuggestedProductModelCopyWith<$Res> {
  factory _$GetSuggestedProductModelCopyWith(_GetSuggestedProductModel value, $Res Function(_GetSuggestedProductModel) _then) = __$GetSuggestedProductModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "product_name") String? productName,@JsonKey(name: "brand") String? brand,@JsonKey(name: "nutrition_grade") String? nutritionGrade,@JsonKey(name: "image_url") String? imageUrl
});




}
/// @nodoc
class __$GetSuggestedProductModelCopyWithImpl<$Res>
    implements _$GetSuggestedProductModelCopyWith<$Res> {
  __$GetSuggestedProductModelCopyWithImpl(this._self, this._then);

  final _GetSuggestedProductModel _self;
  final $Res Function(_GetSuggestedProductModel) _then;

/// Create a copy of GetSuggestedProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productName = freezed,Object? brand = freezed,Object? nutritionGrade = freezed,Object? imageUrl = freezed,}) {
  return _then(_GetSuggestedProductModel(
productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,nutritionGrade: freezed == nutritionGrade ? _self.nutritionGrade : nutritionGrade // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
