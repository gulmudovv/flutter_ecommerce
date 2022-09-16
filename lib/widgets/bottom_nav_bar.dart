import 'package:ecommerce/app_colors.dart';
import 'package:flutter/material.dart';

import '../screen/shopping_cart.dart';

class BottomNavBar extends StatefulWidget {
  int shoppingItemCount = 0;

  BottomNavBar({required this.shoppingItemCount});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Stack(children: [
        BottomNavigationBar(
          onTap: (id) {
            if (id == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShoppingCard()));
            }
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColor.mainDarkBlue,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 35, top: 15, bottom: 0),
                  child: Icon(
                    Icons.more_horiz,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20),
                  child: Icon(Icons.shopping_bag_outlined),
                ),
                label: ""),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Icon(Icons.favorite_border),
                ),
                label: ""),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 40),
                  child: Icon(Icons.person_outline),
                ),
                label: ""),
          ],
        ),
        Positioned(
            bottom: MediaQuery.of(context).size.height / 21.5,
            left: MediaQuery.of(context).size.width / 2.47,
            child: widget.shoppingItemCount != 0
                ? Container(
                    width: 19,
                    height: 19,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColor.mainLigthRed),
                    child: Text(
                      widget.shoppingItemCount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container()),
        Positioned(
          bottom: MediaQuery.of(context).size.height / 21.5,
          left: MediaQuery.of(context).size.width / 1.6,
          child: Container(
            width: 19,
            height: 19,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColor.mainLigthRed),
            child: Text(
              "2",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
