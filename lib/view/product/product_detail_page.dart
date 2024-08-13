import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List items = [
    "assets/images/profile.png",
    "assets/images/home.png",
    "assets/images/deal.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
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
  //  items: items.length,
   options: CarouselOptions(
    
      // height: 300,
      
      aspectRatio: 16/9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      // onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,
   )
 )
      ],
    ),);
  }
}