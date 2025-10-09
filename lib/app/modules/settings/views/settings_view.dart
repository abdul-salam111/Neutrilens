import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:neutri_lens/app/core/core.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: false),
      body: Padding(
        padding: screenPadding,
        child: Column(
          crossAxisAlignment: crossAxisStart,
          children: [
            heightBox(20),
            Text(
              "Selected Goals",
              style: context.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            heightBox(10),
            SizedBox(
              height: context.screenHeight * 0.34,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Obx(
                    () => CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(vertical: -4),
                      controlAffinity: ListTileControlAffinity.leading,
                      checkColor: AppColors.blackTextColor,
                      side: BorderSide(color: AppColors.blackTextColor),
                      activeColor: AppColors.appPrimaryColor,
                      title: Text(
                        controller.goals[index],
                        style: context.bodyMedium!.copyWith(),
                      ),
                      value: controller.selectedGoalsIndex.contains(index)
                          ? true
                          : false,
                      onChanged: (bool? value) {},
                    ),
                  );
                },
                itemCount: controller.goals.length,
              ),
            ),

            Text(
              "Allergens to Avoid",
              style: context.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Obx(
              () => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: controller.allergensToAvoid.map((item) {
                  final isSelected = controller.selectedAllergens.contains(
                    item,
                  );
                  return ChoiceChip(
                    side: BorderSide(color: Colors.transparent),
                    checkmarkColor: Colors.black,
                    backgroundColor: AppColors.lightGreyColor,
                    label: Text(item, style: context.bodyMedium),
                    selected: isSelected,
                    selectedColor: Colors.orange,
                    onSelected: (_) {},
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
