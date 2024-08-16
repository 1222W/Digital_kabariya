class ProductModel {
  List<String> images;
  String name;
  String description;
  String number;
  String secondNum;
  String price;
  String address;
  String voice;
  String? docId; // Add this line

  ProductModel({
    required this.images,
    required this.name,
    required this.description,
    required this.number,
    required this.secondNum,
    required this.price,
    required this.address,
    required this.voice,
    this.docId, // Add this line
  });

  factory ProductModel.fromJson(Map<String, dynamic> json, String id) => ProductModel(
    images: List<String>.from(json["images"].map((x) => x)),
    name: json["name"],
    description: json["description"],
    number: json["number"],
    secondNum: json["secondNum"],
    price: json["price"],
    address: json["address"],
    voice: json["voice"],
    docId: id, // Add this line
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
