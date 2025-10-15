

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:neutri_lens/app/core/core.dart';
import 'package:neutri_lens/app/modules/auth/data/models/get_goals_diet_list/get_goals_diet_list.dart';
import 'package:neutri_lens/app/modules/auth/data/models/user_model/user_model.dart';
import 'package:neutri_lens/app/modules/auth/data/repository/user_repository.dart';

import '../../../../../routes/app_pages.dart';

class SignupController extends GetxController {
  // Dependencies
  final UserRepository authRepository;

  SignupController(this.authRepository);

  // Form State
  final key = GlobalKey<FormState>();

  // Text Controllers
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  // Page Controller
  final pageController = PageController();

  // Observable State
  final isLoading = false.obs;
  final currentIndex = 0.obs;
  final selectedAge = 1.obs;


  // Goals & Diet Preferences
  final goals = <DietPreference>[].obs;
  final selectedGoalsIndex = <int>[].obs;
  final allergensToAvoid = <DietPreference>[].obs;
  final selectedAllergens = <int>[].obs;

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
    getGoalsAndDietList();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    pageController.dispose();
    super.dispose();
  }

  // Methods
  Future<void> getGoalsAndDietList() async {
    isLoading.value = true;

    final response = await authRepository.getGoalsDietList();

    response.fold(
      (failure) {
        isLoading.value = false;
        AppToasts.showErrorToast(Get.context!, failure.toString());
      },
      (goalsAndDietList) {
        isLoading.value = false;
        goals.value = goalsAndDietList.goals ?? [];
        allergensToAvoid.value = goalsAndDietList.dietPreferences ?? [];
      },
    );
  }

  void toggleSelection(String item, RxList<String> list) {
    if (list.contains(item)) {
      list.remove(item);
    } else {
      list.add(item);
    }
  }

  void nextPage() {
    if (key.currentState?.validate() ?? false) {
      // Validation based on current page
      if (currentIndex.value == 1 && selectedGoalsIndex.isEmpty) {
        AppToasts.showErrorToast(Get.context!, "Please select your goals");
        return;
      }

      if (currentIndex.value == 2 && selectedAllergens.isEmpty) {
        AppToasts.showErrorToast(Get.context!, "Please select your allergens");
        return;
      }

      // Navigate to next page
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      AppToasts.showErrorToast(
        Get.context!,
        "Please fill in all required fields",
      );
    }
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  ////////////////Register User///////////////
  var isRegistringUser = false.obs;
  Future<void> registerUser() async {
    isRegistringUser.value = true;

    final ageRange = agesList[selectedAge.value].split("-");
    final ageFrom = int.tryParse(ageRange[0]) ?? 0;
    final ageTo = ageRange.length > 1
        ? int.tryParse(ageRange[1].replaceAll('+', '')) ?? 0
        : ageFrom;
    final response = await authRepository.signup(
      UserModel(
        username: emailController.text,
        fullName: nameController.text,
        password: passwordController.text,
        ageFrom: ageFrom,
        ageTo: ageTo,
        goals: selectedGoalsIndex,
        dietPreferences: selectedAllergens,
      ),
    );

    response.fold(
      (failure) {
        isRegistringUser.value = false;
        AppToasts.showErrorToast(Get.context!, failure.toString());
      },
      (user) async {
        isRegistringUser.value = false;
        Get.offAllNamed(Routes.SIGNIN);
        AppToasts.showSuccessToast(Get.context!, "Registration successful");
      },
    );
  }
}
