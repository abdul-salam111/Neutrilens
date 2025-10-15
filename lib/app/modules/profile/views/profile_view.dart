import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neutri_lens/app/core/core.dart';
import 'package:neutri_lens/app/core/data/local_data/secure_storage/storage.dart';
import 'package:neutri_lens/app/core/widgets/custom_button.dart';
import 'package:neutri_lens/app/core/widgets/custom_textfield.dart';
import '../../../core/services/session_manager.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: screenPadding,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.appPrimaryColor,
                  radius: 52,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: CachedNetworkImageProvider(
                      "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?semt=ais_hybrid&w=740&q=80",
                    ),
                  ),
                ),
                heightBox(10),
                Text(
                  " ${SessionController().getUserDetails.fullName}",
                  style: context.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                heightBox(2),
                Text(
                  " ${SessionController().getUserDetails.username}",
                  style: context.bodyMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                heightBox(30),
                CustomTextFormField(
                  hintText: " ${SessionController().getUserDetails.fullName}",
                  label: "Full Name",
                  labelfontSize: 14,
                  labelColor: Colors.black,
                  borderColor: AppColors.darkGreyColor.withAlpha(90),
                ),
                heightBox(10),
                CustomTextFormField(
                  readonly: true,
                  hintText: " ${SessionController().getUserDetails.username}",
                  label: "Email",
                  labelfontSize: 14,
                  labelColor: Colors.black,
                  borderColor: AppColors.darkGreyColor.withAlpha(90),
                ),
                heightBox(10),
                CustomTextFormField(
                  hintText:
                      " ${SessionController().getUserDetails.ageFrom} - ${SessionController().getUserDetails.ageTo}",
                  labelfontSize: 14,
                  label: "Age",
                  labelColor: Colors.black,
                  borderColor: AppColors.darkGreyColor.withAlpha(90),
                ),
                heightBox(
                  Platform.isAndroid
                      ? context.screenHeight * 0.08
                      : context.screenHeight * 0.1,
                ),
                SizedBox(
                  height: 45,
                  width: 200,
                  child: CustomButton(
                    text: "Log Out",
                    onPressed: () async {
                      await storage.clearValues(StorageKeys.userDetails);
                      await storage.clearValues(StorageKeys.loggedIn);
                      await storage.clearValues(StorageKeys.token);
                      Get.offAllNamed(Routes.SIGNIN);
                    },
                    backgroundColor: AppColors.appPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
