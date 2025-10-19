import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/services/session_manager.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final selectedAge = 0.obs;

  // Static Data
  final List<String> agesList = [
    "13-17",
    "18-24",
    "25-34",
    "35-44",
    "45-54",
    "55-64",
    "65+",
  ];

  @override
  void onInit() {
    super.onInit();

    final user = SessionController().getUserDetails;
    nameController.text = user.fullName ?? '';

    final userAge = user.ageFrom?.toString() ?? '';
    final index = agesList.indexWhere((age) => age.contains(userAge));
    selectedAge.value = index != -1 ? index : 0;

    emailController.text = user.username ?? '';
  }
}
