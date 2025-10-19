import 'package:fpdart/fpdart.dart';
import 'package:neutri_lens/app/core/core.dart';
import 'package:neutri_lens/app/modules/result/data/models/get_product_result_model/get_product_result_model.dart';
import 'package:neutri_lens/app/modules/result/data/models/get_suggested_product/get_suggested_product_model.dart';
import 'package:neutri_lens/app/modules/result/data/models/upload_product_record/upload_product_record_model.dart';
import 'package:neutri_lens/app/modules/result/domain/abstract_repositories/product_repository.dart';

import '../../../../core/data/local_data/secure_storage/storage.dart';

class ProductRepositoryImpl implements ProductRepository {
  static final _dio = DioHelper();
  @override
  Future<Either<AppException, GetProductResultModel>> getProductResult({
    required String barCode,
  }) async {
    try {
      final response = await _dio.getApi(
        url:
            "${ApiKeys.openfoodBaseUrl}/api/v2/product/$barCode?fields=product_name,brands,nutriment_nutrients,nutriscore_score,nutriscore_grade,nutrient_levels_tags,image_front_small_url,nutriments",
      );

      if (response['status_verbose'].toString().contains(
        "no code or invalid code",
      )) {
        return left(AppException(response['status_verbose'].toString()));
      }
      return right(GetProductResultModel.fromJson(response));
    } catch (e) {
      return left(AppException(e.toString()));
    }
  }

  @override
  Future<Either<AppException, GetSuggestedProductModel>> getSuggestedProducts({
    required String qrCode,
  }) async {
    try {
      final response = await _dio.getApi(
        url: "${ApiKeys.getSuggestedProductsUrl}$qrCode",
        authToken: await storage.readValues(StorageKeys.token),
        isAuthRequired: true,
      );
      print("${response}response is here");
      return right(GetSuggestedProductModel.fromJson(response));
    } catch (error) {
      return left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<AppException, bool>> uploadScannedProduct(
    UploadProductRecordModel uploadProductRecordModel,
  ) async {
    try {
      await _dio.postApi(
        url: ApiKeys.uploadScannedProductUrl,
        requestBody: uploadProductRecordModel.toJson(),
        authToken: await storage.readValues(StorageKeys.token),
        isAuthRequired: true,
      );
      return right(true);
    } catch (error) {
      return left(AppException(error.toString()));
    }
  }
}
