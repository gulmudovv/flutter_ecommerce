import 'package:ecommerce/app_colors.dart';
import 'package:flutter/material.dart';

class ShoppingCard extends StatefulWidget {
  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Row(children: [
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
              Expanded(child: Container()),
              Text(
                "Add address",
                style: TextStyle(
                    color: AppColor.mainDarkBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: Container(
                  width: 50,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColor.mainLigthRed,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'My Cart',
              style: TextStyle(
                  color: AppColor.mainDarkBlue,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 238,
            decoration: BoxDecoration(
              color: AppColor.mainDarkBlue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(left: 16, right: 16),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 480,
                    child: ListView(children: [
                      _orderItem('assets/1.jpg', 'Samsung Ultra 22', 3000),
                      _orderItem('assets/iphone.jpeg', 'Apple 12', 5000),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.indigo,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Delivery",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$ 6,000 us",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Free",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.indigo,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColor.mainLigthRed,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text("Checkout",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderItem(String imageUrl, String name, double price) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "\$ ${price.toString()}",
                style: TextStyle(
                    fontSize: 16,
                    color: AppColor.mainLigthRed,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            width: 25,
          ),
          Expanded(child: Container()),
          Container(
            width: 22,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(46, 46, 67, 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 18,
                    )),
                Text(
                  "2",
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                    onTap: () {},
                    child: Icon(Icons.add, color: Colors.white, size: 18)),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {},
              child: Icon(
                Icons.delete_outlined,
                color: Color.fromRGBO(46, 46, 67, 1),
                size: 20,
              ))
        ],
      ),
    );
  }
}
