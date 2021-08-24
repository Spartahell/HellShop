import 'package:flutter/material.dart';


Widget label(String text){
  return Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.blue[50],
          ),
          child: Text(
            text,
            textAlign:TextAlign.center,
            style: TextStyle(color: Colors.blue, fontSize: 12,),
          ),
        );
}