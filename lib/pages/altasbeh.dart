import 'package:flutter/material.dart';

class Altasbeh extends StatefulWidget {
  @override
  _AltasbehState createState() => _AltasbehState();
}

class _AltasbehState extends State<Altasbeh> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(children: <Widget>[
          Transform.translate(
            offset: Offset(-_size.width * 0.04, -_size.height * 0.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/clock.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Transform.translate(
              offset: Offset(_size.width * 0.01, -_size.height * 0.08),
              child: Text(
                '$_counter',
                style: TextStyle(
                  fontSize: 50,
                  letterSpacing: 10,
                  fontFamily: 'Lobster',
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(_size.width * 0.19, _size.height * 0.455),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _counter = 0;
                });
              },
              child: Container(
                height: _size.height * 0.06,
                width: _size.width * 0.13,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(_size.width * 0.359, _size.height * 0.52),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _counter++;
                });
              },
              child: Container(
                height: _size.height * 0.15,
                width: _size.width * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
