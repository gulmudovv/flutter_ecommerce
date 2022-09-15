import 'package:ecommerce/widgets/select_category_widget.dart';

import 'package:flutter/material.dart';
class CategoryCard extends StatefulWidget {
   final Category category;
   bool isSelect;
   CategoryCard({required this.category, required this.isSelect});
  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  int _isSelect=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: widget.isSelect?Color.fromRGBO(243,98,35, 1):Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(widget.category.icon, size: 30, color: widget.isSelect?Colors.white:Colors.grey,),
        ),
        SizedBox(height: 5,),
        Text(widget.category.title, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14, color: widget.isSelect?Color.fromRGBO(243,98,35, 1):Colors.grey,),),
      ],
    );
  }
}


