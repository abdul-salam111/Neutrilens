import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var currentIndex = 0.obs;
  Rx<File?> profileImage = Rx<File?>(null);

  final nameController = TextEditingController();
  final disLikesController = TextEditingController();

  var selectedAge = 1.obs;

  final RxList<int> selectedGoalsIndex = <int>[].obs;

  PageController pageController = PageController();

  final List<String> agesList = [
    "13-17",
    "18-24",
    "25-34",
    "35-44",
    "45-54",
    "55-64",
    "65+",
  ];
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


  var selectedAllergens = <String>[].obs;

  void toggleSelection(String item, RxList<String> list) {
    if (list.contains(item)) {
      list.remove(item);
    } else {
      list.add(item);
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }
}
