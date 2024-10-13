import 'package:digital_kabaria_app/common/custom_app_bar.dart';
import 'package:digital_kabaria_app/common/custom_button.dart';
import 'package:digital_kabaria_app/utils/app_colors.dart';
import 'package:digital_kabaria_app/utils/custom_navigation.dart';
import 'package:digital_kabaria_app/utils/sized_box_extension.dart';
import 'package:digital_kabaria_app/view/product/add_product_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostedMaterialView extends StatefulWidget {
  const PostedMaterialView({super.key});

  @override
  State<PostedMaterialView> createState() => _PostedMaterialViewState();
}

class _PostedMaterialViewState extends State<PostedMaterialView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                                      color:
                                          AppColors.blackColor.withOpacity(.5),
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
                                text: "Delete",
                                onPressed: () {
                                  deletePostedMaterial(context);
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
        ),
        floatingActionButton: CustomButton(
          text: "Post New",
          btnWidth: 200,
          btnColor: AppColors.whiteColor,
          textColor: AppColors.blackColor,
          border: BorderSide(color: AppColors.blackColor.withOpacity(.5)),
          onPressed: () {
            push(context,AddPostScreen());
          },
        ));
  }
}

// deletePostedMaterial Dialogue
void deletePostedMaterial(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Delete Post!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Are you sure you want to delete this post?',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.blackColor.withOpacity(.50),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              // DATE PICKER

              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    text: "Confirm",
                    onPressed: () {},
                  )),
                  10.w.sizedBoxWidth,
                  Expanded(
                      child: CustomButton(
                    text: "Cancel",
                    btnColor: AppColors.whiteColor,
                    textColor: AppColors.blackColor,
                    border:
                        BorderSide(color: AppColors.appColor.withOpacity(.5)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
