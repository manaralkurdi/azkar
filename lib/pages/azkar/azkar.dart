import 'package:azkar/utility/constans.dart';
import 'package:azkar/widgets/home_buttons.dart';
import 'package:flutter/material.dart';

import 'evening_azkar.dart';
import 'morning_azkar.dart';

class Azkar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: mainColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myButtons(
              context,
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MorningAzkar()));
              },
              Icons.hail,
              'أذكار الصباح',
            ),
            myButtons(
              context,
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EveningAzkar()));
              },
              Icons.hail,
              'أذكار المساء',
            ),
          ],
        ),
      ),
    );
  }
}
