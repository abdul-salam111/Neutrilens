import 'package:fpdart/fpdart.dart';
import 'package:neutri_lens/app/modules/home/data/models/get_all_products_model.dart';
import '../../../../core/core.dart';

class ProductsRepository {
  final DioHelper _dio = DioHelper();

  Future<Either<AppException, GetAllProductsModel>> getProducts({
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final response = await _dio.getApi(
        url:
            "https://world.openfoodfacts.org/api/v2/search?page=$page&page_size=$pageSize&fields=product_name,brands,nutriment_nutrients,nutriscore_score,nutriscore_grade,image_front_small_url,quantity",
      );
      return right(GetAllProductsModel.fromJson(response));
    } catch (e) {
      return left(AppException(e.toString()));
    }
  }

  Future<Either<AppException, GetAllProductsModel>> searchProducts({
    required String query,
    int page = 1,
    int pagesize = 20,
  }) async {
    try {
      final response = await _dio.getApi(
        url:
            "https://world.openfoodfacts.org/cgi/search.pl?action=process&search_terms=$query&json=1&page=$page&page_size=$pagesize&fields=product_name,brands,nutriment_nutrients,nutriscore_score,nutriscore_grade,image_front_small_url,quantity",
      );
      return right(GetAllProductsModel.fromJson(response));
    } catch (e) {
      return left(AppException(e.toString()));
    }
  }
}
