import 'package:digital_kabaria_app/Utils/app_colors.dart';
import 'package:digital_kabaria_app/Utils/languages.dart';
import 'package:digital_kabaria_app/view/Auth%20View/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
          MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
      child: GetMaterialApp(
        title: 'Digital Kabariya',
        translations: AppTranslations(),
        locale: const Locale('en'), // Initial locale
        fallbackLocale: const Locale('en'),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: "NunitoSans",
          scaffoldBackgroundColor: AppColors.whiteColor,
          useMaterial3: true,
        ),
        home: const LoginView(),
      ),
    );
  }
}
