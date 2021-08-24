import 'package:flutter/material.dart';
import 'package:ilkprojem/components/bottomNavigation.dart';
import 'package:ilkprojem/components/header.dart';
import 'package:ilkprojem/productDetail.dart';

class CategoryPage extends StatelessWidget {
  final String title;
  final List<Map> products = [
    {
      "name": "Surface laptop 3",
      "photo": "assets/images/laptop.png",
      "price": "999"
    },
    {
      "name": "Surface laptop 4",
      "photo": "assets/images/laptop.png",
      "price": "800"
    },
    {
      "name": "Surface laptop 5",
      "photo": "assets/images/laptop.png",
      "price": "500"
    },
    {
      "name": "Surface laptop 6",
      "photo": "assets/images/laptop.png",
      "price": "250"
    },
    {
      "name": "Surface laptop 7",
      "photo": "assets/images/laptop.png",
      "price": "1500"
    },
    {
      "name": "Surface laptop 7",
      "photo": "assets/images/laptop.png",
      "price": "2000"
    },
    
  ];
  CategoryPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Header
                buildHeader(title: title, context: context, icon: Icons.menu),
                SizedBox(
                  height: 16,
                ),

                //İçerikler
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: products.map((Map product) {
                      return buildContent(product["name"], product["photo"],
                          product["price"], context);
                    }).toList(),
                  ),
                )
              ],
            )),
        bottomNavigation(page: "search")
      ],
    )));
  }
}

Widget buildContent(String title, String photoUrl, String price, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: Offset(0, 16),
                blurRadius: 24)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(photoUrl),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "USD $price",
                style: TextStyle(
                    color: Colors.lightBlue[400],
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
