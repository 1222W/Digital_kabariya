import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_kabaria_app/common/app_toast_message.dart';
import 'package:digital_kabaria_app/model/users.model.dart';
import 'package:digital_kabaria_app/utils/custom_navigation.dart';
import 'package:digital_kabaria_app/utils/firebase_data.dart';
import 'package:digital_kabaria_app/utils/utils.dart';
import 'package:digital_kabaria_app/view/User%20View/approval/approval_screen.dart';
import 'package:digital_kabaria_app/view/User%20View/user_home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthStateController extends GetxController {
  // Auth Text Editing Controllers
  final emailCTRL = TextEditingController();
  final passwordCTRL = TextEditingController();
  final recoverEmailCTRL = TextEditingController().obs;
  final isLoading = false.obs;
  void setLoading(value) {
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
    if (value.isEmpty || !GetUtils.isEmail(value)) {
      emailError.value = "Please enter a valid email";
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
    if (emailCTRL.text.isNotEmpty &&
        passwordCTRL.value.text.isNotEmpty &&
        emailError.value == null &&
        passwordError.value == null) {
      _enableLoginButton.value = true;
    } else {
      _enableLoginButton.value = false;
    }
  }

  final autoValidate = false.obs;

  login(
    context, {
    required String emailAddress,
    required String password,
  }) async {
    updateLoginButton();
    if (enableLoginButton) {
      try {
        setLoading(true);
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailAddress, password: password);
        String id = FirebaseAuth.instance.currentUser!.uid;
        final user = await FirebaseFirestore.instance
            .collection(Collection.user)
            .doc(id)
            .get();
        UsersModel userModel = UsersModel.fromJson(user.data()!);
        setLoading(false);
        if (userModel.isVerify) {
          
          pushReplacement(context, const UserHomeView());
        } else {
          pushReplacement(context, const RequestApprovalScreen());
        }
        Utils.successBar("User Sign in SuccessFully!", context);
      } on FirebaseAuthException catch (e) {
        setLoading(false);

        Utils.flushBarErrorMessage(e.toString(), context);

        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
