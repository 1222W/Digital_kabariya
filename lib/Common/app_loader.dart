import 'package:digital_kabaria_app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 5.w,
        strokeCap: StrokeCap.round,
        color: AppColors.tealColor,
      ),
    );
  }
}
