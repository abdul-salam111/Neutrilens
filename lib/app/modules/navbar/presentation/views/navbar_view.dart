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
      () => Scaffold(
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: Platform.isAndroid ? 8 : 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 8,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: crossAxisStart,
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              _buildNavItem(
                Icons.explore_outlined,
                Icons.explore,
                "Discover",
                0,
              ),
              _buildNavItem(Icons.trending_up, Icons.trending_up, "Trends", 1),
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
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.black,

                  child: Icon(
                    Iconsax.scan,
                    color: AppColors.appPrimaryColor,
                    size: 28,
                  ),
                ),
              ),
              _buildNavItem(
                Icons.settings_outlined,
                Icons.settings,
                "Settings",

                2,
              ),
              _buildNavItem(Icons.person_outline, Icons.person, "Profile", 3),
            ],
          ),
        ),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelected ? filledIcon : outlineIcon,
                color: isSelected ? AppColors.appPrimaryColor : Colors.grey,
                size: 30,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  color: isSelected ? AppColors.appPrimaryColor : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
