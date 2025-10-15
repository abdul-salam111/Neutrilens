import 'package:get/get.dart';
import 'package:neutri_lens/app/modules/result/data/resppsitory/product_repository_impl.dart';
import '../../data/resppsitory/product_repository.dart';
import '../controllers/result_controller.dart';

class ResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl());
    Get.put<ResultController>(ResultController(Get.find()));
  }
}
