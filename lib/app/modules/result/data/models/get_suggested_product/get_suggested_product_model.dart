// To parse this JSON data, do
//
//     final getSuggestedProductModel = getSuggestedProductModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_suggested_product_model.freezed.dart';
part 'get_suggested_product_model.g.dart';

List<GetSuggestedProductModel> getSuggestedProductModelFromJson(String str) => List<GetSuggestedProductModel>.from(json.decode(str).map((x) => GetSuggestedProductModel.fromJson(x)));

String getSuggestedProductModelToJson(List<GetSuggestedProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class GetSuggestedProductModel with _$GetSuggestedProductModel {
    const factory GetSuggestedProductModel({
        @JsonKey(name: "product_name")
        String? productName,
        @JsonKey(name: "brand")
        String? brand,
        @JsonKey(name: "nutrition_grade")
        String? nutritionGrade,
        @JsonKey(name: "image_url")
        String? imageUrl,
        @JsonKey(name: "barcode")
        String? barcode,
    }) = _GetSuggestedProductModel;

    factory GetSuggestedProductModel.fromJson(Map<String, dynamic> json) => _$GetSuggestedProductModelFromJson(json);
}
