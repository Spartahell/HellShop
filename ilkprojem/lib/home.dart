import 'package:flutter/material.dart';
import 'package:ilkprojem/categories.dart';
import 'package:ilkprojem/components/bottomNavigation.dart';
import 'package:ilkprojem/components/label.dart';
import 'package:ilkprojem/model/favorities.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  //TİTLE
                  buildTitle(),
                  //Banner
                  buildBanner(),
                  //Butonlar

                  Padding(
                    padding: EdgeInsets.only(top: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildNavigation(
                          text: "Categories",
                          icon: Icons.menu,
                          widget: CategoriesPage(),
                          context: context,
                        ),
                        buildNavigation(
                          text: "Favorities",
                          icon: Icons.star_border,
                          widget: FavoritiesPage(),
                          context: context,
                        ),
                        buildNavigation(
                          text: "Gifts",
                          icon: Icons.card_giftcard_outlined,
                        ),
                        buildNavigation(
                          text: "BestSeller",
                          icon: Icons.people_alt_outlined,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  //Sales Title

                  Text(
                    "Sales",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF0A1034)),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  //SALES ITEMS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                          name: "Smartphones",
                          photoUrl: "assets/images/smartphone.jpg",
                          discount: "% 50",
                          screenWidth: screenWidth),
                      buildSalesItem(
                          name: "Smartphones",
                          photoUrl: "assets/images/smartphone.jpg",
                          discount: "% 50",
                          screenWidth: screenWidth),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                          name: "Smartphones",
                          photoUrl: "assets/images/smartphone.jpg",
                          discount: "% 50",
                          screenWidth: screenWidth),
                      buildSalesItem(
                          name: "Smartphones",
                          photoUrl: "assets/images/smartphone.jpg",
                          discount: "% 50",
                          screenWidth: screenWidth),
                    ],
                  ),
                ],
              ),
            ),
            //BOTTOM NAVİGATİON
            bottomNavigation(page:"home"),
          ],
        ),
      ),
    );
  }
}



Widget buildTitle() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Home",
      style: TextStyle(
          fontSize: 32, color: Color(0xFF0A1034), fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildBanner() {
  return Padding(
    padding: EdgeInsets.only(top: 24.0),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Base Home Speaker",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "USD 279",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500),
              ),
              
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildNavigation({
  @required String text,
  @required IconData icon,
  Widget widget,
  BuildContext context,
}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return widget;
          }));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.blueAccent),
          child: Icon(
            icon,
            color: Color(0XFF0001FC),
            size: 18,
          ),
        ),
      ),
      SizedBox(height: 8),
      Text(
        text,
        style: TextStyle(
            color: Color(0XFF1F53E4),
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Widget buildSalesItem(
    {@required String name,
    @required String photoUrl,
    @required String discount,
    @required double screenWidth}) {
  return Container(
    width: (screenWidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //%50
        label(discount),
        SizedBox(
          height: 22,
        ),

        Image.asset(photoUrl),
        SizedBox(
          height: 22,
        ),

        Center(
          child: Text(
            name,
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
      ],
    ),
  );
}
