import 'package:fpdart/fpdart.dart';
import 'package:neutri_lens/app/modules/result/data/models/get_suggested_product/get_suggested_product_model.dart';
import 'package:neutri_lens/app/modules/result/data/models/upload_product_record/upload_product_record_model.dart';

import '../../../../core/data/exceptions/app_exceptions.dart';
import '../models/get_product_result_model/get_product_result_model.dart';

abstract interface class ProductRepository {
  //Future<Either<AppException, GetProductResultModel>> getAllProducts();
  Future<Either<AppException, bool>> uploadScannedProduct(UploadProductRecordModel uploadProductRecordModel);
  Future<Either<AppException, List<GetSuggestedProductModel>>> getSuggestedProducts({required String qrCode});
  Future<Either<AppException, GetProductResultModel>> getProductResult({
    required String barCode,
  });
}
