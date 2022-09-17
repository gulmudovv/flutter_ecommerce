import 'package:ecommerce/screen/detail_page.dart';
import 'package:flutter/material.dart';

import '../models/bestseller_model.dart';

class BestSellerWidget extends StatefulWidget {
  @override
  State<BestSellerWidget> createState() => _BestSellerWidgetState();
}

class _BestSellerWidgetState extends State<BestSellerWidget> {
  List<int> isFavoriteList = [];

  String samsungImageUrl = 'https://i.expansys.net/i/b/b373953-8.jpg';

  String wrongUrl =
      'https://opt-1739925.ssl.1c-bitrix-cdn.ru/upload/iblock/c01/c014d088c28d45b606ed8c58e5817172.jpg?160405904823488';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Best Seller",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "see more",
                  style: TextStyle(color: Color.fromRGBO(243, 98, 35, 1)),
                ))
          ],
        ),
        FutureBuilder(
            future: fetchBestsellerItems(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  //padding: EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width - 30,
                  height: MediaQuery.of(context).size.height - 50,
                  child: GridView.builder(
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.only(top: 5),
                      //shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3,
                          mainAxisExtent: 230),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var isFavor =
                            isFavoriteList.contains(snapshot.data![index].id);
                        var imageUrl = snapshot.data![index].imageUrl;
                        if (imageUrl == wrongUrl) {
                          imageUrl = samsungImageUrl;
                        }
                        return _buildCard(
                            snapshot.data![index].id,
                            snapshot.data![index].title,
                            snapshot.data![index].priceWithDiscount,
                            snapshot.data![index].price,
                            imageUrl,
                            isFavor,
                            context);
                      }),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ],
    );
  }

  Widget _buildCard(int index, String name, int price, int priceWithDiscount,
      String image, bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 3,
              )
            ],
            color: Colors.white,
          ),
          child: Column(children: [
            Container(
              //margin: EdgeInsets.only(top:5),
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(image, scale: 3),
                ),
              ),

              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          isFavoriteFunc(index);
                          setState(() {});
                        },
                        icon: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 0.1,
                                  blurRadius: 0.1,
                                )
                              ],
                            ),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 18,
                              color: Colors.red,
                            )))
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "\$${priceWithDiscount.toString()}",
                        style: TextStyle(
                          color: Color.fromRGBO(1, 0, 53, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "\$${price.toString()}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        color: Color.fromRGBO(1, 0, 53, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void isFavoriteFunc(int id) {
    if (isFavoriteList.contains(id) == false) {
      isFavoriteList.add(id);
    } else {
      isFavoriteList.remove(id);
    }
  }
}
