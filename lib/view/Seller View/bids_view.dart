import 'package:digital_kabaria_app/common/custom_button.dart';
import 'package:digital_kabaria_app/utils/app_colors.dart';
import 'package:digital_kabaria_app/utils/sized_box_extension.dart';
import 'package:digital_kabaria_app/view/Seller%20View/view_bids_by_user.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class BidsView extends StatefulWidget {
  const BidsView({super.key});

  @override
  State<BidsView> createState() => _BidsViewState();
}

class _BidsViewState extends State<BidsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ClipPath(
          //   clipper: OvalRightBorderClipper(),
          //   child: Container(
          //     height: 50.h,
          //     width: 150.w,
          //     color: AppColors.appColor,
          //     child: Center(
          //         child: Text(
          //       "Bids",
          //       style: TextStyle(
          //           color: AppColors.whiteColor,
          //           fontSize: 18.sp,
          //           fontWeight: FontWeight.w500),
          //     )),
          //   ),
          // ),
          10.h.sizedBoxHeight,
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.all(15.sp),
              children: List.generate(
                5,
                (index) => ClipRRect(
                  borderRadius: BorderRadius.circular(8.sp),
                  child: Container(
                    width: double.infinity,

                    // padding: EdgeInsets.all(15.sp),
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                        color: AppColors.appColor.withOpacity(.10),
                        border: Border.all(
                            color: AppColors.blackColor.withOpacity(.1)),
                        borderRadius: BorderRadius.circular(8.sp)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/old_scrap.png",
                          height: 150.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0.sp),
                          child: Row(
                            children: [
                              Text(
                                "Old Table",
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                "1000 PKR",
                                style: TextStyle(
                                    color: AppColors.appColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description:",
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              10.h.sizedBoxHeight,
                              Text(
                                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur",
                                style: TextStyle(
                                    color: AppColors.blackColor.withOpacity(.5),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0.w, vertical: 10.h),
                            child: CustomButton(
                              text: "View All Bids",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: const ViewBidsByUsers(),
                                        type: PageTransitionType.rightToLeft));
                              },
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    ;
  }
}
