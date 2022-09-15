import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../models/home_store_model.dart';

class HotSalesWidget extends StatefulWidget {
  Function funcAddItem;
  HotSalesWidget({required this.funcAddItem});

  @override
  State<HotSalesWidget> createState() => _HotSalesWidgetState();
}

class _HotSalesWidgetState extends State<HotSalesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hot Sales", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              TextButton(
                  onPressed: (){}, child: Text("see more", style: TextStyle(color: Color.fromRGBO(243,98,35, 1)),))
            ],
          ),
          FutureBuilder(
               future: fetchHotSaleItems(),
              builder: (context, snapshot){
            if(snapshot.hasData){
              print(snapshot.data?[1].isNew);
              return Container(
                height: 180,
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                  return hotSalesCard(context, snapshot.data![index]);
                }),
              );
            }else{
              return emptyData(context);
            }

          }),
        ],
      ),
    );
  }

Widget emptyData(BuildContext context){
    return Container(
      height: 180,
      margin: EdgeInsets.only(left: 2),
      width: MediaQuery.of(context).size.width -44,
      decoration:BoxDecoration(

        borderRadius: BorderRadius.circular(14),

        image: DecorationImage(
          image: AssetImage('assets/empty.png'),
          fit: BoxFit.cover,
        ),
      ),

    );
}

Widget hotSalesCard(BuildContext context, StoreItem item){
  return Container(
    height: 180,
    margin: EdgeInsets.only(left: 2),
    width: MediaQuery.of(context).size.width -44,
    decoration:BoxDecoration(

      borderRadius: BorderRadius.circular(14),

      image: DecorationImage(
        image: NetworkImage(item.imageUrl),
        fit: BoxFit.cover,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        item.isNew==true ?CircleAvatar(
            radius: 16,
            child:Text('New', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),),
            backgroundColor: Color.fromRGBO(243,98,35, 1),):SizedBox(height: 30,),
          SizedBox(height: 8,),
          Text(item.title, style: TextStyle(fontSize:22, fontWeight: FontWeight.bold, color: Colors.white),),
          SizedBox(height: 5,),
          Text(item.subtitle, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          SizedBox(height: 14,),
          ElevatedButton(onPressed: (){
            widget.funcAddItem(item);
          },
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(243,98,35, 1),
                  textStyle:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              child: Text("Buy now!")),
        ],
      ),
    ),
  );
}
}








