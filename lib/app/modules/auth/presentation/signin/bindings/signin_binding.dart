import 'package:get/get.dart';
import 'package:neutri_lens/app/modules/auth/data/repository/auth_repository_impl.dart';

import '../../../data/repository/auth_repository.dart';
import '../controllers/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
    Get.lazyPut<SigninController>(() => SigninController(Get.find()));
  }
}
