import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_kabaria_app/common/custom_button.dart';
import 'package:digital_kabaria_app/utils/app_colors.dart';
import 'package:digital_kabaria_app/utils/app_strings.dart';
import 'package:digital_kabaria_app/utils/app_text.dart';
import 'package:digital_kabaria_app/utils/custom_navigation.dart';
import 'package:digital_kabaria_app/utils/enums.dart';
import 'package:digital_kabaria_app/utils/firebase_data.dart';
import 'package:digital_kabaria_app/utils/sized_box_extension.dart';
import 'package:digital_kabaria_app/utils/utils.dart';
import 'package:digital_kabaria_app/view/Collector%20View/collector_bottom_nav_view.dart';
import 'package:digital_kabaria_app/view/Company%20View/company_bottom_view.dart';
import 'package:digital_kabaria_app/view/Seller%20View/Auth%20View/login_view.dart';
import 'package:digital_kabaria_app/view/Seller%20View/home_view/seller_home_view.dart';
import 'package:digital_kabaria_app/view/Seller%20View/user_home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/sign_up/sign_up_controller.dart';

class VerfificationScreen extends StatefulWidget {
  const VerfificationScreen({super.key});

  @override
  State<VerfificationScreen> createState() => _RequestApprovalScreenState();
}

class _RequestApprovalScreenState extends State<VerfificationScreen> {
  final controller = Get.put(SignUpController());

  @override
  void initState() {
    checkApproval();
    super.initState();
  }

  checkApproval() {
    final id = FirebaseAuth.instance.currentUser!.uid;
    final userEmail = FirebaseAuth.instance.currentUser!.emailVerified;
    if (userEmail == true) {
      // pushReplacement(context, User)
      if (controller.selectedDropdownItem.value == ROLENAME.Seller) {
        pushReplacement(context, SellerHomeView());
      } else if (controller.selectedDropdownItem.value == ROLENAME.Collector) {
        pushReplacement(context, CollectorBottomNavBar());
      } else if (controller.selectedDropdownItem.value == ROLENAME.Buyer) {
        pushReplacement(context, CompanyBottomBar());
      }
    }
    // FirebaseFirestore.instance.collection(Collection.user).doc(id).snapshots().listen((event) {
    //   if (event.get("is_verify")) {
    //     pushReplacement(context, const UserHomeView());
    //     Utils.successBar("Admin Approved SuccessFully!", context);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppText(
                text: "Verification Pending...",
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: AppColors.appColor,
              ),
              const AppText(
                textAlign: TextAlign.center,
                text:
                    "Email verification pending. Please verify your email and resend the email.",
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
              10.h.sizedBoxHeight,
              CustomButton(
                btnWidth: 150,
                text: "Resend Email",
                onPressed: () {
                  controller.sendEmailVerificationLink(context);
                  // pushUntil(context,const LoginView());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
