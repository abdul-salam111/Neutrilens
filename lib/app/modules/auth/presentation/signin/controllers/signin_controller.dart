import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neutri_lens/app/core/data/local_data/secure_storage/storage.dart';
import 'package:neutri_lens/app/core/services/session_manager.dart';
import 'package:neutri_lens/app/modules/auth/data/repository/user_repository.dart';
import 'package:neutri_lens/app/routes/app_pages.dart';

import '../../../../../core/utils/apptoast_util.dart';

class SigninController extends GetxController {
  // ignore: unused_field
  final UserRepository _authRepository;
  SigninController(this._authRepository);

  var rememberMe = false.obs;
  var isloading = false.obs;

  //form key
  final formKey = GlobalKey<FormState>();
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    isloading.value = true;
    final response = await _authRepository.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    response.fold(
      (failure) {
        isloading.value = false;

        AppToasts.showErrorToast(Get.context!, failure.toString());
      },
      (token) async {
        //call get user details api also to get user details
        await storage.setValues(StorageKeys.token, token);
        await getLoggedInUserDetails();
        isloading.value = false;
        Get.offAllNamed(Routes.NAVBAR);
      },
    );
  }

  Future<void> getLoggedInUserDetails() async {
    final response = await _authRepository.getUser();
    response.fold(
      (failure) {
        AppToasts.showErrorToast(Get.context!, failure.toString());
      },
      (user) async {
        await SessionController().saveUserInStorage(user);
        await SessionController().getUserfromSharedpref();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
