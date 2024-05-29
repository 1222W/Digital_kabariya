import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_kabaria_app/Common/app_toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailCTRL = TextEditingController();
  final phoneCTRL = TextEditingController();
  final passwordCTRL = TextEditingController().obs;
  final fullNameCTRL = TextEditingController();
  final obsecurePassword = true.obs;
  var isLoading =  false.obs;

  void setLoading(bool loading){
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
  signUp({
    required String emailAddress,
    required String password,
    required String fullName,
    required String phoneNumber,
    required String role,
  }) async {
    validateForm();
    if (enableSignUpButton) {
      try {
        setLoading(true);
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
        final documentReference = await users.add({
          'full_name': fullName,
          'email_address': emailAddress,
          'phone_number': phoneNumber,
          "role": role,
        });
        print("User created successfully with ID: ${documentReference.id}");
        setLoading(false);

        ShowtoastMessage.showSuccessbar(message: "User created successfully");
      } on FirebaseAuthException catch (e) {
        setLoading(false);

        ShowtoastMessage.showErrorbar(message: e.toString());
        print(e.toString());
      } catch (e) {
        print("e $e");
      }
    } else {
      ShowtoastMessage.showToast("Please correct the errors in the form");
    }
  }

  //  signUp({
  //   required String emailAddress,
  //   required String password,
  //   required String fullName,
  //   required String phoneNumber,
  //   required String role,
  // }) async {
  //   validateForm();

  //   if (enableSignUpButton) {
  //     try {
  //       CollectionReference users =
  //           FirebaseFirestore.instance.collection('users');
  //       debugger();

  //       final credential = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(
  //         email: emailAddress,
  //         password: password,
  //       )
  //           .then((value) {
  //       debugger();

  //         final documentReference =  users.add({
  //       'full_name': fullName,
  //       'email_address': emailAddress,
  //       'phone_number': phoneNumber,
  //       "role": role,
  //     })

  //             .then((value) => Get.snackbar("", "User Created SucessFully!"))
  //             .catchError((error) => print("Failed to add user: $error"));
  //       // print("data $data");
  //       });
  //       debugger();
  //     } on FirebaseAuthException catch (e) {
  //       debugger();

  //       if (e.code == 'weak-password') {
  //         print('The password provided is too weak.');
  //       } else if (e.code == 'email-already-in-use') {
  //         print('The account already exists for that email.');
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else {
  //     ShowtoastMessage.showToast("Please correct the errors in the form");
  //   }
  // }

  void validateForm() {
    validateFullName(fullNameCTRL.text);
    validateEmail(emailCTRL.text);
    validatePhone(phoneCTRL.text);
    validatePassword(passwordCTRL.value.text);
    validateDropdown(selectedDropdownItem.value ?? "Sign Up As!");
  }
}
