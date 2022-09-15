import 'dart:convert';

import 'package:http/http.dart' as http;


class StoreItem{

  final int id;
  final bool isNew;
  final String title;
  final String subtitle;
  final String imageUrl;
  final bool isBuy;

  StoreItem({required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.isBuy,
    required this.isNew});

  factory StoreItem.fromJson(Map<String, dynamic> json) {
    return StoreItem(
        id: json['id'] as int,
        title: json['title'].toString(),
        subtitle: json['subtitle'].toString(),
        imageUrl: json['picture'].toString(),
        isBuy: json['is_buy'] as bool,
       isNew: json['is_new']  != null ? true : false
    );
  }

}

Future<List<StoreItem>> fetchHotSaleItems() async {
  final response =
  await http.get(Uri.parse('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175'));
  if (response.statusCode == 200) {
    Map<String,dynamic> map  = json.decode(response.body);
    var list = map["home_store"];

    var lst = list as List;
    return lst.map((d) => StoreItem.fromJson(d)).toList();
  } else {
    throw Exception('Failed to load post');
  }
}