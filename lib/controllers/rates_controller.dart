import 'package:digital_kabaria_app/Common/constants/constants.dart';
import 'package:digital_kabaria_app/utils/utils.dart';
import 'package:get/get.dart';

class RatesController extends GetxController {

  addRates(context,{title,price})async{
    var data = {
      "title":title,
      "price":price,
    };
    try {
     await firestore.collection('rates').add(data);
     Utils.successBar("Rate Added SuccessFully", context);
    } catch (e) {
      print(e.toString());
    }
  }
  
}