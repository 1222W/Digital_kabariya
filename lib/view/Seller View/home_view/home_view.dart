import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digital_kabaria_app/controllers/get_product_controller.dart';
import 'package:digital_kabaria_app/model/product_model.dart';
import 'package:digital_kabaria_app/view/product/product_detail_page.dart';
import 'package:digital_kabaria_app/common/custom_card_widget.dart';
import 'package:digital_kabaria_app/utils/app_colors.dart';

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
                  // Navigate to ProductDetailPage with docId
                  Get.to(() => ProductDetailPage(docId: product.docId!));
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
