import 'package:flutter/material.dart';

class Altasbeh extends StatefulWidget {
  @override
  _AltasbehState createState() => _AltasbehState();
}

class _AltasbehState extends State<Altasbeh> {
  // ignore: unused_field
  int _counter = 0;

  // ignore: non_constant_identifier_names
  void _IncrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // ignore: non_constant_identifier_names
  void _ResetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/BGG.gif"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$_counter",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                ),
                Text(
                  "عدد التسبيح ",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                ),
              ]),
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {
                  _ResetCounter();
                },
                label: Text(
                  "تصغير",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                icon: Icon(Icons.settings_backup_restore),
                backgroundColor: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              heroTag: null,
              onPressed: () {
                _IncrementCounter();
              },
              label: Text(
                "تسبيح",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              icon: Icon(Icons.fingerprint),
              backgroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
