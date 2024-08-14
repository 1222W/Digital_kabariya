import 'package:digital_kabaria_app/Utils/app_strings.dart';
import 'package:digital_kabaria_app/Utils/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: AppStrings.numberOne,fontSize: 14,fontWeight: FontWeight.bold,maxLines: 2,),
              AppText(text: "0584958373",fontSize: 14,fontWeight: FontWeight.w500,maxLines: 2,),
            ],
          ),
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: AppStrings.numberTwo,fontSize: 14,fontWeight: FontWeight.bold,maxLines: 2,),
              AppText(text: "0584958373",fontSize: 14,fontWeight: FontWeight.w500,maxLines: 2,),
            ],
          ),
        
        ],
       );
  }
}

class ProductAdrees extends StatelessWidget {
  const ProductAdrees({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               AppText(text: AppStrings.address,fontSize: 14,fontWeight: FontWeight.bold,maxLines: 2,),
              AppText(text: "Lahore Pakistan",fontSize: 14,fontWeight: FontWeight.w500,maxLines: 2,),
            ],
          );
        
  }
}