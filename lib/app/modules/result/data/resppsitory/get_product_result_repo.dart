import 'package:fpdart/fpdart.dart';
import 'package:neutri_lens/app/core/core.dart';
import 'package:neutri_lens/app/modules/result/data/models/get_product_result_model.dart';

class GetProductResultRepo {
  static final _dio = DioHelper();
  Future<Either<AppException, GetProductResultModel>> getProductResult({
    required String barCode,
  }) async {
    try {
      final response = await _dio.getApi(
        url:
            "https://world.openfoodfacts.org/api/v2/product/$barCode?fields=product_name,brands,nutriment_nutrients,nutriscore_score,nutriscore_grade,nutrient_levels_tags,image_front_small_url,nutriments",
      );
      return right(GetProductResultModel.fromJson(response));
    } catch (e) {
      return left(AppException(e.toString()));
    }
  }
}
