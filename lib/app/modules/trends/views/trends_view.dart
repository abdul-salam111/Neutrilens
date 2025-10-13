import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:neutri_lens/app/core/widgets/count_down_circle.dart';
import 'package:neutri_lens/app/modules/trends/views/good_pickes_chart_widget.dart';

import '../../../core/core.dart';
import '../controllers/trends_controller.dart';

class TrendsView extends GetView<TrendsController> {
  const TrendsView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(TrendsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trends'),
        centerTitle: false,
        // actions: [
        //   GestureDetector(
        //     onTap: () {},
        //     child: CircleAvatar(
        //       backgroundColor: AppColors.lightGreyColor,
        //       child: Icon(
        //         Iconsax.notification,
        //         color: AppColors.appPrimaryColor,
        //       ),
        //     ),
        //   ),
        //   widthBox(10),
        // ],
      ),
      body: ListView(
        padding: screenPadding,
        children: [
          heightBox(10),
          Text(
            "See how your choices add up",
            style: context.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          heightBox(5),

          // InkWell(
          //   onTap: () async {
          //     final DateTime? picked = await showDatePicker(
          //       context: context,
          //       initialDate: DateTime.now(),
          //       firstDate: DateTime(2000),
          //       lastDate: DateTime(2100),
          //       builder: (context, child) {
          //         // For theming (optional)
          //         return Theme(
          //           data: Theme.of(context).copyWith(
          //             colorScheme: ColorScheme.light(
          //               primary: Colors.orange,
          //               onPrimary: Colors.white,
          //               onSurface: Colors.black,
          //             ),
          //           ),
          //           child: child!,
          //         );
          //       },
          //     );

          //     if (picked != null) {
          //       final formattedDate = DateFormat("dd-MMMM-yyyy").format(picked);
          //       controller.selectedDate.value = formattedDate;
          //     }
          //   },
          //   child: Container(
          //     width: double.infinity,
          //     height: 50,
          //     decoration: BoxDecoration(
          //       color: AppColors.lightGreyColor.withAlpha(80),
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: Padding(
          //       padding: screenPadding,
          //       child: Row(
          //         mainAxisAlignment: mainAxisSpaceBetween,
          //         children: [
          //           Obx(
          //             () => Text(
          //               controller.selectedDate.value != ""
          //                   ? controller.selectedDate.value
          //                   : DateFormat("dd-MMMM-yyyy").format(DateTime.now()),
          //               style: context.bodySmall!.copyWith(
          //                 fontWeight: FontWeight.bold,
          //                 color: AppColors.greyColor,
          //               ),
          //             ),
          //           ),
          //           Icon(
          //             Iconsax.calendar,
          //             color: AppColors.greyColor,
          //             size: 18,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          heightBox(10),
          SizedBox(
            height: context.screenHeight * 0.06,
            child: Row(
              mainAxisAlignment: mainAxisSpaceBetween,
              children: List.generate(controller.statesMode.length, (index) {
                return InkWell(
                  onTap: () {
                    controller.selectedStatesMode.value = index;
                  },
                  child: Obx(
                    () => Container(
                      width: context.screenWidth * 0.25,
                      decoration: BoxDecoration(
                        color: controller.selectedStatesMode.value == index
                            ? AppColors.appPrimaryColor
                            : AppColors.lightGreyColor.withAlpha(90),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Center(
                        child: Text(
                          controller.statesMode[index],
                          style: context.bodyMedium!.copyWith(
                            color: controller.selectedStatesMode.value == index
                                ? Colors.white
                                : Colors.black,
                            fontSize:
                                controller.selectedStatesMode.value == index
                                ? 16
                                : 15,
                            fontWeight:
                                controller.selectedStatesMode.value == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          heightBox(10),
          Container(
            padding: defaultPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightGreyColor.withAlpha(90),
            ),
            child: Row(
              crossAxisAlignment: crossAxisStart,
              children: [
                Column(
                  children: [
                    Text(
                      "Good Picks",
                      style: context.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyColor,
                      ),
                    ),
                    heightBox(20),
                    Text(
                      "72%",
                      style: context.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    heightBox(20),
                    Container(
                      padding: defaultPadding,
                      decoration: BoxDecoration(
                        color: AppColors.whiteTextColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "%12",
                            style: context.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                widthBox(30),
                Expanded(
                  child: GoodPicksChart(
                    showDots: true,
                    dataPoints: [
                      ChartDataPoint(0, 0),
                      ChartDataPoint(0, 2),
                      ChartDataPoint(0.5, 1),

                      ChartDataPoint(1, 1),

                      ChartDataPoint(2, 5),
                      ChartDataPoint(2.5, 1),
                      ChartDataPoint(3, 3.1),
                      ChartDataPoint(4, 4),
                      ChartDataPoint(4.5, 2),
                      ChartDataPoint(5, 3.5),
                    ],
                    bottomTitles: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                    leftTitles: ['0', '1', '2', '3', '4', '5'],
                    minX: 0,
                    maxX: 5,
                    minY: 0,
                    maxY: 5,
                  ),
                ),
              ],
            ),
          ),

          heightBox(10),

          Container(
            padding: defaultPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightGreyColor.withAlpha(90),
            ),
            child: Row(
              crossAxisAlignment: crossAxisStart,
              children: [
                Column(
                  children: [
                    Text(
                      "Avg FoodIQ",
                      style: context.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyColor,
                      ),
                    ),
                    heightBox(context.screenHeight * 0.1),
                    Container(
                      padding: defaultPadding,
                      decoration: BoxDecoration(
                        color: AppColors.whiteTextColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "%12",
                            style: context.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                widthBox(30),
                DaysCountdownCircle(totalValue: 100, obtainedValue: 86),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
