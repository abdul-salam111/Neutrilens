import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildChips(List<String> items, RxList<String> selectedList, controller) {
  return Obx(
    () => Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items.map((item) {
        final isSelected = selectedList.contains(item);
        return ChoiceChip(
          label: Text(item),
          selected: isSelected,
          selectedColor: Colors.orange,
          onSelected: (_) => controller.toggleSelection(item, selectedList),
        );
      }).toList(),
    ),
  );
}
