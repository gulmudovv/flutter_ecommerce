import 'package:ecommerce/app_colors.dart';
import 'package:flutter/material.dart';

class LocalWidget extends StatefulWidget {
  @override
  State<LocalWidget> createState() => _LocalWidgetState();
}

class _LocalWidgetState extends State<LocalWidget> {
  var _phoneBrandList = ["Samsung", "Apple", "Nokia"];
  var _selectedPhone;
  var _selectedPrice;
  var priceRange = [
    "\$0 - \$300",
    "\$300 - \$500",
    "\$1000 - \$2500",
    "\$3000 - \$5000",
    "\$5000 - \$7000",
    "\$7000 - \$10000"
  ];
  var sizeList = ["4.5 to 5.5 inches"];

  @override
  void initState() {
    _selectedPhone ??= _phoneBrandList.first;
    _selectedPrice ??= priceRange[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
        ),
        Icon(
          Icons.location_on_outlined,
          color: Colors.deepOrange,
          size: 20,
        ),
        SizedBox(
          width: 8,
        ),
        SizedBox(
          width: 110,
          child: Text(
            "Moscow, Rus",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 6,
        ),
        GestureDetector(
            onTap: () {
              bottomsheets(context);
            },
            child: Icon(
              Icons.filter_alt_outlined,
              size: 18,
            )),
      ],
    );
  }

  void bottomsheets(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: MediaQuery.of(context).size.height / 2.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    )),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColor.mainDarkBlue,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                          Text(
                            "Filter options",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(1, 0, 53, 1)),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 90,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(243, 98, 35, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Done",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Brand",
                        style: TextStyle(
                            color: Color.fromRGBO(1, 0, 53, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 24,
                            isExpanded: true,
                            style: TextStyle(
                                color: Color.fromRGBO(1, 0, 53, 1),
                                fontSize: 18),
                            value: _selectedPhone,
                            items: _phoneBrandList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedPhone = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Price",
                        style: TextStyle(
                            color: Color.fromRGBO(1, 0, 53, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 24,
                            isExpanded: true,
                            style: TextStyle(
                                color: Color.fromRGBO(1, 0, 53, 1),
                                fontSize: 18),
                            value: _selectedPrice,
                            items: priceRange.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedPrice = newValue.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Size",
                        style: TextStyle(
                            color: Color.fromRGBO(1, 0, 53, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 24,
                            isExpanded: true,
                            style: TextStyle(
                                color: Color.fromRGBO(1, 0, 53, 1),
                                fontSize: 18),
                            value: sizeList[0],
                            items: sizeList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
