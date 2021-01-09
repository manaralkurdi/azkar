import 'package:flutter/material.dart';

class Alwerd extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(appBar: AppBar(
  title: Text(''),
),
  body:Center(
  child: Container(
  width: 280.0,
  height: 280.0,

  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      image: DecorationImage(
        image: AssetImage("assets/images/download.jpg"),
      )),
),
  ),
);

}
}