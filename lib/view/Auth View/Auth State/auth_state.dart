import 'dart:developer';

import 'package:digital_kabaria_app/common/app_toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthStateController extends GetxController {
  // Auth Text Editing Controllers
  final emailCTRL = TextEditingController();
  final passwordCTRL = TextEditingController();
  final recoverEmailCTRL = TextEditingController().obs;
  final isLoading  = false.obs;
  void setLoading(value){
    isLoading.value = value;
  }

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

  final emailError = RxnString(null);
  final passwordError = RxnString(null);

  void validateEmail(String value) {
    if (value.isEmpty || GetUtils.isEmail(value)) {
      emailError.value = "Please enter email";
    } else {
      emailError.value = null;
    }
    updateLoginButton();
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = "Please enter a password";
    } else {
      passwordError.value = null;
    }
    updateLoginButton();
  }

  // Enable Login Button
  final RxBool _enableLoginButton = false.obs;
  bool get enableLoginButton => _enableLoginButton.value;
  void updateLoginButton() {
    if (emailCTRL.text.isEmpty && passwordCTRL.text.isEmpty && emailError.value == null && passwordError.value == null) {
      _enableLoginButton.value = false;
    } else {
      _enableLoginButton.value = true;
    }
  }

  final autoValidate = false.obs;

  login({required String emailAddress, required String password}) async {
    updateLoginButton();
    if (enableLoginButton) {
      
    try {
      setLoading(true);
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
          setLoading(false);
      ShowtoastMessage.showSuccessbar(message: "User Sign in SuccessFully!");
    } on FirebaseAuthException catch (e) {
          setLoading(false);

      ShowtoastMessage.showErrorbar(message: e.toString());

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
    }
}
