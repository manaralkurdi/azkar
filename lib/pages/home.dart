import 'package:azkar/pages/alwerdalyawme/alwerd.dart';
import 'package:azkar/pages/azkar/azkar.dart';
import 'package:azkar/widgets/home_buttons.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Remind Me'),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.settings),
      //       onPressed: () {
      //         //TODO
      //       },
      //     ),
      //   ],
      // ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: _size.height,
              width: _size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/images/bg.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: _size.height * 0.07,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ذكرني',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Kufam',
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(4.0, 4.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(4.0, 4.0),
                          blurRadius: 8.0,
                          color: Color.fromARGB(125, 0, 0, 255),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, _size.height * 0.03),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: myButtons(
                            context,
                            () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Alwerd()));
                            },
                            Icons.person_add_disabled,
                            'الورد اليومي',
                          ),
                        ),
                        myButtons(
                          context,
                          () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Azkar()));
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
          ],
        ),
      ),
    );
  }
}
