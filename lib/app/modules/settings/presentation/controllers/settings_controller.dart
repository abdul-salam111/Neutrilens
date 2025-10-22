import 'package:get/get.dart';
import 'package:neutri_lens/app/core/services/session_manager.dart';
import 'package:neutri_lens/app/modules/auth/domain/repository/user_repository.dart';

import '../../../../core/utils/apptoast_util.dart';
import '../../../auth/data/models/get_goals_diet_list/get_goals_diet_list.dart';
import '../../../auth/data/models/profile_model/profile_model.dart' as profile;


class SettingsController extends GetxController {
  final RxBool isEdit = false.obs;

  final UserRepository userRepository;
  SettingsController(this.userRepository);

  final goals = <DietPreference>[].obs;
  final selectedGoalsIndex = <int>[].obs;
  final allergensToAvoid = <DietPreference>[].obs;
  final selectedAllergens = <int>[].obs;
  final isLoading = false.obs;

   getGoalsAndDietList() async {
    
    final response = await userRepository.getGoalsDietList();

    response.fold(
      (failure) {

      },
      (goalsAndDietList) {

        goals.value = goalsAndDietList.goals ?? [];
        allergensToAvoid.value = goalsAndDietList.dietPreferences ?? [];
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getGoalsAndDietList();
    final userDetails = SessionController().getUserDetails;
    selectedGoalsIndex.value = List<int>.from(userDetails.goals ?? []);
    selectedAllergens.value = List<int>.from(userDetails.dietPreferences ?? []);
  }

  Future updateProfile() async {
    isLoading.value = true;
    List<profile.DietPreference>? updategoals = selectedGoalsIndex
        .map((e) => profile.DietPreference(id: e))
        .toList();
    List<profile.DietPreference>? updatediets = selectedAllergens
        .map((e) => profile.DietPreference(id: e))
        .toList();

    final response = await userRepository.updateUser(
     profile. ProfileModel(
        fullName: SessionController().getUserDetails.fullName ?? '',
        ageFrom: SessionController().getUserDetails.ageFrom ?? 0,
        ageTo: SessionController().getUserDetails.ageTo ?? 0,
        goals: updategoals,
        dietPreferences: updatediets,
      ),
    );
    response.fold(
      (failure) {
        isLoading.value = false;
        AppToasts.showErrorToast(Get.context!, failure.toString());
      },
      (user) async {
        await SessionController().saveUserInStorage(user);
        await SessionController().getUserfromSharedpref();
        AppToasts.showSuccessToast(Get.context!, "Profile Updated");
        isLoading.value = false;
        update();
      },
    );
  }
}
