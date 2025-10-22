import 'package:get/get.dart';

import '../../../auth/domain/repository/user_repository.dart';
import '../../../auth/data/repository_impl/user_repository_impl.dart';
import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>((() => UserRepositoryImpl()));
    Get.lazyPut<SettingsController>(() => SettingsController(Get.find()));
  }
}
