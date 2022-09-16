import 'dart:convert';

import 'package:http/http.dart' as http;


class ProductDetail{


  final String cpu;
   final String camera;
  final String id;
  final List<String> capacity;
  final List<String> colors;
  final List<String> images;
  final bool isFavorites;
  final int price;
  final String title;
  final double rating;
  final String sd;
  final String ssd;





  factory ProductDetail.fromJson(Map<String, dynamic> json) {



    return ProductDetail(
     cpu: json['CPU'] as String,
    camera: json['camera'] as String,
    id: json['id'] as String,
    capacity:  List.from(json['capacity']),
    colors: List.from(json['color']),
    images:  List.from(json['images']),
    isFavorites: json['isFavorites'] as bool,
    price: json['price'] as int,
    title: json['title'] as String,
    rating: json['rating'] as double,
    sd: json['sd'] as String,
    ssd: json['ssd'] as String,
    );
  }

  ProductDetail({
  required this.cpu,
  required this.camera,
  required this.id,
  required this.capacity,
  required this.colors,
  required this.images,
  required this.isFavorites,
  required this.price,
  required this.title,
  required this.rating,
  required this.sd,
  required this.ssd
  });

}

Future<ProductDetail> fetchProductDetail() async {
  final response = await http.get(Uri.parse('https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5'));
  if (response.statusCode == 200) {

    Map<String,dynamic> map  = json.decode(response.body);


    var obj = ProductDetail.fromJson(map);
    print("STATUS: ${obj}");
    return ProductDetail.fromJson(map);


  } else {
    throw Exception('Failed to load post');
  }
}