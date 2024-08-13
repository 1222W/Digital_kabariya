import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_kabaria_app/Utils/custom_navigation.dart';
import 'package:digital_kabaria_app/common/custom_card_widget.dart';
import 'package:digital_kabaria_app/controllers/get_product_controller.dart';
import 'package:digital_kabaria_app/model/product_model.dart';
import 'package:digital_kabaria_app/utils/app_colors.dart';
import 'package:digital_kabaria_app/utils/app_text.dart';
import 'package:digital_kabaria_app/utils/sized_box_extension.dart';
import 'package:digital_kabaria_app/view/product/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GetProductController controller = Get.put(GetProductController());

  @override
  void initState() {
    super.initState();
    controller.getProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: StreamBuilder(
            stream: controller.getProductData(),
            builder: (context, AsyncSnapshot snapshot) {
              QuerySnapshot? userProduct = snapshot.data;
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final data = userProduct!.docs;
                List<ProductModel> getProduct = productModelFromJson(data);
                return GridView.builder(
                  itemCount: getProduct.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 200, crossAxisCount: 2),
                  itemBuilder: (context, index) {

                    ProductModel productModel = getProduct[index];
                    return GestureDetector(
                      onTap: (){
                        push(context, ProductDetailPage());
                      },
                      child: CustomCard(
                        
                        title: productModel.name,
                        description: productModel.description,
                        price: int.parse(productModel.price),
                        images: productModel.images[0].toString(),
                        
                      ),
                    );
                  },
                );
              }
            }));
  }
}
