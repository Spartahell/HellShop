import 'package:flutter/material.dart';
import 'package:ilkprojem/components/header.dart';
import 'package:ilkprojem/home.dart';

class FavoritiesPage extends StatefulWidget {
  @override
  _FavoritiesPageState createState() => _FavoritiesPageState();
}

class _FavoritiesPageState extends State<FavoritiesPage> {
  

  final List<Map> favorities = [
    {
      "name": "Çikolata",
      "photo": "assets/images/choc.png",
      "price": "20 USD",
    },
    {
      "name": "Şeker",
      "photo": "assets/images/choc.png",
      "price": "15 USD",
    },
    {
      "name": "Tatlı",
      "photo": "assets/images/choc.png",
      "price": "50 USD",
    },
    {
      "name": "Tatlı",
      "photo": "assets/images/choc.png",
      "price": "50 USD",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Geri ikonu
            buildHeader(
                title: "Favorities", context: context, icon: Icons.star_border),

            SizedBox(
              height: 16,
            ),
           
            
          ]))
    ])));
  }
}

