// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_trends_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetTrendsModel {

@JsonKey(name: "good_pick_avg") double? get goodPickAvg;@JsonKey(name: "medium_pick_avg") double? get mediumPickAvg;@JsonKey(name: "poor_pick_avg") double? get poorPickAvg;@JsonKey(name: "trend") List<Trend>? get trend;
/// Create a copy of GetTrendsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTrendsModelCopyWith<GetTrendsModel> get copyWith => _$GetTrendsModelCopyWithImpl<GetTrendsModel>(this as GetTrendsModel, _$identity);

  /// Serializes this GetTrendsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTrendsModel&&(identical(other.goodPickAvg, goodPickAvg) || other.goodPickAvg == goodPickAvg)&&(identical(other.mediumPickAvg, mediumPickAvg) || other.mediumPickAvg == mediumPickAvg)&&(identical(other.poorPickAvg, poorPickAvg) || other.poorPickAvg == poorPickAvg)&&const DeepCollectionEquality().equals(other.trend, trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goodPickAvg,mediumPickAvg,poorPickAvg,const DeepCollectionEquality().hash(trend));

@override
String toString() {
  return 'GetTrendsModel(goodPickAvg: $goodPickAvg, mediumPickAvg: $mediumPickAvg, poorPickAvg: $poorPickAvg, trend: $trend)';
}


}

/// @nodoc
abstract mixin class $GetTrendsModelCopyWith<$Res>  {
  factory $GetTrendsModelCopyWith(GetTrendsModel value, $Res Function(GetTrendsModel) _then) = _$GetTrendsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "good_pick_avg") double? goodPickAvg,@JsonKey(name: "medium_pick_avg") double? mediumPickAvg,@JsonKey(name: "poor_pick_avg") double? poorPickAvg,@JsonKey(name: "trend") List<Trend>? trend
});




}
/// @nodoc
class _$GetTrendsModelCopyWithImpl<$Res>
    implements $GetTrendsModelCopyWith<$Res> {
  _$GetTrendsModelCopyWithImpl(this._self, this._then);

  final GetTrendsModel _self;
  final $Res Function(GetTrendsModel) _then;

/// Create a copy of GetTrendsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goodPickAvg = freezed,Object? mediumPickAvg = freezed,Object? poorPickAvg = freezed,Object? trend = freezed,}) {
  return _then(_self.copyWith(
goodPickAvg: freezed == goodPickAvg ? _self.goodPickAvg : goodPickAvg // ignore: cast_nullable_to_non_nullable
as double?,mediumPickAvg: freezed == mediumPickAvg ? _self.mediumPickAvg : mediumPickAvg // ignore: cast_nullable_to_non_nullable
as double?,poorPickAvg: freezed == poorPickAvg ? _self.poorPickAvg : poorPickAvg // ignore: cast_nullable_to_non_nullable
as double?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as List<Trend>?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetTrendsModel].
extension GetTrendsModelPatterns on GetTrendsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetTrendsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetTrendsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetTrendsModel value)  $default,){
final _that = this;
switch (_that) {
case _GetTrendsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetTrendsModel value)?  $default,){
final _that = this;
switch (_that) {
case _GetTrendsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "good_pick_avg")  double? goodPickAvg, @JsonKey(name: "medium_pick_avg")  double? mediumPickAvg, @JsonKey(name: "poor_pick_avg")  double? poorPickAvg, @JsonKey(name: "trend")  List<Trend>? trend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetTrendsModel() when $default != null:
return $default(_that.goodPickAvg,_that.mediumPickAvg,_that.poorPickAvg,_that.trend);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "good_pick_avg")  double? goodPickAvg, @JsonKey(name: "medium_pick_avg")  double? mediumPickAvg, @JsonKey(name: "poor_pick_avg")  double? poorPickAvg, @JsonKey(name: "trend")  List<Trend>? trend)  $default,) {final _that = this;
switch (_that) {
case _GetTrendsModel():
return $default(_that.goodPickAvg,_that.mediumPickAvg,_that.poorPickAvg,_that.trend);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "good_pick_avg")  double? goodPickAvg, @JsonKey(name: "medium_pick_avg")  double? mediumPickAvg, @JsonKey(name: "poor_pick_avg")  double? poorPickAvg, @JsonKey(name: "trend")  List<Trend>? trend)?  $default,) {final _that = this;
switch (_that) {
case _GetTrendsModel() when $default != null:
return $default(_that.goodPickAvg,_that.mediumPickAvg,_that.poorPickAvg,_that.trend);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetTrendsModel implements GetTrendsModel {
  const _GetTrendsModel({@JsonKey(name: "good_pick_avg") this.goodPickAvg, @JsonKey(name: "medium_pick_avg") this.mediumPickAvg, @JsonKey(name: "poor_pick_avg") this.poorPickAvg, @JsonKey(name: "trend") final  List<Trend>? trend}): _trend = trend;
  factory _GetTrendsModel.fromJson(Map<String, dynamic> json) => _$GetTrendsModelFromJson(json);

@override@JsonKey(name: "good_pick_avg") final  double? goodPickAvg;
@override@JsonKey(name: "medium_pick_avg") final  double? mediumPickAvg;
@override@JsonKey(name: "poor_pick_avg") final  double? poorPickAvg;
 final  List<Trend>? _trend;
@override@JsonKey(name: "trend") List<Trend>? get trend {
  final value = _trend;
  if (value == null) return null;
  if (_trend is EqualUnmodifiableListView) return _trend;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GetTrendsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTrendsModelCopyWith<_GetTrendsModel> get copyWith => __$GetTrendsModelCopyWithImpl<_GetTrendsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetTrendsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTrendsModel&&(identical(other.goodPickAvg, goodPickAvg) || other.goodPickAvg == goodPickAvg)&&(identical(other.mediumPickAvg, mediumPickAvg) || other.mediumPickAvg == mediumPickAvg)&&(identical(other.poorPickAvg, poorPickAvg) || other.poorPickAvg == poorPickAvg)&&const DeepCollectionEquality().equals(other._trend, _trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goodPickAvg,mediumPickAvg,poorPickAvg,const DeepCollectionEquality().hash(_trend));

@override
String toString() {
  return 'GetTrendsModel(goodPickAvg: $goodPickAvg, mediumPickAvg: $mediumPickAvg, poorPickAvg: $poorPickAvg, trend: $trend)';
}


}

/// @nodoc
abstract mixin class _$GetTrendsModelCopyWith<$Res> implements $GetTrendsModelCopyWith<$Res> {
  factory _$GetTrendsModelCopyWith(_GetTrendsModel value, $Res Function(_GetTrendsModel) _then) = __$GetTrendsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "good_pick_avg") double? goodPickAvg,@JsonKey(name: "medium_pick_avg") double? mediumPickAvg,@JsonKey(name: "poor_pick_avg") double? poorPickAvg,@JsonKey(name: "trend") List<Trend>? trend
});




}
/// @nodoc
class __$GetTrendsModelCopyWithImpl<$Res>
    implements _$GetTrendsModelCopyWith<$Res> {
  __$GetTrendsModelCopyWithImpl(this._self, this._then);

  final _GetTrendsModel _self;
  final $Res Function(_GetTrendsModel) _then;

/// Create a copy of GetTrendsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goodPickAvg = freezed,Object? mediumPickAvg = freezed,Object? poorPickAvg = freezed,Object? trend = freezed,}) {
  return _then(_GetTrendsModel(
goodPickAvg: freezed == goodPickAvg ? _self.goodPickAvg : goodPickAvg // ignore: cast_nullable_to_non_nullable
as double?,mediumPickAvg: freezed == mediumPickAvg ? _self.mediumPickAvg : mediumPickAvg // ignore: cast_nullable_to_non_nullable
as double?,poorPickAvg: freezed == poorPickAvg ? _self.poorPickAvg : poorPickAvg // ignore: cast_nullable_to_non_nullable
as double?,trend: freezed == trend ? _self._trend : trend // ignore: cast_nullable_to_non_nullable
as List<Trend>?,
  ));
}


}


/// @nodoc
mixin _$Trend {

@JsonKey(name: "date") DateTime? get date;@JsonKey(name: "good_picks_count") int? get goodPicksCount;
/// Create a copy of Trend
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrendCopyWith<Trend> get copyWith => _$TrendCopyWithImpl<Trend>(this as Trend, _$identity);

  /// Serializes this Trend to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Trend&&(identical(other.date, date) || other.date == date)&&(identical(other.goodPicksCount, goodPicksCount) || other.goodPicksCount == goodPicksCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,goodPicksCount);

@override
String toString() {
  return 'Trend(date: $date, goodPicksCount: $goodPicksCount)';
}


}

/// @nodoc
abstract mixin class $TrendCopyWith<$Res>  {
  factory $TrendCopyWith(Trend value, $Res Function(Trend) _then) = _$TrendCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "date") DateTime? date,@JsonKey(name: "good_picks_count") int? goodPicksCount
});




}
/// @nodoc
class _$TrendCopyWithImpl<$Res>
    implements $TrendCopyWith<$Res> {
  _$TrendCopyWithImpl(this._self, this._then);

  final Trend _self;
  final $Res Function(Trend) _then;

/// Create a copy of Trend
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? goodPicksCount = freezed,}) {
  return _then(_self.copyWith(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,goodPicksCount: freezed == goodPicksCount ? _self.goodPicksCount : goodPicksCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Trend].
extension TrendPatterns on Trend {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Trend value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Trend() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Trend value)  $default,){
final _that = this;
switch (_that) {
case _Trend():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Trend value)?  $default,){
final _that = this;
switch (_that) {
case _Trend() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "date")  DateTime? date, @JsonKey(name: "good_picks_count")  int? goodPicksCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Trend() when $default != null:
return $default(_that.date,_that.goodPicksCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "date")  DateTime? date, @JsonKey(name: "good_picks_count")  int? goodPicksCount)  $default,) {final _that = this;
switch (_that) {
case _Trend():
return $default(_that.date,_that.goodPicksCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "date")  DateTime? date, @JsonKey(name: "good_picks_count")  int? goodPicksCount)?  $default,) {final _that = this;
switch (_that) {
case _Trend() when $default != null:
return $default(_that.date,_that.goodPicksCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Trend implements Trend {
  const _Trend({@JsonKey(name: "date") this.date, @JsonKey(name: "good_picks_count") this.goodPicksCount});
  factory _Trend.fromJson(Map<String, dynamic> json) => _$TrendFromJson(json);

@override@JsonKey(name: "date") final  DateTime? date;
@override@JsonKey(name: "good_picks_count") final  int? goodPicksCount;

/// Create a copy of Trend
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrendCopyWith<_Trend> get copyWith => __$TrendCopyWithImpl<_Trend>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrendToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Trend&&(identical(other.date, date) || other.date == date)&&(identical(other.goodPicksCount, goodPicksCount) || other.goodPicksCount == goodPicksCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,goodPicksCount);

@override
String toString() {
  return 'Trend(date: $date, goodPicksCount: $goodPicksCount)';
}


}

/// @nodoc
abstract mixin class _$TrendCopyWith<$Res> implements $TrendCopyWith<$Res> {
  factory _$TrendCopyWith(_Trend value, $Res Function(_Trend) _then) = __$TrendCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "date") DateTime? date,@JsonKey(name: "good_picks_count") int? goodPicksCount
});




}
/// @nodoc
class __$TrendCopyWithImpl<$Res>
    implements _$TrendCopyWith<$Res> {
  __$TrendCopyWithImpl(this._self, this._then);

  final _Trend _self;
  final $Res Function(_Trend) _then;

/// Create a copy of Trend
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? goodPicksCount = freezed,}) {
  return _then(_Trend(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,goodPicksCount: freezed == goodPicksCount ? _self.goodPicksCount : goodPicksCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
