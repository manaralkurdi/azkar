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
        color: Color(0xFF4B9Fb9),
        borderRadius: BorderRadius.circular(7),
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
