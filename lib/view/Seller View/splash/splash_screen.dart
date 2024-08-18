import 'dart:developer';

import 'package:digital_kabaria_app/Utils/preferences.dart';
import 'package:digital_kabaria_app/model/users.model.dart';
import 'package:digital_kabaria_app/utils/app_colors.dart';
import 'package:digital_kabaria_app/utils/app_text.dart';
import 'package:digital_kabaria_app/utils/custom_navigation.dart';
import 'package:digital_kabaria_app/utils/enums.dart';
import 'package:digital_kabaria_app/view/Collector%20View/collector_bottom_nav_view.dart';
import 'package:digital_kabaria_app/view/Seller%20View/Auth%20View/login_view.dart';
import 'package:digital_kabaria_app/view/Seller%20View/home_view/seller_home_view.dart';
import 'package:digital_kabaria_app/view/Seller%20View/verification/verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override 
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showSecond = false;

  @override
  void initState() {
    super.initState();
    _toggleFade();
    checkUser(context);
  }

  void _toggleFade() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showSecond = !_showSecond;
        });
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            pushReplacement(context, const LoginView());
          }
        });
      }
    });
  }

  checkUser(context) async {
    var user = await Preferences.getData();
    if (user == null) {
      pushUntil(context, const LoginView());
    } else {
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        if (user['role'] == ROLENAME.Seller.name) {
          pushUntil(context, const SellerHomeView());
        } else if (user['role'] == ROLENAME.Collector.name) {
          pushUntil(context, const CollectorBottomNavBar());
        } else if (user['role'] == ROLENAME.Collector.name) {
          pushUntil(context, const CollectorBottomNavBar());
        }
      }else{
          pushUntil(context, const VerfificationScreen());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: AnimatedCrossFade(
          firstChild: Image.asset(
            "assets/images/app_logo_dk.png",
            height: 200,
            width: 200,
          ),
          secondChild: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/app_logo_dk.png",
                height: 30,
                width: 30,
              ),
              const AppText(
                text: " Digital Kabariya",
                fontSize: 30,
              ),
            ],
          ),
          crossFadeState: _showSecond
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(seconds: 2),
        ),
      ),
    );
  }
}
