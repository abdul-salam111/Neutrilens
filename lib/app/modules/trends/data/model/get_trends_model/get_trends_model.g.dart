// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trends_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetTrendsModel _$GetTrendsModelFromJson(Map<String, dynamic> json) =>
    _GetTrendsModel(
      goodPickAvg: (json['good_pick_avg'] as num?)?.toDouble(),
      mediumPickAvg: (json['medium_pick_avg'] as num?)?.toDouble(),
      poorPickAvg: (json['poor_pick_avg'] as num?)?.toDouble(),
      trend: (json['trend'] as List<dynamic>?)
          ?.map((e) => Trend.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetTrendsModelToJson(_GetTrendsModel instance) =>
    <String, dynamic>{
      'good_pick_avg': instance.goodPickAvg,
      'medium_pick_avg': instance.mediumPickAvg,
      'poor_pick_avg': instance.poorPickAvg,
      'trend': instance.trend,
    };

_Trend _$TrendFromJson(Map<String, dynamic> json) => _Trend(
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  goodPicksCount: (json['good_picks_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$TrendToJson(_Trend instance) => <String, dynamic>{
  'date': instance.date?.toIso8601String(),
  'good_picks_count': instance.goodPicksCount,
};
