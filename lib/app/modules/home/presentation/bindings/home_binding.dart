import 'package:get/get.dart';
import 'package:neutri_lens/app/modules/home/data/repository/products_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsRepository>(() => ProductsRepository());
  }
}
