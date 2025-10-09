import 'package:get/get.dart';

class SettingsController extends GetxController {
  final RxList<int> selectedGoalsIndex = <int>[0, 3, 5].obs;
  final List<String> goals = [
    "Balance Eating",
    "Manage Weight",
    "Heart Health",
    "Diabetes Focus",
    "Longevity",
    "Atheletic Performance",
  ];
  var allergensToAvoid = <String>[
    "Mediterranean",
    "Vegetarian",
    "Vegan",
    "Pescatarian",
    "Paleo",
    "Keto",
    "Low FODMAP",
    "Dairy-Free",
    "Gluten-Free",
    "+Other",
  ].obs;

  var selectedAllergens = <String>["Vegetarian", "Low FODMAP", "Vegan",].obs;
  void toggleSelection(String item, RxList<String> list) {
    if (list.contains(item)) {
      list.remove(item);
    } else {
      list.add(item);
    }
  }
}
