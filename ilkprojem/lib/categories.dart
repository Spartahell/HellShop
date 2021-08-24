import 'package:flutter/material.dart';
import 'package:ilkprojem/category.dart';
import 'package:ilkprojem/components/bottomNavigation.dart';
import 'package:ilkprojem/components/header.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    "All",
    "Computers",
    "Accessories",
    "Smartphones",
    "Smart objects",
    "Speakers",
    "Home",
  ];

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
                  //Geri ikonu
                  buildHeader(title: "Categories",context: context,icon: Icons.menu),

                  Expanded(
                    child: ListView(
                      children: categories
                          .map((String title) => buildCategory(title: title,context: context))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigation(page: "search"),
          ],
        ),
      ),
    );
  }
}

Widget buildCategory({String title,context}) {
  return GestureDetector(
    onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CategoryPage(title: title,);
          }));
        },
      child: Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4))
          ]),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    ),
  );
}
