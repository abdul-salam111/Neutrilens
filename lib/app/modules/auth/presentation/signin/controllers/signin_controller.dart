import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neutri_lens/app/modules/auth/data/repository/auth_repository.dart';

class SigninController extends GetxController {
  // ignore: unused_field
  final AuthRepository _authRepository;
  SigninController(this._authRepository);

    var rememberMe = false.obs;

  //form key
  final formKey = GlobalKey<FormState>();
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
