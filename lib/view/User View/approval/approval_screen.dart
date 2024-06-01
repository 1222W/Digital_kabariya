import 'package:digital_kabaria_app/common/custom_button.dart';
import 'package:digital_kabaria_app/utils/app_colors.dart';
import 'package:digital_kabaria_app/utils/app_strings.dart';
import 'package:digital_kabaria_app/utils/app_text.dart';
import 'package:digital_kabaria_app/utils/custom_navigation.dart';
import 'package:digital_kabaria_app/utils/sized_box_extension.dart';
import 'package:digital_kabaria_app/view/Auth%20View/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestApprovalScreen extends StatelessWidget {
  const RequestApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppText(text: "Request Pending...",fontSize: 25,fontWeight: FontWeight.w600,color: AppColors.appColor,),
              const AppText(
                textAlign: TextAlign.center,
                text: "Your join request is pending approval from the admin. Please wait.",fontSize: 15,fontWeight: FontWeight.w600,color: AppColors.blackColor,),
                  10.h.sizedBoxHeight,
          
                CustomButton(
                  btnWidth: 150,
                  text: AppStrings.goBack,
                  onPressed: (){
                    pushUntil(context,const LoginView());
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}