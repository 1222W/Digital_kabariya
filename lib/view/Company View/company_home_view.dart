import 'dart:developer';

import 'package:digital_kabaria_app/common/custom_card_widget.dart';
import 'package:digital_kabaria_app/controllers/company_controllers/company_home_controller.dart';
import 'package:digital_kabaria_app/model/product_model.dart';
import 'package:digital_kabaria_app/utils/app_colors.dart';
import 'package:digital_kabaria_app/view/Company%20View/company_product_detail_page.dart';
import 'package:digital_kabaria_app/view/product/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CompanyHomeView extends StatefulWidget {
  const CompanyHomeView({super.key});

  @override
  State<CompanyHomeView> createState() => _CompanyHomeViewState();
}

class _CompanyHomeViewState extends State<CompanyHomeView> {
  final CompanyHomeController controller = Get.put(CompanyHomeController());

  @override
  void initState() {
    super.initState();
    controller.getProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: StreamBuilder<List<ProductModel>>(
        stream: controller.getProductData(),
        builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found'));
          }

          final List<ProductModel> products = snapshot.data!;
        

          return GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 200,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final ProductModel product = products[index];
              
              return GestureDetector(
                onTap: () {
                  Get.to(() => CompanyProductDetailPage(docId: product.docId!));
                },
                child: CustomCard(
                  title: product.name,
                  description: product.description,
                  price: int.parse(product.price),
                  images: product.images.isNotEmpty ? product.images[0] : '',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
