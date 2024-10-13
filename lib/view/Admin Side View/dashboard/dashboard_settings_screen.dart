import "package:digital_kabaria_app/Utils/app_colors.dart";
import "package:digital_kabaria_app/Utils/app_text.dart";
import "package:flutter/material.dart";

class DashboardSettingsScreen extends StatelessWidget {
  const DashboardSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: AppText(text: "Settings tab",fontSize: 60,fontWeight: FontWeight.bold,color: AppColors.whiteColor,),);
  }
}