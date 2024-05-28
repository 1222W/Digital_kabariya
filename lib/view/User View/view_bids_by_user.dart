import 'package:digital_kabaria_app/Common/custom_app_bar.dart';
import 'package:digital_kabaria_app/Common/custom_button.dart';
import 'package:digital_kabaria_app/Utils/app_colors.dart';
import 'package:digital_kabaria_app/Utils/sized_box_extension.dart';
import 'package:digital_kabaria_app/view/User%20View/buy_scraps_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewBidsByUsers extends StatefulWidget {
  const ViewBidsByUsers({super.key});

  @override
  State<ViewBidsByUsers> createState() => _ViewBidsByUsersState();
}

class _ViewBidsByUsersState extends State<ViewBidsByUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        flag: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: OvalRightBorderClipper(),
            child: Container(
              height: 50.h,
              width: 150.w,
              color: AppColors.brownColor,
              child: Center(
                  child: Text(
                "Company Bids",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              )),
            ),
          ),
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
                        color: AppColors.brownColor.withOpacity(.10),
                        border: Border.all(
                            color: AppColors.blackColor.withOpacity(.1)),
                        borderRadius: BorderRadius.circular(8.sp)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildScrapDetails(key: "Bid By", value: "Usman Muaz"),
                        buildScrapDetails(key: "Bid Amount", value: "900 PKR"),
                        buildScrapDetails(
                            key: "Orignal Price", value: "1000 PKR"),
                        buildScrapDetails(key: "type", value: "Pick Up"),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0.w, vertical: 10.h),
                          child: Row(
                            children: [
                              Expanded(
                                  child: CustomButton(
                                text: "Accept",
                                onPressed: () {},
                              )),
                              10.w.sizedBoxWidth,
                              Expanded(
                                  child: CustomButton(
                                text: "Reject",
                                btnColor: AppColors.whiteColor,
                                textColor: AppColors.blackColor,
                                onPressed: () {},
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
