import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_kabaria_app/Utils/app_colors.dart';
import 'package:digital_kabaria_app/Utils/app_strings.dart';
import 'package:digital_kabaria_app/Utils/app_text.dart';
import 'package:digital_kabaria_app/widgets/product_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound_record/flutter_sound_record.dart';
import 'package:voice_message_package/voice_message_package.dart';

class ProductDetailPage extends StatefulWidget {
   ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
    bool _isRecording = false;
  String _recordedFilePath = '';
  bool _hasRecordedFile = false;
    final FlutterSoundRecord _audioRecorder = FlutterSoundRecord();

  List items = [
    "assets/images/profile.png",
    "assets/images/home.png",
    "assets/images/deal.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.whiteColor,title: AppText(text: AppStrings.productDetail,fontSize: 20,fontWeight: FontWeight.bold,maxLines: 2,),),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          itemCount: items.length,
          itemBuilder: (context, index, realIdx) {
          return Container(
            width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
          ),
            child: Center(
                child: Image.asset(items[index],
                    fit: BoxFit.cover, )),
          );
        },
       options: CarouselOptions(
      aspectRatio: 16/9,
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
       )
     ),
      Padding(
       padding:  EdgeInsets.symmetric(horizontal: 10),
       child:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: AppStrings.productName,fontSize: 20,fontWeight: FontWeight.bold,maxLines: 2,),
          AppText(text: AppStrings.productDescr,fontSize: 14,fontWeight: FontWeight.w500,maxLines: 10,),
          NumberWidget(),
          ProductAdrees(),
          // if(_hasRecordedFile)
                VoiceMessageView(
                  circlesColor: AppColors.appColor,
                  activeSliderColor: AppColors.greyColor,
                  controller: VoiceController(
                    audioSrc: _recordedFilePath,
                    maxDuration:  Duration(seconds: 10),
                    isFile: true,
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
    ),);
  }
}