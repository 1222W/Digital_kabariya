import "package:digital_kabaria_app/Utils/app_colors.dart";
import "package:digital_kabaria_app/Utils/app_text.dart";
import "package:flutter/material.dart";

class DashboardSignOutScreen extends StatelessWidget {
  const DashboardSignOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: AppText(text: "Sign out tab",fontSize: 60,fontWeight: FontWeight.bold,color: AppColors.whiteColor,),);
  }
}