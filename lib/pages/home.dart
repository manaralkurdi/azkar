import 'package:azkar/pages/alwerdalyawme/alwerd.dart';
import 'package:azkar/pages/azkar/azkar.dart';
import 'package:azkar/widgets/home_buttons.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remind Me'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              //TODO
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myButtons(
                    context,
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Alwerd()));
                    },
                    Icons.person_add_disabled,
                    'الورد اليومي',
                  ),
                  myButtons(
                    context,
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Azkar()));
                    },
                    Icons.person_add,
                    'أذكاري',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myButtons(
                    context,
                    () {},
                    Icons.account_balance,
                    'التسبيح',
                  ),
                  myButtons(
                    context,
                    () {},
                    Icons.person,
                    'أوقات التذكير',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
