import 'dart:io';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:neutri_lens/app/core/core.dart';
import 'package:neutri_lens/app/modules/home/presentation/views/home_view.dart';
import 'package:neutri_lens/app/modules/profile/views/profile_view.dart';

import 'package:neutri_lens/app/modules/settings/views/settings_view.dart';
import 'package:neutri_lens/app/modules/trends/views/trends_view.dart';
import 'package:neutri_lens/app/routes/app_pages.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  NavbarView({super.key});
  final List<Widget> pages = [
    HomeView(),
    TrendsView(),
    SettingsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        alignment: bottomCenter,
        children: [
          Scaffold(
            body: pages[controller.currentIndex.value],
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(50),
                    blurRadius: 8,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: crossAxisStart,
                children: [
                  _buildNavItem(
                    Icons.explore_outlined,
                    Icons.explore,
                    "Discover",
                    0,
                  ),
                  _buildNavItem(
                    Icons.trending_up,
                    Icons.trending_up,
                    "Trends",
                    1,
                  ),
                  SizedBox(width: 50),
                  _buildNavItem(
                    Icons.settings_outlined,
                    Icons.settings,
                    "Settings",

                    2,
                  ),
                  _buildNavItem(
                    Icons.person_outline,
                    Icons.person,
                    "Profile",
                    3,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await Get.to(() {
                return AiBarcodeScanner(
                  scanWindow: Rect.fromCenter(
                    center: Offset(
                      MediaQuery.of(context).size.width / 2,
                      MediaQuery.of(context).size.height / 2,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 100,
                  ),
                  onDetectError: (error, stacktrace) {
                    if (kDebugMode) {
                      print(stacktrace);
                    }
                  },
                  onDetect: (capture) async {
                    final code = capture.barcodes.first.rawValue;
                    Get.offNamed(Routes.RESULT, arguments: code);
                  },
                );
              });
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: context.screenHeight * 0.05),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black,

                child: Icon(
                  Iconsax.scan,
                  color: AppColors.appPrimaryColor,
                  size: 35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData outlineIcon,
    IconData filledIcon,
    String label,
    int index,
  ) {
    return Obx(() {
      final isSelected = controller.currentIndex.value == index;
      return GestureDetector(
        onTap: () => controller.changeIndex(index),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: mainAxisStart,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelected ? filledIcon : outlineIcon,
                color: isSelected ? Colors.orange : Colors.grey,
                size: 28,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Colors.orange : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
