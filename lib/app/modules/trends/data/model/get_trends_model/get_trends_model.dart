// To parse this JSON data, do
//
//     final getTrendsModel = getTrendsModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_trends_model.freezed.dart';
part 'get_trends_model.g.dart';

GetTrendsModel getTrendsModelFromJson(String str) => GetTrendsModel.fromJson(json.decode(str));

String getTrendsModelToJson(GetTrendsModel data) => json.encode(data.toJson());

@freezed
abstract class GetTrendsModel with _$GetTrendsModel {
    const factory GetTrendsModel({
        @JsonKey(name: "good_pick_avg")
        double? goodPickAvg,
        @JsonKey(name: "medium_pick_avg")
        double? mediumPickAvg,
        @JsonKey(name: "poor_pick_avg")
        double? poorPickAvg,
        @JsonKey(name: "trend")
        List<Trend>? trend,
    }) = _GetTrendsModel;

    factory GetTrendsModel.fromJson(Map<String, dynamic> json) => _$GetTrendsModelFromJson(json);
}

@freezed
abstract class Trend with _$Trend {
    const factory Trend({
        @JsonKey(name: "date")
        DateTime? date,
        @JsonKey(name: "good_picks_count")
        int? goodPicksCount,
    }) = _Trend;

    factory Trend.fromJson(Map<String, dynamic> json) => _$TrendFromJson(json);
}
