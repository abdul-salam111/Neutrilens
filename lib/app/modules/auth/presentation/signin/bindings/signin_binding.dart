import 'package:get/get.dart';
import 'package:neutri_lens/app/modules/auth/data/repository_impl/user_repository_impl.dart';

import '../../../domain/repository/user_repository.dart';
import '../controllers/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl());
    Get.lazyPut<SigninController>(() => SigninController(Get.find()));
  }
}
