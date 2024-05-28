import 'package:digital_kabaria_app/Utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowtoastMessage {
  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColors.tealColor,
        textColor: AppColors.whiteColor,
        fontSize: 14.sp);
  }
}
