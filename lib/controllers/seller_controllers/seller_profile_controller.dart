import 'package:digital_kabaria_app/Common/constants/constants.dart';
import 'package:digital_kabaria_app/Utils/utils.dart';
import 'package:get/get.dart';

class SellerProfileController extends GetxController {
  getProfile() async {
    try {
      return await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .get();
    } catch (e) {
      print(e.toString());
    }
  }

 RxBool isLoading = false.obs;
  updateProfile(context,{fullName,email,phone})async{
try {
  isLoading.value =true;
  var data = {
    "full_name" : fullName,
    "email_address":email,
    "phone_number":phone
  };
  await firestore
          .collection("users")
          .doc(auth.currentUser!.uid).update(data);
          isLoading.value =false;
          Utils.successBar("Profile Updated SuccessFully!", context);
} catch (e) {
  isLoading.value =false;
  print(e.toString());
  
}
  }


}
