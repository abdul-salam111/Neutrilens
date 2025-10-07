import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: topLeft,
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
                              CachedNetworkImage(
                                imageUrl:
                                    controller
                                        .getProductResultModel
                                        .value
                                        ?.product
                                        ?.imageFrontSmallUrl
                                        .toString() ??
                                    "",

                                height: context.screenHeight * 0.2,
                                width: context.screenWidth * 0.2,
                       
                              ),
                              Positioned(
                                bottom: 0,
                                child: CircleAvatar(
                                  backgroundColor:
                                      controller.backgroundColor.value,
                                  radius: 20,
                                  child: Icon(
                                    controller.grade.value == "a"
                                        ? Icons.check
                                        : controller.grade.value == "b"
                                        ? Icons.remove
                                        : Icons.close,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        heightBox(10),
                        Text(
                          " ${controller.grade.value == "a"
                              ? "Good"
                              : controller.grade.value == "c" || controller.grade.value == "b"
                              ? "Ok"
                              : "Don't"} Pick",
                          style: context.titleLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        heightBox(10),
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
                                  Text(
                                    "Eiyo Score",
                                    style: context.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    padding: defaultPadding,
                                    decoration: BoxDecoration(
                                      color: controller.backgroundColor.value,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      controller.grade.value.toUpperCase(),
                                      style: context.titleLarge!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                controller.grade.value == "a"
                                    ? "Very good nutritional quality"
                                    : controller.grade.value == "b"
                                    ? "Normal nutritional quality"
                                    : "Very poor nutritional quality",
                                style: context.bodySmall!.copyWith(),
                              ),
                              heightBox(20),
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
                                                      "${controller.nutritionDetails[index]['tag'].toString().substring(3)} : ${controller.nutritionDetails[index]['value'].toString()}%",

                                                      style: context.bodyMedium!
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
                                          child: Center(
                                            child: Text(
                                              " ${controller.nutritionDetails[index]['level'].toString().capitalizeFirst} - ${controller.nutritionDetails[index]['display_name'].toString()}",
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              // heightBox(20),
                              // Text(
                              //   "Similar Good Food Choice: ",
                              //   style: context.bodyLarge!.copyWith(
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              // heightBox(10),
                              // SizedBox(
                              //   height: 100,
                              //   child: ListView.builder(
                              //     scrollDirection: Axis.horizontal,
                              //     itemCount: 10,
                              //     itemBuilder: (context, index) {
                              //       return Container(
                              //         margin: EdgeInsets.only(right: 10),
                              //         decoration: BoxDecoration(
                              //           border: Border.all(
                              //             color: AppColors.borderColor,
                              //           ),
                              //           borderRadius: BorderRadius.circular(10),
                              //         ),
                              //         padding: defaultPadding,
                              //         child: CachedNetworkImage(
                              //           imageUrl:
                              //               "https://springs.com.pk/cdn/shop/files/8964002346905_c68203c5-67dc-4378-8593-edebcb6c792c.png?v=1747846571",
                              //           height: context.screenHeight * 0.2,
                              //           width: context.screenWidth * 0.2,
                              //         ),
                              //       );
                              //     },
                              //   ),
                              // ),
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
}
