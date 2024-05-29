import 'dart:developer';

import 'package:digital_kabaria_app/common/app_loader.dart';
import 'package:digital_kabaria_app/common/app_toast_message.dart';
import 'package:digital_kabaria_app/common/custom_app_bar.dart';
import 'package:digital_kabaria_app/common/custom_button.dart';
import 'package:digital_kabaria_app/common/custom_drop_down.dart';
import 'package:digital_kabaria_app/common/custom_text_form_field.dart';
import 'package:digital_kabaria_app/controllers/sign_up/sign_up_controller.dart';
import 'package:digital_kabaria_app/utils/app_colors.dart';
import 'package:digital_kabaria_app/utils/sized_box_extension.dart';
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
  final controller = Get.put(SignUpController());

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
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.h.sizedBoxHeight,
                Text(
                  "Welcome! Create your\naccount",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                20.h.sizedBoxHeight,
                Obx(() => CustomTextFormField(
                      controller: controller.fullNameCTRL,
                      hintText: "Full Name/ Organization Name",
                      flag: true,
                      onChanged: controller.validateFullName,
                      errorText: controller.fullNameError.value,
                    )),
                10.h.sizedBoxHeight,
                Obx(() => CustomTextFormField(
                      controller: controller.emailCTRL,
                      hintText: "Email Address",
                      flag: true,
                      onChanged: controller.validateEmail,
                      errorText: controller.emailError.value,
                    )),
                10.h.sizedBoxHeight,
                Obx(() => CustomTextFormField(
                      controller: controller.phoneCTRL,
                      hintText: "Phone No",
                      flag: true,
                      onChanged: controller.validatePhone,
                      errorText: controller.phoneError.value,
                    )),
                10.h.sizedBoxHeight,
                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropDown(
                          dropdownItems: const [
                            "User",
                            "Kabariya",
                            "Organization"
                          ],
                          selectedItem: controller.selectedDropdownItem.value ??
                              "Sign Up As!",
                          isDropdownOpen: false,
                          onChanged: (value) {
                            controller.selectedDropdownItem.value = value;
                            controller.validateDropdown(value);
                          },
                        ),
                        if (controller.dropdownError.value != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              controller.dropdownError.value!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                      ],
                    )),
                10.h.sizedBoxHeight,
                Obx(() => CustomTextFormField(
                      controller: controller.passwordCTRL.value,
                      hintText: "Set Password",
                      flag: true,
                      obscureText: controller.obsecurePassword.value,
                      onChanged: controller.validatePassword,
                      errorText: controller.passwordError.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.togglePassword();
                        },
                        icon: Icon(
                          controller.obsecurePassword.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off,
                          size: 20.sp,
                          color: controller.obsecurePassword.value
                              ? AppColors.blackColor.withOpacity(.30)
                              : AppColors.brownColor,
                        ),
                      ),
                    )),
                14.h.sizedBoxHeight,
                20.h.sizedBoxHeight,
                Obx(
                  () =>controller.isLoading.value?const Center(child: AppLoader(),): CustomButton(
                      text: "Create Account",
                      onPressed: controller.enableSignUpButton
                          ? () async {
                              await controller.signUp(
                                  emailAddress: controller.emailCTRL.text,
                                  password: controller.passwordCTRL.value.text,
                                  fullName: controller.fullNameCTRL.text,
                                  phoneNumber: controller.phoneCTRL.text,
                                  role: controller.selectedDropdownItem.value
                                      .toString());
                            }
                          : null
                      // onPressed:controller.enableSignUpButton
                      //     ? controller.signUp
                      //     : null,
                      ),
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
                        fontWeight: FontWeight.w500,
                      ),
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
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                20.h.sizedBoxHeight,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
