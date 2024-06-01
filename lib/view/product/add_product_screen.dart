import "package:digital_kabaria_app/common/add_product_widget/add_product_widgets.dart";
import "package:digital_kabaria_app/common/custom_app_bar.dart";
import "package:digital_kabaria_app/common/custom_bottom_sheet.dart";
import "package:digital_kabaria_app/common/custom_button.dart";
import "package:digital_kabaria_app/common/custom_text_form_field.dart";
import "package:digital_kabaria_app/utils/app_strings.dart";
import "package:digital_kabaria_app/utils/sized_box_extension.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        flag: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.h.sizedBoxHeight,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                        1,
                        (index) =>  Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: ProductImageContainer(onTap: () {
                                // print("click");
                                showCustomBottomSheet(context);
                              },),
                            ))),
              ),
              20.h.sizedBoxHeight,
              const CustomTextFormField(
                // controller: controller.fullNameCTRL,
                hintText: "Product Name",
                flag: true,
                // onChanged: controller.validateFullName,
                // errorText: controller.fullNameError.value,
              ),
              20.h.sizedBoxHeight,
              const CustomTextFormField(
                maxLines: 3,
                // controller: controller.fullNameCTRL,
                hintText: "Product Description",
                flag: true,
                // onChanged: controller.validateFullName,
                // errorText: controller.fullNameError.value,
              ),
              20.h.sizedBoxHeight,
              const CustomTextFormField(
                // controller: controller.fullNameCTRL,
                hintText: "Product Price",
                flag: true,
                // onChanged: controller.validateFullName,
                // errorText: controller.fullNameError.value,
              ),
              20.h.sizedBoxHeight,
              CustomButton(
                text: AppStrings.submit,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
