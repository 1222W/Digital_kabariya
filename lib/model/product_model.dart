// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson( str) => List<ProductModel>.from((str).map((x) => ProductModel.fromJson(x.data())));

// String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
    List<String> images;
    String name;
    String description;
    String number;
    String secondNum;
    String price;
    String address;
    String voice;

    ProductModel({
        required this.images,
        required this.name,
        required this.description,
        required this.number,
        required this.secondNum,
        required this.price,
        required this.address,
        required this.voice,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        images: List<String>.from(json["images"].map((x) => x)),
        name: json["name"],
        description: json["description"],
        number: json["number"],
        secondNum: json["secondNum"],
        price: json["price"],
        address: json["address"],
        voice: json["voice"],
    );

    Map<String, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x)),
        "name": name,
        "description": description,
        "number": number,
        "secondNum": secondNum,
        "price": price,
        "address": address,
        "voice": voice,
    };
}
