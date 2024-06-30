import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_kabaria_app/Common/app_toast_message.dart';
import 'package:digital_kabaria_app/utils/custom_navigation.dart';
import 'package:digital_kabaria_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailCTRL = TextEditingController();
  final phoneCTRL = TextEditingController();
  final passwordCTRL = TextEditingController().obs;
  final fullNameCTRL = TextEditingController();
  final obsecurePassword = true.obs;
  var isLoading = false.obs;

  void setLoading(bool loading) {
    isLoading.value = loading;
  }

  final fullNameError = RxnString(null);
  final emailError = RxnString(null);
  final passwordError = RxnString(null);
  final phoneError = RxnString(null);
  final dropdownError = RxnString(null);

  final selectedDropdownItem = RxnString(null);
  final _enableSignUpButton = false.obs;

  void togglePassword() {
    obsecurePassword.value = !obsecurePassword.value;
  }

  void validateFullName(String value) {
    if (value.isEmpty) {
      fullNameError.value = "Please enter full name";
    } else {
      fullNameError.value = null;
    }
    updateSignUpButton();
  }

  void validateEmail(String value) {
    if (value.isEmpty || !GetUtils.isEmail(value)) {
      emailError.value = "Please enter a valid email";
    } else {
      emailError.value = null;
    }
    updateSignUpButton();
  }

  void validatePhone(String value) {
    if (value.isEmpty || !GetUtils.isPhoneNumber(value)) {
      phoneError.value = "Please enter a valid phone number";
    } else {
      phoneError.value = null;
    }
    updateSignUpButton();
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = "Please enter a password";
    } else {
      passwordError.value = null;
    }
    updateSignUpButton();
  }

  void validateDropdown(String value) {
    if (value.isEmpty || value == "Sign Up As!") {
      dropdownError.value = "Please select a role";
    } else {
      dropdownError.value = null;
    }
    updateSignUpButton();
  }

  void updateSignUpButton() {
    if (fullNameCTRL.text.isNotEmpty &&
        emailCTRL.text.isNotEmpty &&
        phoneCTRL.text.isNotEmpty &&
        passwordCTRL.value.text.isNotEmpty &&
        selectedDropdownItem.value != null &&
        fullNameError.value == null &&
        emailError.value == null &&
        phoneError.value == null &&
        passwordError.value == null &&
        dropdownError.value == null) {
      _enableSignUpButton.value = true;
    } else {
      _enableSignUpButton.value = false;
    }
  }

  bool get enableSignUpButton => _enableSignUpButton.value;
  signUp(
    context, {
    required String emailAddress,
    required String password,
    required String fullName,
    required String phoneNumber,
    required String role,
    required bool isVerify,
    required Widget screen,
  }) async {
    validateForm();
    if (enableSignUpButton) {
      try {
        setLoading(true);
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');

          await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password
        );
        final userId =  FirebaseAuth.instance.currentUser!.uid;
        final documentReference = await users.doc(userId).set({
          'full_name': fullName,
          'email_address': emailAddress,
          'phone_number': phoneNumber,
          "role": role,
          "is_verify": isVerify,
        });
        setLoading(false);
        pushUntil(context, screen);
        sendEmailVerificationLink(context);
        Utils.successBar("User created successfully", context);
      } on FirebaseAuthException catch (e) {
        setLoading(false);

        Utils.flushBarErrorMessage(e.toString(), context);
        print(e.toString());
      } catch (e) {
        setLoading(false);
        print("e $e");
      }
    } else {
      ShowtoastMessage.showToast("Please correct the errors in the form");
    }
  }
final auth = FirebaseAuth.instance;
  sendEmailVerificationLink(context)async{
    try {
      await auth.currentUser?.sendEmailVerification();
      Utils.successBar("Please check your Gmail for the email verification link.", context);
    } catch (e) {
      print(e.toString());
    }
  }

  void validateForm() {
    validateFullName(fullNameCTRL.text);
    validateEmail(emailCTRL.text);
    validatePhone(phoneCTRL.text);
    validatePassword(passwordCTRL.value.text);
    validateDropdown(selectedDropdownItem.value ?? "Sign Up As!");
  }
}
