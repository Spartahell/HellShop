import 'package:flutter/material.dart';
import 'package:ilkprojem/components/bottomNavigation.dart';
import 'package:ilkprojem/components/label.dart';

import 'components/header.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;
  ProductDetailPage(this.productTitle);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color selectedColor;
  int selectedOption = 64;

  List<Color> colors = [
    Colors.grey,
    Colors.black,
    Colors.grey[850],
    Colors.brown[400]
  ];
  List<int> capacities = [64, 256, 512];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Header
            buildHeader(title: widget.productTitle, context: context,icon: Icons.menu),
            SizedBox(
              height: 16,
            ),

            Expanded(
                          child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //New Etiketi
                    //label("NEW"),
                    SizedBox(
                      height: 10,
                    ),
                    //İmage
                    Image.asset(
                      "assets/images/smartphone.jpg",
                      height: 250,
                      width: 400,
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    //COLOR
                    Text(
                      "Color",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: colors
                          .map((Color color) => colorOption(
                              color: color,
                              selected: selectedColor == color,
                              onTap: () {
                                setState(() {
                                  selectedColor = color;
                                });
                              }))
                          .toList(),
                    ),

                    //KAPASİTE SEÇENEKLERİ
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Capasity",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: capacities.map((int sayi) => capacityOption(sayi,selectedOption==sayi,(){
                      setState(() {
                        selectedOption = sayi;
                      });
                    })).toList()),
                    SizedBox(height: 16,),

                    //SEPETE EKLE BUTONU

                    GestureDetector(
                      onTap: (){
                        print("Ürün sepete eklendi :" + widget.productTitle);
                        print("Ürün rengi:" + selectedColor.value.toString());
                        print("Ürün Kapasitesi :" +selectedOption.toString());
                        print("--- Ürün sepete eklendi ---");

                      },
                                          child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color:Colors.cyan[400],
                      ),
                      child: Center(child: Text("Add to Cart",style: TextStyle(fontSize: 24 ,fontWeight: FontWeight.w500),)),
                ),
                    ),
                SizedBox(height: 100,)

                  ],
                ),
              ),
            )
          ])),
          bottomNavigation(page: "cart")
    ]),
    
    ));
  }
}

Widget colorOption({Color color, bool selected, Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: Colors.blue, width: selected ? 3 : 0)),
      width: 23,
      height: 23,
    ),
  );
}

Widget capacityOption(int sayi,bool selected,Function onTap) {
  return GestureDetector(
    onTap: onTap,
      child: Padding(
      padding: const EdgeInsets.only(right :8.0),
      child: Text(
        "${sayi} Gb",
        style: TextStyle(
            color: selected? Colors.blue:Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
