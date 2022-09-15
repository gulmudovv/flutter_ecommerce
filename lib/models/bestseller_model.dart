import 'dart:convert';

import 'package:http/http.dart' as http;


class BestsellerItem{

  final int id;
  final bool isFavorite;
  final String title;
  final int priceWithDiscount;
  final int price;
  final String imageUrl;


  BestsellerItem({
    required this.id,
    required this.title,
    required this.isFavorite,
    required this.priceWithDiscount,
    required this.imageUrl,
    required this.price});

  factory BestsellerItem.fromJson(Map<String, dynamic> json) {
    return BestsellerItem(
        id: json['id'] as int,
        title: json['title'].toString(),
        price: json['price_without_discount'] as int,
        priceWithDiscount: json['discount_price'] as int,
        imageUrl: json['picture'].toString(),
        isFavorite: json['is_favorites']  as bool
    );
  }

}

Future<List<BestsellerItem>> fetchBestsellerItems() async {
  final response =
  await http.get(Uri.parse('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175'));
  if (response.statusCode == 200) {
    Map<String,dynamic> map  = json.decode(response.body);
    var list = map["best_seller"];
    var lst = list as List;
    return lst.map((d) => BestsellerItem.fromJson(d)).toList();
  } else {
    throw Exception('Failed to load post');
  }
}