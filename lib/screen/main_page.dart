import 'package:ecommerce/widgets/hot_sales_widget.dart';
import 'package:ecommerce/widgets/search.dart';
import 'package:ecommerce/widgets/select_category_widget.dart';
import 'package:ecommerce/widgets/location_widget.dart';
import 'package:flutter/material.dart';


import '../widgets/bestseller_widget.dart';
import '../widgets/bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Map<String, int> orderItems;

  int shoppingCount = 0;

  @override
  void initState() {
    orderItems = {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 240, 241, 1),
      bottomNavigationBar: BottomNavBar(
        shoppingItemCount: shoppingCount,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                LocalWidget(),
                SizedBox(
                  height: 5,
                ),
                SelectCategoryWidget(),
                SizedBox(
                  height: 15,
                ),
                Search(),
                SizedBox(
                  height: 5,
                ),
                HotSalesWidget(
                  funcAddItem: addToCart,
                ),
                SizedBox(
                  height: 5,
                ),
                BestSellerWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  addToCart(String id) {
    var sum = 0;
    if (orderItems.containsKey(id) == false) {
      orderItems[id] = 1;
    } else {
      orderItems[id] = orderItems[id]! + 1;
    }

    for (var value in orderItems.values) {
      sum += value;
    }
    setState(() {
      shoppingCount = sum;
      print("ORDERITEMS$orderItems");
    });
  }
}
