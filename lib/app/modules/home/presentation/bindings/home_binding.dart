import 'package:get/get.dart';
import 'package:neutri_lens/app/modules/home/data/repository/home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(() => HomeRepository());
  }
}
