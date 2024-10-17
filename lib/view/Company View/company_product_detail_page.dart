import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_kabaria_app/Common/custom_button.dart';
import 'package:digital_kabaria_app/Utils/app_colors.dart';
import 'package:digital_kabaria_app/Utils/app_strings.dart';
import 'package:digital_kabaria_app/Utils/app_text.dart';
import 'package:digital_kabaria_app/Utils/custom_dialog.dart';
import 'package:digital_kabaria_app/Utils/custom_navigation.dart';
import 'package:digital_kabaria_app/controllers/company_controllers/company_product_detail_controller.dart';
import 'package:digital_kabaria_app/controllers/product/product_detail_controller.dart';
import 'package:digital_kabaria_app/model/product_model.dart';
import 'package:digital_kabaria_app/view/Seller%20View/buy_scraps_view.dart';
import 'package:digital_kabaria_app/view/Seller%20View/location/location_screen.dart';
import 'package:digital_kabaria_app/view/product/map_screen.dart';
import 'package:digital_kabaria_app/widgets/product_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound_record/flutter_sound_record.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:voice_message_package/voice_message_package.dart';

import '../../Utils/preferences.dart';

class CompanyProductDetailPage extends StatefulWidget {
  final String docId;
  CompanyProductDetailPage({super.key, required this.docId});

  @override
  State<CompanyProductDetailPage> createState() => _CompanyProductDetailPageState();
}

class _CompanyProductDetailPageState extends State<CompanyProductDetailPage> {
  bool _isRecording = false;
  String _recordedFilePath = '';
  bool _hasRecordedFile = false;
  final FlutterSoundRecord _audioRecorder = FlutterSoundRecord();
  final CompanyProductDetailController controller = Get.put(CompanyProductDetailController());
  TextEditingController bidController = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.getProductDetail(widget.docId);
    getUserData();
  }

  getUserData() async {
    var user = await Preferences.getData();
    var userName = user["full_name"];
    print("userName $userName");
    return userName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: const AppText(
          text: AppStrings.productDetail,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          maxLines: 2,
        ),
      ),
      body: GetBuilder<CompanyProductDetailController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final product = controller.productModel;

          if (product == null) {
            return const Center(child: Text('No product data available'));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider.builder(
                  itemCount: product.images.length,
                  itemBuilder: (context, index, realIdx) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          product.images[index],
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: product.name,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        maxLines: 2,
                      ),
                      AppText(
                        text: product.description,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        maxLines: 10,
                      ),
                      NumberWidget(
                        numberOne: product.number,
                        numberTwo: product.secondNum,
                      ),
                      ProductAdrees(
                        address: product.address,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomButton(
                        btnWidth: 150,
                        btnHeight: 40,
                        text: "Track Location",
                        onPressed: () {
                          print("product.lat ${product.lat}");
                          print("product.lng ${product.lng}");
                          push(
                              context,
                              MapScreen(
                                lat: product.lat,
                                lng: product.lng,
                              ));
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      if (product.voice.isNotEmpty)
                        VoiceMessageView(
                          circlesColor: AppColors.appColor,
                          activeSliderColor: AppColors.greyColor,
                          controller: VoiceController(
                            audioSrc: product.voice,
                            maxDuration: const Duration(seconds: 10),
                            isFile: false,
                            onComplete: () {
                              print('Recording complete');
                            },
                            onPause: () {
                              print('Playback paused');
                            },
                            onPlaying: () {
                              print('Playback started');
                            },
                            onError: (err) {
                              print('Voice recording error: $err');
                            },
                          ),
                          innerPadding: 12,
                          cornerRadius: 20,
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Expanded(
                      child: CustomButton(
                        // btnWidth: 200,
                        btnHeight: 40,
                        text: "Call Number One",
                        textSize: 12.0,
                        onPressed: () {
                          launchUrlString("tel://"+"${product.number}");
                         }),
                    ),
                    const SizedBox(width: 10,),
                       Expanded(
                         child: CustomButton(
                                             // btnWidth: 200,
                                             btnHeight: 40,
                                             text: "Call Number Two",
                        textSize: 12.0,

                                             onPressed: () {
                          launchUrlString("tel://"+"${product.secondNum}");
                                              
                         }),
                       )
                  ],),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: CustomButton(
                //     btnWidth: double.infinity,
                //     btnHeight: 40,
                //     text: "Send Bid",
                //     onPressed: () {
                //       showBidDialog(
                //         context,
                //         bidController,
                //         productName: product.name,
                //         productPrice: product.price,
                //         productDescription: product.description,
                //         productImage: product.images[0],
                //         productId: widget.docId,
                //       );
                //     },
                //   ),
                // ),
              
              ],
            ),
          );
        },
      ),
    );
  }
}
