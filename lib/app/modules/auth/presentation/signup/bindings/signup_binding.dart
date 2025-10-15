import 'package:get/get.dart';

import '../../../data/repository/user_repository.dart';
import '../../../data/repository/user_repository_impl.dart';
import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl());
    Get.lazyPut<SignupController>(() => SignupController(Get.find()));
  }
}
