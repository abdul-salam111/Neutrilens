import 'package:get/get.dart';
import '../../../home/presentation/bindings/home_binding.dart';
import '../../../settings/presentation/bindings/settings_binding.dart';
import '../controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavbarController());
    HomeBinding().dependencies();
    SettingsBinding().dependencies();
  }
}
