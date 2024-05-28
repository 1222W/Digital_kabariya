import 'package:digital_kabaria_app/Common/custom_app_bar.dart';
import 'package:digital_kabaria_app/Common/custom_button.dart';
import 'package:digital_kabaria_app/Utils/app_colors.dart';
import 'package:digital_kabaria_app/Utils/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannedAccountView extends StatefulWidget {
  const BannedAccountView({super.key});

  @override
  State<BannedAccountView> createState() => _BannedAccountViewState();
}

class _BannedAccountViewState extends State<BannedAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        flag: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.sp),
        physics: const BouncingScrollPhysics(),
        children: [
          Center(
            child: Text(
              "Account Suspended!",
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          20.h.sizedBoxHeight,
          Center(
            child: Text(
              "Your account has been suspended due to a violation of our app's terms of service. We have detected unauthorized activity or a breach of our community guidelines linked to your account. As a consequence, access to our platform has been temporarily restricted. Please review our terms of service for more information. Thank you for your understanding.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor.withOpacity(.5),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          50.h.sizedBoxHeight,
          CustomButton(
            text: "Close",
            onPressed: () {
              Navigator.pop(context);
            },
          )
          //
        ],
      ),
    );
  }
}
