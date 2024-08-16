import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_kabaria_app/Utils/app_colors.dart';
import 'package:digital_kabaria_app/Utils/app_strings.dart';
import 'package:digital_kabaria_app/Utils/app_text.dart';
import 'package:digital_kabaria_app/controllers/product/product_detail_controller.dart';
import 'package:digital_kabaria_app/model/product_model.dart';
import 'package:digital_kabaria_app/widgets/product_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound_record/flutter_sound_record.dart';
import 'package:get/get.dart';
import 'package:voice_message_package/voice_message_package.dart';

class ProductDetailPage extends StatefulWidget {
  final String docId;
  ProductDetailPage({super.key, required this.docId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool _isRecording = false;
  String _recordedFilePath = '';
  bool _hasRecordedFile = false;
  final FlutterSoundRecord _audioRecorder = FlutterSoundRecord();
  final ProductDetailController controller = Get.put(ProductDetailController());

  @override
  void initState() {
    super.initState();
    controller.getProductDetail(widget.docId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: AppText(
          text: AppStrings.productDetail,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          maxLines: 2,
        ),
      ),
      body: GetBuilder<ProductDetailController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final product = controller.productModel;

          if (product == null) {
            return const Center(child: Text('No product data available'));
          }

          return Column(
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
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
                    ), // Update or implement this widget as needed

                    // Display voice message view if there is a recorded file
                    if (product.voice.isNotEmpty)
                      VoiceMessageView(
                        circlesColor: AppColors.appColor,
                        activeSliderColor: AppColors.greyColor,
                        controller: VoiceController(
                          audioSrc: product.voice,
                          maxDuration: Duration(seconds: 10),
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
            ],
          );
        },
      ),
    );
  }
}
