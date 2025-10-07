import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../routes/app_pages.dart';

class SplashServices {
  Future<void> isLoggedIn() async {
    await checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    try {
  
      // await SessionController().getUserfromSharedpref();
      await Future.delayed(Duration(seconds: 2));
      // if (SessionController().islogin == true) {
      //   // Get.offAllNamed(Routes.navbar);
      // } else {
      //   Get.offAllNamed(Routes.LOGIN);
      // }
      await Get.offAllNamed(Routes.ONBOARDING);
    } catch (e) {
      debugPrint('Error in checkLoginStatus: $e');
    }
  }
}
