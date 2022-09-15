import 'package:flutter/material.dart';

import 'category_card.dart';


class SelectCategoryWidget extends StatefulWidget {


  @override
  State<SelectCategoryWidget> createState() => _SelectCategoryWidgetState();
}

class _SelectCategoryWidgetState extends State<SelectCategoryWidget> {
  final List<Category> listCategory = [
    Category(title: "Phone", icon: Icons.phone_android),
    Category(title: "Computer", icon: Icons.computer),
    Category(title: "Health", icon: Icons.health_and_safety),
    Category(title: "Books", icon: Icons.menu_book_outlined),
    Category(title: "Sport", icon: Icons.sports_baseball_outlined),
  ];

  int _isSelected=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("Select Category", style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),),
          TextButton(onPressed: (){}, child: Text("view all", style: TextStyle(color: Color.fromRGBO(243,98,35, 1)),))
        ],),
        Container(
          height: 100,

          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
              itemCount: listCategory.length,
              itemBuilder: (BuildContext context, int index){
            return GestureDetector(
                onTap: (){
                  _isSelected = index;
                  setState(() {
                  });
                },
                child: CategoryCard(category: listCategory[index], isSelect: _isSelected==index,));
          })
        ),
      ],
    );
  }
}
class Category{
  final String title;
  final IconData icon;

  Category({required this.title, required this.icon});

}

