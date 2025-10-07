// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_products_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetAllProductsModel {

@JsonKey(name: "count") int? get count;@JsonKey(name: "page") dynamic get page;@JsonKey(name: "page_count") int? get pageCount;@JsonKey(name: "page_size") int? get pageSize;@JsonKey(name: "products") List<Product>? get products;@JsonKey(name: "skip") int? get skip;
/// Create a copy of GetAllProductsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllProductsModelCopyWith<GetAllProductsModel> get copyWith => _$GetAllProductsModelCopyWithImpl<GetAllProductsModel>(this as GetAllProductsModel, _$identity);

  /// Serializes this GetAllProductsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllProductsModel&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.page, page)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.skip, skip) || other.skip == skip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,const DeepCollectionEquality().hash(page),pageCount,pageSize,const DeepCollectionEquality().hash(products),skip);

@override
String toString() {
  return 'GetAllProductsModel(count: $count, page: $page, pageCount: $pageCount, pageSize: $pageSize, products: $products, skip: $skip)';
}


}

/// @nodoc
abstract mixin class $GetAllProductsModelCopyWith<$Res>  {
  factory $GetAllProductsModelCopyWith(GetAllProductsModel value, $Res Function(GetAllProductsModel) _then) = _$GetAllProductsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "count") int? count,@JsonKey(name: "page") dynamic page,@JsonKey(name: "page_count") int? pageCount,@JsonKey(name: "page_size") int? pageSize,@JsonKey(name: "products") List<Product>? products,@JsonKey(name: "skip") int? skip
});




}
/// @nodoc
class _$GetAllProductsModelCopyWithImpl<$Res>
    implements $GetAllProductsModelCopyWith<$Res> {
  _$GetAllProductsModelCopyWithImpl(this._self, this._then);

  final GetAllProductsModel _self;
  final $Res Function(GetAllProductsModel) _then;

/// Create a copy of GetAllProductsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = freezed,Object? page = freezed,Object? pageCount = freezed,Object? pageSize = freezed,Object? products = freezed,Object? skip = freezed,}) {
  return _then(_self.copyWith(
count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as dynamic,pageCount: freezed == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,products: freezed == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>?,skip: freezed == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetAllProductsModel].
extension GetAllProductsModelPatterns on GetAllProductsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetAllProductsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetAllProductsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetAllProductsModel value)  $default,){
final _that = this;
switch (_that) {
case _GetAllProductsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetAllProductsModel value)?  $default,){
final _that = this;
switch (_that) {
case _GetAllProductsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "count")  int? count, @JsonKey(name: "page")  dynamic page, @JsonKey(name: "page_count")  int? pageCount, @JsonKey(name: "page_size")  int? pageSize, @JsonKey(name: "products")  List<Product>? products, @JsonKey(name: "skip")  int? skip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetAllProductsModel() when $default != null:
return $default(_that.count,_that.page,_that.pageCount,_that.pageSize,_that.products,_that.skip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "count")  int? count, @JsonKey(name: "page")  dynamic page, @JsonKey(name: "page_count")  int? pageCount, @JsonKey(name: "page_size")  int? pageSize, @JsonKey(name: "products")  List<Product>? products, @JsonKey(name: "skip")  int? skip)  $default,) {final _that = this;
switch (_that) {
case _GetAllProductsModel():
return $default(_that.count,_that.page,_that.pageCount,_that.pageSize,_that.products,_that.skip);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "count")  int? count, @JsonKey(name: "page")  dynamic page, @JsonKey(name: "page_count")  int? pageCount, @JsonKey(name: "page_size")  int? pageSize, @JsonKey(name: "products")  List<Product>? products, @JsonKey(name: "skip")  int? skip)?  $default,) {final _that = this;
switch (_that) {
case _GetAllProductsModel() when $default != null:
return $default(_that.count,_that.page,_that.pageCount,_that.pageSize,_that.products,_that.skip);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetAllProductsModel implements GetAllProductsModel {
  const _GetAllProductsModel({@JsonKey(name: "count") this.count, @JsonKey(name: "page") this.page, @JsonKey(name: "page_count") this.pageCount, @JsonKey(name: "page_size") this.pageSize, @JsonKey(name: "products") final  List<Product>? products, @JsonKey(name: "skip") this.skip}): _products = products;
  factory _GetAllProductsModel.fromJson(Map<String, dynamic> json) => _$GetAllProductsModelFromJson(json);

@override@JsonKey(name: "count") final  int? count;
@override@JsonKey(name: "page") final  dynamic page;
@override@JsonKey(name: "page_count") final  int? pageCount;
@override@JsonKey(name: "page_size") final  int? pageSize;
 final  List<Product>? _products;
@override@JsonKey(name: "products") List<Product>? get products {
  final value = _products;
  if (value == null) return null;
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "skip") final  int? skip;

/// Create a copy of GetAllProductsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetAllProductsModelCopyWith<_GetAllProductsModel> get copyWith => __$GetAllProductsModelCopyWithImpl<_GetAllProductsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetAllProductsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllProductsModel&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.page, page)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.skip, skip) || other.skip == skip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,const DeepCollectionEquality().hash(page),pageCount,pageSize,const DeepCollectionEquality().hash(_products),skip);

@override
String toString() {
  return 'GetAllProductsModel(count: $count, page: $page, pageCount: $pageCount, pageSize: $pageSize, products: $products, skip: $skip)';
}


}

/// @nodoc
abstract mixin class _$GetAllProductsModelCopyWith<$Res> implements $GetAllProductsModelCopyWith<$Res> {
  factory _$GetAllProductsModelCopyWith(_GetAllProductsModel value, $Res Function(_GetAllProductsModel) _then) = __$GetAllProductsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "count") int? count,@JsonKey(name: "page") dynamic page,@JsonKey(name: "page_count") int? pageCount,@JsonKey(name: "page_size") int? pageSize,@JsonKey(name: "products") List<Product>? products,@JsonKey(name: "skip") int? skip
});




}
/// @nodoc
class __$GetAllProductsModelCopyWithImpl<$Res>
    implements _$GetAllProductsModelCopyWith<$Res> {
  __$GetAllProductsModelCopyWithImpl(this._self, this._then);

  final _GetAllProductsModel _self;
  final $Res Function(_GetAllProductsModel) _then;

/// Create a copy of GetAllProductsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = freezed,Object? page = freezed,Object? pageCount = freezed,Object? pageSize = freezed,Object? products = freezed,Object? skip = freezed,}) {
  return _then(_GetAllProductsModel(
count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as dynamic,pageCount: freezed == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,products: freezed == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>?,skip: freezed == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Product {

@JsonKey(name: "brands") String? get brands;@JsonKey(name: "image_front_small_url") String? get imageFrontSmallUrl;@JsonKey(name: "nutriscore_grade") String? get nutriscoreGrade;@JsonKey(name: "nutriscore_score") dynamic get nutriscoreScore;@JsonKey(name: "product_name") String? get productName;@JsonKey(name: "quantity") String? get quantity;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.brands, brands) || other.brands == brands)&&(identical(other.imageFrontSmallUrl, imageFrontSmallUrl) || other.imageFrontSmallUrl == imageFrontSmallUrl)&&(identical(other.nutriscoreGrade, nutriscoreGrade) || other.nutriscoreGrade == nutriscoreGrade)&&const DeepCollectionEquality().equals(other.nutriscoreScore, nutriscoreScore)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brands,imageFrontSmallUrl,nutriscoreGrade,const DeepCollectionEquality().hash(nutriscoreScore),productName,quantity);

@override
String toString() {
  return 'Product(brands: $brands, imageFrontSmallUrl: $imageFrontSmallUrl, nutriscoreGrade: $nutriscoreGrade, nutriscoreScore: $nutriscoreScore, productName: $productName, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "brands") String? brands,@JsonKey(name: "image_front_small_url") String? imageFrontSmallUrl,@JsonKey(name: "nutriscore_grade") String? nutriscoreGrade,@JsonKey(name: "nutriscore_score") dynamic nutriscoreScore,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "quantity") String? quantity
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? brands = freezed,Object? imageFrontSmallUrl = freezed,Object? nutriscoreGrade = freezed,Object? nutriscoreScore = freezed,Object? productName = freezed,Object? quantity = freezed,}) {
  return _then(_self.copyWith(
brands: freezed == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as String?,imageFrontSmallUrl: freezed == imageFrontSmallUrl ? _self.imageFrontSmallUrl : imageFrontSmallUrl // ignore: cast_nullable_to_non_nullable
as String?,nutriscoreGrade: freezed == nutriscoreGrade ? _self.nutriscoreGrade : nutriscoreGrade // ignore: cast_nullable_to_non_nullable
as String?,nutriscoreScore: freezed == nutriscoreScore ? _self.nutriscoreScore : nutriscoreScore // ignore: cast_nullable_to_non_nullable
as dynamic,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "brands")  String? brands, @JsonKey(name: "image_front_small_url")  String? imageFrontSmallUrl, @JsonKey(name: "nutriscore_grade")  String? nutriscoreGrade, @JsonKey(name: "nutriscore_score")  dynamic nutriscoreScore, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "quantity")  String? quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.brands,_that.imageFrontSmallUrl,_that.nutriscoreGrade,_that.nutriscoreScore,_that.productName,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "brands")  String? brands, @JsonKey(name: "image_front_small_url")  String? imageFrontSmallUrl, @JsonKey(name: "nutriscore_grade")  String? nutriscoreGrade, @JsonKey(name: "nutriscore_score")  dynamic nutriscoreScore, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "quantity")  String? quantity)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.brands,_that.imageFrontSmallUrl,_that.nutriscoreGrade,_that.nutriscoreScore,_that.productName,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "brands")  String? brands, @JsonKey(name: "image_front_small_url")  String? imageFrontSmallUrl, @JsonKey(name: "nutriscore_grade")  String? nutriscoreGrade, @JsonKey(name: "nutriscore_score")  dynamic nutriscoreScore, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "quantity")  String? quantity)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.brands,_that.imageFrontSmallUrl,_that.nutriscoreGrade,_that.nutriscoreScore,_that.productName,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product implements Product {
  const _Product({@JsonKey(name: "brands") this.brands, @JsonKey(name: "image_front_small_url") this.imageFrontSmallUrl, @JsonKey(name: "nutriscore_grade") this.nutriscoreGrade, @JsonKey(name: "nutriscore_score") this.nutriscoreScore, @JsonKey(name: "product_name") this.productName, @JsonKey(name: "quantity") this.quantity});
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override@JsonKey(name: "brands") final  String? brands;
@override@JsonKey(name: "image_front_small_url") final  String? imageFrontSmallUrl;
@override@JsonKey(name: "nutriscore_grade") final  String? nutriscoreGrade;
@override@JsonKey(name: "nutriscore_score") final  dynamic nutriscoreScore;
@override@JsonKey(name: "product_name") final  String? productName;
@override@JsonKey(name: "quantity") final  String? quantity;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.brands, brands) || other.brands == brands)&&(identical(other.imageFrontSmallUrl, imageFrontSmallUrl) || other.imageFrontSmallUrl == imageFrontSmallUrl)&&(identical(other.nutriscoreGrade, nutriscoreGrade) || other.nutriscoreGrade == nutriscoreGrade)&&const DeepCollectionEquality().equals(other.nutriscoreScore, nutriscoreScore)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brands,imageFrontSmallUrl,nutriscoreGrade,const DeepCollectionEquality().hash(nutriscoreScore),productName,quantity);

@override
String toString() {
  return 'Product(brands: $brands, imageFrontSmallUrl: $imageFrontSmallUrl, nutriscoreGrade: $nutriscoreGrade, nutriscoreScore: $nutriscoreScore, productName: $productName, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "brands") String? brands,@JsonKey(name: "image_front_small_url") String? imageFrontSmallUrl,@JsonKey(name: "nutriscore_grade") String? nutriscoreGrade,@JsonKey(name: "nutriscore_score") dynamic nutriscoreScore,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "quantity") String? quantity
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? brands = freezed,Object? imageFrontSmallUrl = freezed,Object? nutriscoreGrade = freezed,Object? nutriscoreScore = freezed,Object? productName = freezed,Object? quantity = freezed,}) {
  return _then(_Product(
brands: freezed == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as String?,imageFrontSmallUrl: freezed == imageFrontSmallUrl ? _self.imageFrontSmallUrl : imageFrontSmallUrl // ignore: cast_nullable_to_non_nullable
as String?,nutriscoreGrade: freezed == nutriscoreGrade ? _self.nutriscoreGrade : nutriscoreGrade // ignore: cast_nullable_to_non_nullable
as String?,nutriscoreScore: freezed == nutriscoreScore ? _self.nutriscoreScore : nutriscoreScore // ignore: cast_nullable_to_non_nullable
as dynamic,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
