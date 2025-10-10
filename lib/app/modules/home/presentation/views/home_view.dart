import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:neutri_lens/app/core/core.dart';
import 'package:neutri_lens/app/core/widgets/custom_searchfield.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: AppColors.lightGreyColor,
              child: Icon(
                Iconsax.notification,
                color: AppColors.appPrimaryColor,
              ),
            ),
          ),
          widthBox(10),
        ],
      ),
      body: UnfocusWrapper(
        child: Padding(
          padding: screenPadding,
          child: Column(
            crossAxisAlignment: crossAxisStart,
            children: [
              heightBox(10),
              Text(
                "Hello John",
                style: context.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              heightBox(5),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Your fitness looking",
                      style: context.bodyMedium,
                    ),
                    TextSpan(
                      text: " Good",
                      style: context.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              heightBox(10),
              CustomSearchField(
                controller: controller.searchController,
                hintText: "Search for keywords",
              ),
              heightBox(20),
              Text(
                "All Products",
                style: context.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value &&
                      controller.products.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.errorMessage.value.isNotEmpty &&
                      controller.products.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(controller.errorMessage.value),
                          heightBox(10),
                          ElevatedButton(
                            onPressed: () => controller.getProducts(),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  if (controller.products.isEmpty) {
                    return const Center(child: Text('No products found'));
                  }

                  return RefreshIndicator(
                    onRefresh: controller.refreshProducts,
                    child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount:
                          controller.products.length +
                          (controller.hasMoreData.value ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == controller.products.length) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: controller.isLoadingMore.value
                                  ? const CircularProgressIndicator()
                                  : const SizedBox.shrink(),
                            ),
                          );
                        }

                        final product = controller.products[index];
                        return InkWell(
                          onTap: () => Get.toNamed(
                            Routes.RESULT,
                            arguments: product.code,
                          ),
                          child: Container(
                            padding: defaultPadding,
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.lightGreyColor.withAlpha(80),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.darkGreyColor.withAlpha(
                                        80,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: product.imageFrontSmallUrl!,
                                      height: Platform.isAndroid ? 120 : 120,
                                      width: Platform.isAndroid ? 100 : 120,
                                      fit: BoxFit.cover,

                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                            AppImages.appLogo,
                                            height: 90,
                                            width: 90,
                                          ),
                                    ),
                                  ),
                                ),
                                widthBox(10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: crossAxisStart,
                                    children: [
                                      /// Product name + quantity
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing: 5,
                                        children: [
                                          Text(
                                            product.productName ?? "N/A",
                                            style: context.bodyLarge!.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "(${product.quantity ?? "N/A"})",
                                            style: context.bodySmall!.copyWith(
                                              color: AppColors.greyColor,
                                            ),
                                          ),
                                        ],
                                      ),

                                      heightBox(4),

                                      /// Brand (wraps automatically)
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Brand: ",
                                              style: context.bodyMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: product.brands ?? "N/A",
                                              style: context.bodyMedium!
                                                  .copyWith(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        overflow: TextOverflow.visible,
                                        maxLines: 1,
                                      ),

                                      heightBox(4),

                                      if (product.categories != null)
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Categories: ",
                                                style: context.bodyMedium!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              TextSpan(
                                                text:
                                                    product.categories ?? "N/A",
                                                style: context.bodyMedium!
                                                    .copyWith(
                                                      color: Colors.grey,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.visible,
                                        ),

                                      heightBox(8),

                                      /// NutriScore + FoodIQ
                                      Wrap(
                                        spacing: 10,
                                        runSpacing: 5,
                                        children: [
                                          if (product.nutriscoreGrade != null)
                                            Container(
                                              width: 100,
                                              padding: padding5,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: _getGradeColor(
                                                  product.nutriscoreGrade!,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  _getStatus(
                                                    product.nutriscoreGrade!,
                                                  ),
                                                  style: context.bodySmall!
                                                      .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          Container(
                                            width: 70,
                                            padding: padding5,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: AppColors.lightGreyColor,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "FoodIQ",
                                                style: context.bodySmall!
                                                    .copyWith(
                                                      color: Colors.black,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade.toLowerCase()) {
      case 'a':
        return Colors.green;
      case 'b':
        return Colors.lightGreen;
      case 'c':
        return Colors.yellow.shade700;
      case 'd':
        return Colors.orange;
      case 'e':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatus(String grade) {
    switch (grade.toLowerCase()) {
      case 'a':
        return "Very good";
      case 'b':
        return "Good";
      case 'c':
        return "Average";
      case 'd':
        return "Poor";
      case 'e':
        return "Very Poor";

      default:
        return "Unknown";
    }
  }
}
