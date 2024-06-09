import 'package:get/get.dart';

class UserState extends GetxController {
  
  // User Home Bottom Nav State
final currentIndex = 1.obs;
//
void updateSelectedIndex (int value){
currentIndex.value = value;
}

}