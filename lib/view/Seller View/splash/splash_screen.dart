import 'package:digital_kabaria_app/utils/app_colors.dart';
import 'package:digital_kabaria_app/utils/app_text.dart';
import 'package:digital_kabaria_app/utils/custom_navigation.dart';
import 'package:digital_kabaria_app/view/Seller%20View/Auth%20View/login_view.dart';
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
  }

  void _toggleFade() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showSecond = !_showSecond;
        });
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {

            pushReplacement(context, LoginView());
          }
        });
      }
    });
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
