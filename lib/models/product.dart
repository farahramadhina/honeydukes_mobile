// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Model model;
  int pk;
  Fields fields;

  Product({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  int amount;
  int price;
  String description;
  String category;
  String image;

  Fields({
    required this.user,
    required this.name,
    required this.amount,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
      };
}

enum Model { MAIN_PRODUCT }

final modelValues = EnumValues({"main.product": Model.MAIN_PRODUCT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
