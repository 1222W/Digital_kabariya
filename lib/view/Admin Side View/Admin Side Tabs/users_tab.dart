import 'package:digital_kabaria_app/Utils/app_colors.dart';
import 'package:digital_kabaria_app/Utils/sized_box_extension.dart';
import 'package:digital_kabaria_app/view/Admin%20Side%20View/admin_side_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsersTab extends StatefulWidget {
  const UsersTab({super.key});

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<UsersTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.tealColor,
            ));
          } else {
            return ListView.builder(
                // shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  // final farmerDetails = dashboardData[index];
                  return Container(
                      // height: 50.h,
                      width: double.infinity,
                      padding: EdgeInsets.all(15.sp),
                      margin: EdgeInsets.only(
                          bottom: 5.sp, top: 10, left: 15.w, right: 15.w),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(8.sp),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.blackColor.withOpacity(.15),
                                blurRadius: 2.5,
                                spreadRadius: 2.5)
                          ]),
                      child: Column(
                        children: [
                          buildHorizotalData(key: "ID:", value: "098765432"),
                          buildHorizotalData(
                              key: "Email:", value: "email@gmail.com"),
                          buildHorizotalData(key: "Name:", value: "Haris"),
                          buildHorizotalData(
                              key: "Created At:", value: "09-05-2024"),
                          buildHorizotalData(key: "Status", value: "Active"),
                          buildHorizotalData(
                              key: "Role", value: "user / Kabariya / Company"),
                          10.h.sizedBoxHeight,
                        ],
                      ));
                });
          }
        });
  }
}
