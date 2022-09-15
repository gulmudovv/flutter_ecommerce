import 'package:ecommerce/widgets/hot_sales_widget.dart';
import 'package:ecommerce/widgets/search.dart';
import 'package:ecommerce/widgets/select_category_widget.dart';
import 'package:ecommerce/widgets/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../models/home_store_model.dart';
import '../widgets/bestseller_widget.dart';
import '../widgets/bottom_nav_bar.dart';

class MainPage extends StatefulWidget {


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  late Map<StoreItem, int> orderItems;

  int shoppingCount =0;

  @override
  void initState() {
    orderItems ={};
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar:BottomNavBar(shoppingItemCount: shoppingCount,),
      body: Container(

        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5,),
                LocalWidget(),
                SizedBox(height: 5,),
                SelectCategoryWidget(),
                SizedBox(height: 15,),
                Search(),
                SizedBox(height: 5,),
                HotSalesWidget(funcAddItem: addToCart,),
                SizedBox(height: 5,),
                BestSellerWidget()

              ],
            ),
          ),
        ),
      ),
    );
  }
  addToCart(StoreItem storeItem){
    if (orderItems.containsKey(storeItem)!=true){
      orderItems[storeItem] = 1;
    }else{
      orderItems[storeItem] = orderItems[storeItem]!+1;
    }


    setState(() {
      shoppingCount = orderItems.length;
    });
  }

}
