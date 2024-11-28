import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_kabaria_app/common/app_loader.dart';
import 'package:digital_kabaria_app/common/custom_button.dart';
import 'package:digital_kabaria_app/common/custom_text_form_field.dart';
import 'package:digital_kabaria_app/controllers/seller_controllers/seller_profile_controller.dart';
import 'package:digital_kabaria_app/utils/app_colors.dart';
import 'package:digital_kabaria_app/utils/app_text.dart';
import 'package:digital_kabaria_app/utils/custom_navigation.dart';
import 'package:digital_kabaria_app/utils/sized_box_extension.dart';
import 'package:digital_kabaria_app/view/Seller%20View/home_view/update_profile_view.dart';
import 'package:digital_kabaria_app/view/feed_back_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../all_feed_back_screens.dart';
import '../Auth View/Auth State/auth_state.dart';

class SellerProfileView extends StatefulWidget {
  const SellerProfileView({super.key});

  @override
  State<SellerProfileView> createState() => _SellerProfileViewState();
}

class _SellerProfileViewState extends State<SellerProfileView> {
  final authState = Get.put(AuthStateController());
  var data;
  var fullName = '';
  var email = '';
  var phone = '';

  SellerProfileController controller = Get.put(SellerProfileController());
  TextEditingController name = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController phoneNum = TextEditingController();

  // Function to restore data from snapshot
  isDataRestored() {
    if (data != null) {
      name.text = fullName ?? '';
      emailAddress.text = email ?? '';
      phoneNum.text = phone ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: FutureBuilder(
          future: controller.getProfile(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData) {
              return const Center(child: Text('No Data found'));
            }

            data = snapshot.data as DocumentSnapshot;
            fullName = data['full_name'];
            email = data['email_address'];
            phone = data['phone_number'];

            
            isDataRestored();

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: height * .05),
                  const Center(
                    child: AppText(
                      text: "Profile",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * .08),
                  CustomTextFormField(
                    flag: false,
                    hintText: "Full Name",
                    controller: name,
                  ),
                  20.h.sizedBoxHeight,
                  CustomTextFormField(
                    hintText: "Email",
                    controller: emailAddress,
                  ),
                  20.h.sizedBoxHeight,
                  CustomTextFormField(
                    hintText: "Phone Number",
                    controller: phoneNum,
                  ),
                  20.h.sizedBoxHeight,
   Obx(() {
  // Always access .value of the RxBool
  return controller.isLoading.value
      ? const Center(child: AppLoader())  // Show loader if isLoading is true
      : CustomButton(
          onPressed: () {
            controller.updateProfile(
              context,
              fullName: name.text,
              email: emailAddress.text,
              phone: phoneNum.text,
            );
          },
          text: "Update Profile",
        );
}),


                
                  20.h.sizedBoxHeight,
                  Obx(() {
                    return authState.isLoading.value
                        ? const AppLoader()
                        : CustomButton(
                            btnColor: AppColors.redColor,
                            onPressed: () {
                              authState.logOut(context);
                            },
                            text: "Log out",
                          );
                  }),
                  20.h.sizedBoxHeight,

                  CustomButton(
          onPressed: () {
          push(context, const FeedbackScreen());
          },
          text: "Feed back",
        ),

                  20.h.sizedBoxHeight,

        CustomButton(
          onPressed: () {
          push(context, const AllFeedBackScreens());
          },
          text: "All Feed backs",
        )
                ],
              ),
            );
         
          },
        ),
      ),
    );
  }
}
