import 'package:digital_kabaria_app/Common/custom_app_bar.dart';
import 'package:digital_kabaria_app/Common/custom_button.dart';
import 'package:digital_kabaria_app/Common/custom_drop_down.dart';
import 'package:digital_kabaria_app/Common/custom_text_form_field.dart';
import 'package:digital_kabaria_app/Utils/app_colors.dart';
import 'package:digital_kabaria_app/Utils/sized_box_extension.dart';
import 'package:digital_kabaria_app/view/Auth%20View/Auth%20State/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          // flag: true,
          ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Image.asset(
              //     "assets/images/app_logo_dk.png",
              //     height: 75.h,
              //   ),
              // ),
              20.h.sizedBoxHeight,

              //
              Text(
                "Welcome! Create your\naccount",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              20.h.sizedBoxHeight,
              const CustomTextFormField(
                hintText: "Full Name/ Organization Name",
                flag: true,
              ),
              10.h.sizedBoxHeight,
              const CustomTextFormField(
                hintText: "Email Address",
                flag: true,
              ),
              10.h.sizedBoxHeight,
              const CustomTextFormField(
                hintText: "Phone No",
                flag: true,
              ),
              10.h.sizedBoxHeight,
              CustomDropDown(
                  dropdownItems: const ["User", "Kabariya", "Organization"],
                  selectedItem: "Sign Up As!",
                  isDropdownOpen: false,
                  onChanged: (value) {}),
              10.h.sizedBoxHeight,
              GetBuilder<AuthStateController>(builder: (authState) {
                return CustomTextFormField(
                  controller: authState.passwordCTRL.value,
                  hintText: "Set Password",
                  flag: true,
                  obscureText: authState.obsecurePassword,
                  validator: (String? value) {
                    if (value!.isNotEmpty ||
                        authState.passwordCTRL.value.text.isNotEmpty) {
                      return null;
                    } else {
                      return 'Password Required';
                    }
                  },
                  suffixIcon: IconButton(
                      onPressed: () {
                        authState.togglePassword();
                      },
                      icon: Icon(
                        authState.obsecurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off,
                        size: 20.sp,
                        color: authState.obsecurePassword
                            ? AppColors.blackColor.withOpacity(.30)
                            : AppColors.brownColor,
                      )),
                );
              }),
              14.h.sizedBoxHeight,
              20.h.sizedBoxHeight,
              CustomButton(
                text: "Create Account",
                onPressed: () {},
              ),
              10.h.sizedBoxHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Already Registered?",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.blackColor.withOpacity(.5),
                        fontWeight: FontWeight.w500),
                  ),
                  5.w.sizedBoxWidth,
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.brownColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.brownColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),

              20.h.sizedBoxHeight,
            ],
          ),
        ),
      ),
    );
  }
}
