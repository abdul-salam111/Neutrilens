import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neutri_lens/app/core/core.dart';
import 'package:neutri_lens/app/core/widgets/loading_indicator.dart';
import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  const ResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.backgroundColor.value,
        body: controller.isLoading.value
            ? Center(child: LoadingIndicator())
            : controller.errorMessage.value == null
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
                              image: CachedNetworkImageProvider(
                                controller
                                        .getProductResultModel
                                        .value
                                        ?.product
                                        ?.imageFrontSmallUrl
                                        .toString() ??
                                    "",
                              ),
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
                                  backgroundColor:
                                      controller.backgroundColor.value,
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
                            ],
                          ),
                        ),
                        heightBox(10),
                        Text(
                          "${controller.grade.value == "a"
                              ? "Good"
                              : controller.grade.value == "c" || controller.grade.value == "b"
                              ? "Ok"
                              : "Don't"} Pick",
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
                                      fontSize: 18,
                                    ),
                                  ),
                                  heightBox(5),
                                  Text(
                                    "Grade: ${controller.grade.value.toUpperCase()}",
                                    style: context.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
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
                                  heightBox(10),
                                  Text(
                                    "Method: ${controller.scoringMethod.value}",
                                    style: context.bodyMedium!.copyWith(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 80,
                                padding: padding5,
                                decoration: BoxDecoration(
                                  color: controller.backgroundColor.value,
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
                              Row(
                                mainAxisAlignment: mainAxisSpaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/icons/like.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                  Text(
                                    "Do You Agree?",
                                    style: context.titleMedium,
                                  ),
                                  Image.asset(
                                    "assets/icons/dislike.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                ],
                              ),
                              heightBox(30),
                              Text(
                                "Key Inside",
                                style: context.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
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
                              SizedBox(
                                height: 50,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(
                                      controller.nutritionDetails.length,
                                      (index) {
                                        return Container(
                                          margin: defaultPadding,
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
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Text(
                                            "${controller.nutritionDetails[index]['level'].toString().capitalizeFirst} - ${controller.nutritionDetails[index]['display_name'].toString()}",
                                            style: context.bodyMedium,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              heightBox(20),
                              Text(
                                "Similar good food choices",
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
                                      : controller.suggestedProducts.isEmpty
                                      ? Center(
                                          child: Text(
                                            "No similar products found",
                                          ),
                                        )
                                      : SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: List.generate(
                                              controller
                                                  .suggestedProducts
                                                  .length,
                                              (index) {
                                                final product = controller
                                                    .suggestedProducts[index];

                                                return GestureDetector(
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
                                                                    0.6,
                                                                maxHeight:
                                                                    context
                                                                        .screenHeight *
                                                                    0.6,
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
                                                                          topRight,
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                8,
                                                                              ),
                                                                          child: CachedNetworkImage(
                                                                            imageUrl:
                                                                                product.imageUrl ??
                                                                                "",
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                context.height *
                                                                                0.4,
                                                                            fit:
                                                                                BoxFit.cover,
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
                                                                      child: Column(
                                                                        crossAxisAlignment:
                                                                            crossAxisStart,
                                                                        children: [
                                                                          RichText(
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
                                                                          RichText(
                                                                            text: TextSpan(
                                                                              style: context.bodyLarge,
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: "Health Score: ",
                                                                                  style: TextStyle(
                                                                                    color: Colors.black,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: "${controller.mapNutriScoreLetterTo100(product.nutritionGrade)}%",
                                                                                  style: TextStyle(
                                                                                    color: Colors.grey,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
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
                                                                      end: 1.0,
                                                                    ).animate(
                                                                      CurvedAnimation(
                                                                        parent:
                                                                            animation,
                                                                        curve: Curves
                                                                            .easeOutCubic,
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
                                                      barrierDismissible: true,
                                                      barrierLabel: '',
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 120,
                                                    padding: padding5,
                                                    margin:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                        ),

                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          mainAxisSpaceBetween,
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
                                                            width: 120,
                                                            height: 100,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        heightBox(5),
                                                        Text(
                                                          product.productName ??
                                                              "",
                                                          style: context
                                                              .bodyMedium,
                                                          maxLines: 1,
                                                          textAlign:
                                                              textAlignCenter,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
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
            : Center(child: Text(controller.errorMessage.value.toString())),
      ),
    );
  }

  Widget _buildScoreRow(
    BuildContext context,
    String label,
    double score,
    String weight,
  ) {
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
                      value: score / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        score >= 80
                            ? Colors.green
                            : score >= 65
                            ? Colors.lightGreen
                            : score >= 50
                            ? Colors.orange
                            : Colors.red,
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
