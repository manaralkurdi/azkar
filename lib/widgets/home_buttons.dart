import 'package:azkar/utility/constans.dart';
import 'package:flutter/material.dart';

Widget myButtons(context, Function onTap, IconData icon, String text) {
  Size _size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.all(8),
      width: _size.width * 0.34,
      height: _size.height * 0.14,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
