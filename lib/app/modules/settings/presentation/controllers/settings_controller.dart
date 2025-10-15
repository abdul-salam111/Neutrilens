import 'package:get/get.dart';
import 'package:neutri_lens/app/core/services/session_manager.dart';
import 'package:neutri_lens/app/modules/auth/data/repository/user_repository.dart';

import '../../../../core/core.dart';
import '../../../auth/data/models/get_goals_diet_list/get_goals_diet_list.dart';

class SettingsController extends GetxController {
  UserRepository userRepository;
  SettingsController(this.userRepository);
  final goals = <DietPreference>[].obs;
  final selectedGoalsIndex = <int>[].obs;
  final allergensToAvoid = <DietPreference>[].obs;
  final selectedAllergens = <int>[].obs;
  final isLoading = false.obs;
  void toggleSelection(String item, RxList<String> list) {
    if (list.contains(item)) {
      list.remove(item);
    } else {
      list.add(item);
    }
  }

  void getGoalsAndDietList() async {
    isLoading.value = true;

    final response = await userRepository.getGoalsDietList();

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

  @override
  void onInit() {
    super.onInit();
    getGoalsAndDietList();
    selectedGoalsIndex.value = SessionController().getUserDetails.goals ?? [];
    selectedAllergens.value =
        SessionController().getUserDetails.dietPreferences ?? [];
  }
}
