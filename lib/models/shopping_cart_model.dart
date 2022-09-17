import 'dart:convert';

import 'package:http/http.dart' as http;

class BasketModel {
  late int id;
  late String image;
  late int price;
  late String title;

  BasketModel(
      {required this.id,
      required this.image,
      required this.price,
      required this.title});

  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] as int,
      image: json['images'] as String,
    );
  }
}

class ShoppingCartModel {
  late String id;
  late int total;
  late String delivery;
  late List<BasketModel> basketList;

  ShoppingCartModel(
      {required this.id,
      required this.total,
      required this.delivery,
      required this.basketList});

  ShoppingCartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    total = json['total'] as int;
    delivery = json['delivery'] as String;
    basketList = <BasketModel>[];
    json['basket'].forEach((v) {
      basketList.add(BasketModel.fromJson(v));
    });
  }
}

Future<ShoppingCartModel> fetchShoppingCart() async {
  final response = await http.get(Uri.parse(
      'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149'));
  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    return ShoppingCartModel.fromJson(map);
  } else {
    throw Exception('Failed to load post');
  }
}
