import 'package:get/get.dart';
import 'package:neutri_lens/app/core/services/session_manager.dart';
import 'package:neutri_lens/app/modules/auth/data/repository/user_repository.dart';

import '../../../auth/data/models/get_goals_diet_list/get_goals_diet_list.dart';

class SettingsController extends GetxController {
  final RxBool isEdit = false.obs;

  final UserRepository userRepository;
  SettingsController(this.userRepository);

  final goals = <DietPreference>[].obs;
  final selectedGoalsIndex = <int>[].obs;
  final allergensToAvoid = <DietPreference>[].obs;
  final selectedAllergens = <int>[].obs;
  final isLoading = false.obs;

  void getGoalsAndDietList() async {
    isLoading.value = true;
    final response = await userRepository.getGoalsDietList();

    response.fold(
      (failure) {
        isLoading.value = false;
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

    // ✅ Convert to modifiable lists before assigning
    final userDetails = SessionController().getUserDetails;
    selectedGoalsIndex.value = List<int>.from(userDetails.goals ?? []);
    selectedAllergens.value = List<int>.from(userDetails.dietPreferences ?? []);
  }
}
