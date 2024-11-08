import "package:digital_kabaria_app/Utils/app_colors.dart";
import "package:digital_kabaria_app/Utils/app_text.dart";
import "package:digital_kabaria_app/common/custom_button.dart";
import "package:digital_kabaria_app/controllers/rates_controller.dart";
import "package:digital_kabaria_app/utils/app_strings.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../common/custom_text_form_field.dart";

class DashboardRatesScreen extends StatelessWidget {
  DashboardRatesScreen({super.key});

  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            CustomTextFormField(
              controller: title,
              hintText: "Title",
              flag: true,
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomTextFormField(
              controller: price,
              hintText: "Price",
              flag: true,
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomButton(
              btnHeight: 40,
              btnWidth: 200,
              onPressed: () {
            RatesController  controller =     Get.put(RatesController());
            controller.addRates(context,title: title.text,price:price.text );
              },
              text: AppStrings.submit,
              btnColor: AppColors.appColor,
            ),
         
          ],
        ),
      ),
    );
  }
}
