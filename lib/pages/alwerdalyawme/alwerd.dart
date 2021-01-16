import 'package:azkar/utility/constans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Alwerd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference alwerrd =
        AzkarApp.firebaseFirestore.collection('alwerd');

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          'الورد اليومي ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: mainColor,
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: FutureBuilder(
          future: alwerrd.get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.only(
                bottom: 40,
                top: 10,
              ),
              shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot myData = snapshot.data.docs[index];
                return Container(
                  margin:
                      EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    myData['content'],
                    style: TextStyle(
                      fontFamily: 'Rakkas',
                      fontSize: 20,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
