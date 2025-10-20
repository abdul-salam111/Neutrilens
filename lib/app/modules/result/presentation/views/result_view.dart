import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:neutri_lens/app/core/core.dart';
import 'package:neutri_lens/app/core/widgets/custom_button.dart';

import '../../../../core/utils/grade_color.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  const ResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: getGradeColor(controller.grade.value),
        body: controller.errorMessage.value == null
            ? SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: screenPadding,
                    child: Column(
                      children: [
                        heightBox(10),
                        Container(
                          height: context.screenHeight * 0.2,
                          padding: defaultPadding,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image:
                                  controller
                                              .getProductResultModel
                                              .value
                                              ?.product
                                              ?.imageFrontSmallUrl !=
                                          null &&
                                      controller
                                          .getProductResultModel
                                          .value!
                                          .product!
                                          .imageFrontSmallUrl!
                                          .isNotEmpty &&
                                      Uri.parse(
                                        controller
                                            .getProductResultModel
                                            .value!
                                            .product!
                                            .imageFrontSmallUrl!,
                                      ).isAbsolute
                                  ? CachedNetworkImageProvider(
                                      controller
                                          .getProductResultModel
                                          .value!
                                          .product!
                                          .imageFrontSmallUrl!,
                                    )
                                  : AssetImage(AppImages.appLogo)
                                        as ImageProvider,
                              fit: BoxFit.contain,
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: topLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                bottom: 0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 25,
                                  child: CircleAvatar(
                                    backgroundColor: getGradeColor(
                                      controller.grade.value,
                                    ),
                                    radius: 23,
                                    child: Icon(
                                      (controller.grade.value == "a" ||
                                              controller.grade.value == "b")
                                          ? Icons.check
                                          : controller.grade.value == "c"
                                          ? Icons.remove
                                          : Icons.close,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      size: 35,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        heightBox(10),
                        Obx(
                          () => Text(
                            "(${controller.getProductResultModel.value?.product?.productName ?? ""})",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        heightBox(5),
                        Text(
                          getGradeText(controller.grade.value),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        heightBox(10),

                        // NutriLens Score Card
                        Container(
                          padding: padding16,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: mainAxisSpaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: crossAxisStart,
                                children: [
                                  Text(
                                    "Health Score",
                                    style: context.titleMedium!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                    ),
                                  ),
                                  heightBox(5),
                                  Text(
                                    controller.grade.value == "a"
                                        ? "Excellent nutritional quality"
                                        : controller.grade.value == "b"
                                        ? "Good nutritional quality"
                                        : controller.grade.value == "c"
                                        ? "Average nutritional quality"
                                        : controller.grade.value == "d"
                                        ? "Poor nutritional quality"
                                        : "Very poor nutritional quality",
                                    style: context.bodyMedium!.copyWith(),
                                  ),
                                  heightBox(5),
                                ],
                              ),
                              Container(
                                width: 80,
                                padding: padding5,
                                decoration: BoxDecoration(
                                  color: getGradeColor(controller.grade.value),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "${controller.nutriLensScore.value.round()}%",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        heightBox(10),

                        // Score Breakdown
                        Container(
                          padding: padding16,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: crossAxisStart,
                            children: [
                              Text(
                                "Score Breakdown",
                                style: context.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              heightBox(10),
                              _buildScoreRow(
                                context,
                                "Food Quality",
                                controller.foodScore.value,
                                "70% weight",
                              ),
                              heightBox(8),
                              _buildScoreRow(
                                context,
                                "Processing Level",
                                controller.processedScore.value,
                                "30% weight",
                                isInverseScale: true,
                              ),
                              if (controller.scoreExplanation.isNotEmpty) ...[
                                heightBox(15),
                                Text(
                                  "Calculation Details:",
                                  style: context.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                heightBox(5),
                                ...controller.scoreExplanation.map(
                                  (exp) => Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      top: 2,
                                    ),
                                    child: Text(
                                      "• $exp",
                                      style: context.bodyMedium!.copyWith(
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        heightBox(10),

                        // Score Breakdown
                        Container(
                          padding: padding16,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: crossAxisStart,
                            children: [
                              Text(
                                "Goals",
                                style: context.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),

                              Obx(
                                () => Text(
                                  controller
                                          .suggestproductError
                                          .value
                                          .isNotEmpty
                                      ? "Data not available"
                                      : controller.goalStatement.value,
                                  style: context.bodyMedium,
                                ),
                              ),
                              heightBox(10),
                              Obx(
                                () => controller.isLoadingSuggested.value
                                    ? Text("Loading goals..")
                                    : controller
                                                  .suggestedProducts
                                                  .value
                                                  .userGoals !=
                                              null &&
                                          controller
                                              .suggestedProducts
                                              .value
                                              .userGoals!
                                              .isNotEmpty
                                    ? Wrap(
                                        spacing: 6, // horizontal space
                                        runSpacing: 0, // minimal vertical space
                                        children: controller
                                            .suggestedProducts
                                            .value
                                            .userGoals!
                                            .map(
                                              (goal) => Padding(
                                                padding: EdgeInsets.only(
                                                  right: 3,
                                                  top: 5,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          50,
                                                        ),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5,
                                                      ),

                                                  child: Text(
                                                    goal.name ?? '',
                                                    style: context.bodySmall
                                                        ?.copyWith(
                                                          color: Colors.white,
                                                          height:
                                                              1.0, // 🔥 tighten text line height
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      )
                                    : const SizedBox.shrink(),
                              ),
                              heightBox(20),
                              Text(
                                "Diet Preference",
                                style: context.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Obx(
                                () => controller.isLoadingSuggested.value
                                    ? SizedBox.shrink()
                                    : Text(
                                        controller
                                                .suggestproductError
                                                .value
                                                .isNotEmpty
                                            ? "Data not available"
                                            : (controller
                                                          .suggestedProducts
                                                          .value
                                                          .userPreferences ==
                                                      null ||
                                                  controller
                                                      .suggestedProducts
                                                      .value
                                                      .userPreferences!
                                                      .isEmpty)
                                            ? "It meets your preferred diet."
                                            : "It doesn't meet your preferred diet.",
                                        style: context.bodyMedium,
                                      ),
                              ),
                              heightBox(10),
                              Obx(
                                () => controller.isLoadingSuggested.value
                                    ? Text("Loading diets...")
                                    : controller
                                              .suggestedProducts
                                              .value
                                              .userPreferences !=
                                          null
                                    ? Wrap(
                                        spacing: 8,
                                        runSpacing: 0,
                                        children: controller
                                            .suggestedProducts
                                            .value
                                            .userPreferences!
                                            .map(
                                              (pref) => Padding(
                                                padding: EdgeInsets.only(
                                                  right: 3,
                                                  top: 5,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          50,
                                                        ),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5,
                                                      ),

                                                  child: Text(
                                                    pref.name ?? '',
                                                    style: context.bodySmall
                                                        ?.copyWith(
                                                          color: Colors.white,
                                                          height:
                                                              1.0, // 🔥 tighten text line height
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ],
                          ),
                        ),

                        heightBox(10),

                        // Original nutrition details section
                        Container(
                          padding: padding16,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: crossAxisStart,
                            children: [
                              // Row(
                              //   mainAxisAlignment: mainAxisSpaceBetween,
                              //   children: [
                              //     Image.asset(
                              //       "assets/icons/like.png",
                              //       height: 50,
                              //       width: 50,
                              //     ),
                              //     Text(
                              //       "Do You Agree?",
                              //       style: context.titleMedium,
                              //     ),
                              //     Image.asset(
                              //       "assets/icons/dislike.png",
                              //       height: 50,
                              //       width: 50,
                              //     ),
                              //   ],
                              // ),
                              heightBox(5),
                              Text(
                                "Key Inside",
                                style: context.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                          controller.nutritionDetails.length,
                                          (index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                top: 5,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 3,
                                                    backgroundColor:
                                                        controller
                                                                .nutritionDetails[index]['level'] ==
                                                            'high'
                                                        ? Colors.red
                                                        : controller
                                                                  .nutritionDetails[index]['level'] ==
                                                              'moderate'
                                                        ? Colors.orange
                                                        : Colors.green,
                                                  ),
                                                  widthBox(6),
                                                  Expanded(
                                                    child: Text(
                                                      "${controller.nutritionDetails[index]['display_name']} : ${controller.nutritionDetails[index]['value']}${controller.nutritionDetails[index]['unit']}",
                                                      style: context.bodyLarge!
                                                          .copyWith(
                                                            height: 1.5,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              heightBox(20),
                              Text(
                                "Flags: ",
                                style: context.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              heightBox(10),
                              Wrap(
                                spacing: 10,
                                runSpacing: 6,
                                children: List.generate(
                                  controller.nutritionDetails.length,
                                  (index) {
                                    return Container(
                                      padding: defaultPadding,
                                      decoration: BoxDecoration(
                                        color:
                                            controller
                                                    .nutritionDetails[index]['level'] ==
                                                'high'
                                            ? Colors.red.withAlpha(80)
                                            : controller
                                                      .nutritionDetails[index]['level'] ==
                                                  'moderate'
                                            ? Colors.orange.withAlpha(80)
                                            : Colors.green.withAlpha(80),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "${controller.nutritionDetails[index]['level'].toString().capitalizeFirst} - ${controller.nutritionDetails[index]['display_name'].toString()}",
                                        style: context.bodyMedium,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              heightBox(20),
                              Text(
                                "Suggested Products",
                                style: context.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              heightBox(10),
                              Obx(
                                () => SizedBox(
                                  height: context.screenHeight * 0.19,
                                  child: controller.isLoadingSuggested.value
                                      ? Center(
                                          child: Text(
                                            "Please, wait for the suggested products...",
                                          ),
                                        )
                                      : controller
                                                    .suggestedProducts
                                                    .value
                                                    .suggestedProducts ==
                                                null ||
                                            controller
                                                .suggestedProducts
                                                .value
                                                .suggestedProducts!
                                                .isEmpty
                                      ? Center(
                                          child: Text(
                                            controller
                                                    .suggestproductError
                                                    .value
                                                    .isNotEmpty
                                                ? "Data not available"
                                                : "No food proudct found for this barcode.",
                                          ),
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                            controller
                                                .suggestedProducts
                                                .value
                                                .suggestedProducts!
                                                .length,
                                            (index) {
                                              final product = controller
                                                  .suggestedProducts
                                                  .value
                                                  .suggestedProducts![index];

                                              return Expanded(
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 4,
                                                      ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.generalDialog(
                                                        pageBuilder:
                                                            (
                                                              context,
                                                              animation,
                                                              secondaryAnimation,
                                                            ) {
                                                              return Dialog(
                                                                constraints: BoxConstraints(
                                                                  minHeight:
                                                                      context
                                                                          .screenHeight *
                                                                      0.5,
                                                                  maxHeight:
                                                                      context
                                                                          .screenHeight *
                                                                      0.65,
                                                                  minWidth:
                                                                      context
                                                                          .screenWidth *
                                                                      0.8,
                                                                ),
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          15,
                                                                        ),
                                                                  ),
                                                                  width:
                                                                      double
                                                                          .infinity -
                                                                      80,
                                                                  child: Column(
                                                                    children: [
                                                                      Stack(
                                                                        alignment:
                                                                            Alignment.topRight,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius: BorderRadius.circular(
                                                                              8,
                                                                            ),
                                                                            child: CachedNetworkImage(
                                                                              imageUrl:
                                                                                  product.imageUrl ??
                                                                                  "",
                                                                              width: double.infinity,
                                                                              height:
                                                                                  context.height *
                                                                                  0.4,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            onTap: () {
                                                                              Get.back();
                                                                            },
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.all(
                                                                                8.0,
                                                                              ),
                                                                              child: CircleAvatar(
                                                                                backgroundColor: Colors.white,
                                                                                child: Icon(
                                                                                  Icons.close,
                                                                                  color: Colors.red,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(
                                                                              8.0,
                                                                            ),
                                                                        child: Center(
                                                                          child: Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              RichText(
                                                                                maxLines: 2,
                                                                                text: TextSpan(
                                                                                  style: context.bodyLarge,
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: "Product Name: ",
                                                                                      style: TextStyle(
                                                                                        color: Colors.black,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text:
                                                                                          product.productName ??
                                                                                          "",
                                                                                      style: TextStyle(
                                                                                        color: Colors.grey,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              heightBox(
                                                                                5,
                                                                              ),
                                                                              RichText(
                                                                                text: TextSpan(
                                                                                  style: context.bodyLarge,
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: "Brand: ",
                                                                                      style: TextStyle(
                                                                                        color: Colors.black,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text:
                                                                                          product.brand ??
                                                                                          "",
                                                                                      style: TextStyle(
                                                                                        color: Colors.grey,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              heightBox(
                                                                                5,
                                                                              ),
                                                                              // RichText(
                                                                              //   text: TextSpan(
                                                                              //     style: context.bodyLarge,
                                                                              //     children: [
                                                                              //       TextSpan(
                                                                              //         text: "Health Score: ",
                                                                              //         style: TextStyle(
                                                                              //           color: Colors.black,
                                                                              //           fontWeight: FontWeight.bold,
                                                                              //         ),
                                                                              //       ),
                                                                              //       TextSpan(
                                                                              //         text: "${controller.mapNutriScoreLetterTo100(product.nutritionGrade)}%",
                                                                              //         style: TextStyle(
                                                                              //           color: Colors.grey,
                                                                              //         ),
                                                                              //       ),
                                                                              //     ],
                                                                              //   ),
                                                                              // ),
                                                                              // heightBox(
                                                                              //   5,
                                                                              // ),
                                                                              Center(
                                                                                child: SizedBox(
                                                                                  width:
                                                                                      context.screenWidth *
                                                                                      0.6,
                                                                                  child: Obx(
                                                                                    () => CustomButton(
                                                                                      isLoading: controller.isLoading.value,
                                                                                      text: "View Analysis",
                                                                                      onPressed: () async {
                                                                                        final barcode = product.barcode;
                                                                                        if (barcode ==
                                                                                                null ||
                                                                                            barcode.isEmpty) {
                                                                                          Get.snackbar(
                                                                                            "Error",
                                                                                            "Invalid product barcode",
                                                                                            snackPosition: SnackPosition.BOTTOM,
                                                                                            backgroundColor: Colors.red,
                                                                                            colorText: Colors.white,
                                                                                          );
                                                                                          return;
                                                                                        }

                                                                                        Get.back();

                                                                                        // Show loading dialog
                                                                                        Get.dialog(
                                                                                          PopScope(
                                                                                            onPopInvokedWithResult:
                                                                                                (
                                                                                                  didPop,
                                                                                                  result,
                                                                                                ) => false,
                                                                                            child: Center(
                                                                                              child: Container(
                                                                                                width:
                                                                                                    Get.context!.width *
                                                                                                    0.5,
                                                                                                padding: const EdgeInsets.all(
                                                                                                  30,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Colors.white,
                                                                                                  borderRadius: BorderRadius.circular(
                                                                                                    15,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  children: [
                                                                                                    const CircularProgressIndicator(),
                                                                                                    const SizedBox(
                                                                                                      height: 20,
                                                                                                    ),
                                                                                                    Text(
                                                                                                      "Loading product details...",
                                                                                                      style: Get.textTheme.bodyMedium,
                                                                                                      textAlign: TextAlign.center,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          barrierDismissible: false,
                                                                                        );

                                                                                        try {
                                                                                          controller.resetControllerForNewProduct();

                                                                                          await Future.delayed(
                                                                                            const Duration(
                                                                                              milliseconds: 100,
                                                                                            ),
                                                                                          );

                                                                                          await controller.getProductDetails(
                                                                                            barcode,
                                                                                          );
                                                                                          await controller.getSuggestedProduct(
                                                                                            barcode,
                                                                                          );
                                                                                          await controller.setGoalStatement();

                                                                                          Get.back();

                                                                                          Get.offAndToNamed(
                                                                                            Routes.RESULT,
                                                                                            arguments: barcode,
                                                                                          );
                                                                                        } catch (
                                                                                          e
                                                                                        ) {
                                                                                          // Close loading dialog
                                                                                          Get.back();

                                                                                          // Show error
                                                                                          Get.snackbar(
                                                                                            "Error",
                                                                                            "Failed to load product: ${e.toString()}",
                                                                                            snackPosition: SnackPosition.BOTTOM,
                                                                                            backgroundColor: Colors.red,
                                                                                            colorText: Colors.white,
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                        transitionBuilder:
                                                            (
                                                              context,
                                                              animation,
                                                              secondaryAnimation,
                                                              child,
                                                            ) {
                                                              return FadeTransition(
                                                                opacity:
                                                                    animation,
                                                                child: ScaleTransition(
                                                                  scale:
                                                                      Tween<double>(
                                                                        begin:
                                                                            0.7,
                                                                        end:
                                                                            1.0,
                                                                      ).animate(
                                                                        CurvedAnimation(
                                                                          parent:
                                                                              animation,
                                                                          curve:
                                                                              Curves.easeOutCubic,
                                                                        ),
                                                                      ),
                                                                  child: child,
                                                                ),
                                                              );
                                                            },
                                                        transitionDuration:
                                                            const Duration(
                                                              milliseconds: 400,
                                                            ),
                                                        barrierDismissible:
                                                            true,
                                                        barrierLabel: '',
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8,
                                                              ),
                                                          child: CachedNetworkImage(
                                                            imageUrl:
                                                                product
                                                                    .imageUrl ??
                                                                "",
                                                            width:
                                                                double.infinity,
                                                            height: 100,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          product.productName ??
                                                              "",
                                                          style: context
                                                              .bodyMedium,
                                                          maxLines: 1,
                                                          textAlign:
                                                              TextAlign.center,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        heightBox(40),
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: mainAxisCenter,
                  children: [
                    Text(
                      controller.errorMessage.value.toString().toUpperCase(),
                    ),
                    heightBox(20),
                    SizedBox(
                      width: 100,
                      child: CustomButton(
                        text: "Close",
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildScoreRow(
    BuildContext context,
    String label,
    double score,
    String weight, {
    bool isInverseScale = false, // Add this parameter
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                weight,
                style: context.bodyMedium!.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10),
                      value: score / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        isInverseScale
                            ? (score <= 20
                                  ? Colors.green
                                  : score <= 35
                                  ? Colors.lightGreen
                                  : score <= 50
                                  ? Colors.orange
                                  : Colors.red)
                            : (score >= 80
                                  ? Colors.green
                                  : score >= 65
                                  ? Colors.lightGreen
                                  : score >= 50
                                  ? Colors.orange
                                  : Colors.red),
                      ),
                      minHeight: 8,
                    ),
                  ),
                  widthBox(10),
                  Text(
                    "${score.round()}",
                    style: context.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
