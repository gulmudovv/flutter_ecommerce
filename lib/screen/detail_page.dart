import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/app_colors.dart';
import 'package:ecommerce/models/product_detail_model.dart';
import 'package:ecommerce/screen/shopping_cart_page.dart';
import 'package:ecommerce/utils/custom_toggle_button.dart';
import 'package:flutter/material.dart';

import '../utils/hex_color.dart';

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<bool> isSelectedButton = [true, false, false];
  List<bool> isSelectedColorItem = [true, false];
  List<bool> isSelectedMemory = [true, false];
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 240, 241, 1),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Container(
                      width: 50,
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColor.mainDarkBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  Text(
                    "Product Details",
                    style: TextStyle(
                        color: AppColor.mainDarkBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingCard()));
                    },
                    icon: Container(
                      width: 50,
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColor.mainLigthRed,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ]),
          ),
          FutureBuilder(
            future: fetchProductDetail(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 320,
                      child: ListView(
                        physics: PageScrollPhysics(),
                        padding: EdgeInsets.only(top: 10),
                        children: [
                          CarouselSlider(
                            items: [
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(snapshot.data!.images[0]),
                                  ),
                                ),
                              ),
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(snapshot.data!.images[1]),
                                  ),
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                              height: 300,
                              enlargeCenterPage: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              viewportFraction: 0.75,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  snapshot.data!.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.mainDarkBlue,
                                      fontSize: 24),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                  },
                                  icon: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: AppColor.mainDarkBlue,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: isFavorite?Offset(3, 1):Offset(1, 3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFavorite
                                          ? AppColor.mainLigthRed
                                          : Colors.white,
                                      size:18,
                                    ),
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                  size: 18,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      toggButChangeState(0, isSelectedButton);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 1.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 3.3,
                                                color: isSelectedButton[0]
                                                    ? AppColor.mainLigthRed
                                                    : Colors.white))),
                                    child: Text(
                                      'Shop',
                                      style: TextStyle(
                                          color: isSelectedButton[0]
                                              ? AppColor.mainDarkBlue
                                              : Colors.grey,
                                          fontSize: 20,
                                          fontWeight: isSelectedButton[0]
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    ),
                                    width: 80,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      toggButChangeState(1, isSelectedButton);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 1.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: 3.3,
                                            color: isSelectedButton[1]
                                                ? AppColor.mainLigthRed
                                                : Colors.white),
                                      ),
                                    ),
                                    child: Text(
                                      'Details',
                                      style: TextStyle(
                                          color: isSelectedButton[1]
                                              ? AppColor.mainDarkBlue
                                              : Colors.grey,
                                          fontSize: 20,
                                          fontWeight: isSelectedButton[1]
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    ),
                                    width: 80,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      toggButChangeState(2, isSelectedButton);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 1.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: 3.3,
                                            color: isSelectedButton[2]
                                                ? AppColor.mainLigthRed
                                                : Colors.white),
                                      ),
                                    ),
                                    child: Text(
                                      'Features',
                                      style: TextStyle(
                                          color: isSelectedButton[2]
                                              ? AppColor.mainDarkBlue
                                              : Colors.grey,
                                          fontSize: 20,
                                          fontWeight: isSelectedButton[2]
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    ),
                                    width: 80,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      "assets/cpu.png",
                                      scale: 36,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      snapshot.data!.cpu,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      "assets/camera.png",
                                      scale: 26,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      snapshot.data!.camera,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      "assets/memory.png",
                                      scale: 35,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      snapshot.data!.ssd,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Transform.rotate(
                                      child: Image.asset(
                                        "assets/sd.png",
                                        scale: 8,
                                        color: Colors.grey,
                                      ),
                                      angle: -1.57079632679,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      snapshot.data!.sd,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 100),
                              child: Text("Select color and capacity",
                                  style: TextStyle(
                                      color: AppColor.mainDarkBlue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color:
                                            HexColor(snapshot.data!.colors[0]),
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.check,
                                      color: isSelectedColorItem[0]
                                          ? Colors.white
                                          : Colors.transparent,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      toggButChangeState(
                                          0, isSelectedColorItem);
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color:
                                            HexColor(snapshot.data!.colors[1]),
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.check,
                                      color: isSelectedColorItem[1]
                                          ? Colors.white
                                          : Colors.transparent,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      toggButChangeState(
                                          1, isSelectedColorItem);
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 65,
                                ),
                                GestureDetector(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 25,
                                    width: 65,
                                    decoration: BoxDecoration(
                                      color: isSelectedMemory[0]
                                          ? AppColor.mainLigthRed
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "128 GB",
                                      style: TextStyle(
                                          color: isSelectedMemory[0]
                                              ? Colors.white
                                              : Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      toggButChangeState(0, isSelectedMemory);
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 25,
                                    width: 65,
                                    decoration: BoxDecoration(
                                      color: isSelectedMemory[1]
                                          ? AppColor.mainLigthRed
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "256 GB",
                                      style: TextStyle(
                                          color: isSelectedMemory[1]
                                              ? Colors.white
                                              : Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      toggButChangeState(1, isSelectedMemory);
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            Container(
                                alignment: Alignment.center,
                                height: 45,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: AppColor.mainLigthRed,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        "\$ 1.500.00",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/2.5,),
                    CircularProgressIndicator(),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
