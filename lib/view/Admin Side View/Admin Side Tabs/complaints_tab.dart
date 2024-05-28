// ignore_for_file: deprecated_member_use

import 'package:digital_kabaria_app/Common/custom_button.dart';
import 'package:digital_kabaria_app/Utils/app_colors.dart';
import 'package:digital_kabaria_app/Utils/sized_box_extension.dart';
import 'package:digital_kabaria_app/view/Admin%20Side%20View/admin_side_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComplaintsTab extends StatefulWidget {
  const ComplaintsTab({super.key});

  @override
  State<ComplaintsTab> createState() => _ComplaintsTabState();
}

class _ComplaintsTabState extends State<ComplaintsTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.sp),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: Future.delayed(const Duration(seconds: 2)),
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
                                  bottom: 5.sp,
                                  top: 10,
                                  left: 15.w,
                                  right: 15.w),
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(8.sp),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.blackColor
                                            .withOpacity(.15),
                                        blurRadius: 2.5,
                                        spreadRadius: 2.5)
                                  ]),
                              child: Column(
                                children: [
                                  buildHorizotalData(
                                      key: "Report ID:", value: "098765432"),
                                  buildHorizotalData(
                                      key: "Created By:", value: "Shazaib"),
                                  buildHorizotalData(
                                      key: "For User", value: "Haris"),
                                  buildHorizotalData(key: "Reason", value: ""),
                                  Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                    style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  10.h.sizedBoxHeight,
                                  Row(
                                    children: [
                                      Expanded(
                                          child: CustomButton(
                                        text: "Delete",
                                        onPressed: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             eu.EditUserScreen(
                                          //               docId:
                                          //                   farmerDetails['id'],
                                          //               name: farmerDetails[
                                          //                   'name'],
                                          //               role: farmerDetails[
                                          //                   'userType'],
                                          //             )));
                                        },
                                      )),
                                      10.w.sizedBoxWidth,
                                      Expanded(
                                          child: CustomButton(
                                        text: "Block",
                                        onPressed: () async {
                                          // await blockUser(
                                          //     isBlocked:
                                          //         farmerDetails['status'] ==
                                          //             'Blocked',
                                          //     docId: farmerDetails['id']);
                                        },
                                      )),
                                    ],
                                  )
                                ],
                              ));
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
