import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthStateController extends GetxController {
  // Auth Text Editing Controllers
  final emailCTRL = TextEditingController().obs;
  final passwordCTRL = TextEditingController().obs;
  final recoverEmailCTRL = TextEditingController().obs;

  // Hide Password Functionality
  final RxBool _obsecurePassword = true.obs;
  bool get obsecurePassword => _obsecurePassword.value;
  void togglePassword() {
    _obsecurePassword.value = !_obsecurePassword.value;
    update();
  }

  // Login Remember Me Functionality
  final RxBool rememberMe = true.obs;
  // bool get rememberMe => _rememberMe.value;
  void toggleRemeberMe(bool? value) {
    rememberMe.value = value!;
    update();
  }

  // Enable Login Button
  final RxBool _enableLoginButton = false.obs;
  bool get enableLoginButton => _enableLoginButton.value;
  void updateLoginButton() {
    log("Email ${emailCTRL.value.text} && Password ${passwordCTRL.value.text}");
    if (emailCTRL.value.text.isEmpty || passwordCTRL.value.text.isEmpty) {
      _enableLoginButton.value = false;
    } else {
      _enableLoginButton.value = true;
    }
    update();
  }

  // Auto Validate Login Form
  final autoValidate = false.obs;
}
