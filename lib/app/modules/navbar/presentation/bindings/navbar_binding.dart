import 'package:get/get.dart';
import 'package:neutri_lens/app/modules/home/data/repository/products_repository.dart';
import 'package:neutri_lens/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:neutri_lens/app/modules/settings/controllers/settings_controller.dart';

import '../controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(() => NavbarController());
    Get.lazyPut<ProductsRepository>(() => ProductsRepository());
    Get.lazyPut<HomeController>(
      () => HomeController(productsRepository: Get.find()),
    );
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
