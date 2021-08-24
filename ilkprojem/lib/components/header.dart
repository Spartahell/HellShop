import 'package:flutter/material.dart';

Widget buildHeader({String title,context,IconData icon}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 29,
      ),
      GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
              child: Icon(
          Icons.arrow_back,
          color: Color(0XFF0A3034),
          size: 27,
        ),
      ),
      //Kategoriler
      SizedBox(
        height: 24,
      ),

      Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 20,),
          Icon(icon),
        ],
      ),
      SizedBox(
        height: 16,
      ),
    ],
  );
}
