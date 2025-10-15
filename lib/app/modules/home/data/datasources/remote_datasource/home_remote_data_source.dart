import 'package:neutri_lens/app/modules/home/data/models/get_all_products_model.dart';

abstract class HomeRemoteDataSource {
  Future<GetAllProductsModel> getProducts({int page = 1, int pageSize = 20});
  Future<GetAllProductsModel> searchProducts({
    required String query,
    int page = 1,
    int pagesize = 20,
  });
}
