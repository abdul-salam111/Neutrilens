import 'package:get/get.dart';
import 'package:neutri_lens/app/modules/result/data/resppsitory/get_product_result_repo.dart';
import '../controllers/result_controller.dart';

class ResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetProductResultRepo());
    Get.put<ResultController>(ResultController(Get.find()));
  }
}
