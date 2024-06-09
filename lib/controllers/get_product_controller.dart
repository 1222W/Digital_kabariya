import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../model/product_model.dart';

class GetProductController extends GetxController {
  final FirebaseFirestore db = FirebaseFirestore.instance;

   getProductData()  {
    try {
      return db.collection("products").snapshots();
      
    } catch (e) {
      print(e.toString());
    }
  }
}
