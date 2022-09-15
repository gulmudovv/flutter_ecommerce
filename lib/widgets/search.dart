import 'package:flutter/material.dart';
class Search extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width-100,
        child: Card(
           //margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: TextFormField(
            cursorWidth: 0,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(

              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                prefixIcon: Icon(Icons.search, color: Color.fromRGBO(243,98,35, 1),),
              hintText: "Search"

            ),

          ),
        ),
        ),
        CircleAvatar(
          radius: 18,
          child:Icon(Icons.border_all,size: 18, color: Colors.white,),
        backgroundColor: Color.fromRGBO(243,98,35, 1),)
      ],
    );
  }
}
