import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'azkar_model.dart';


class EveningAzkar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('أذكار المساء'),

      ),

       body:StreamBuilder(
         stream: FirebaseFirestore.instance.collection('morning').snapshots(),
         builder: (context, snapshot) {
           if (!snapshot.hasData) {
             return Center(child: CircularProgressIndicator());
           } else {
             return ListView.builder(
               shrinkWrap: true,
               itemCount: snapshot.data.docs.length,
               itemBuilder: (context, index) {
                 DocumentSnapshot myData = snapshot.data.docs[index];
                 return ListTile(
                   title: Text(myData['content']),

                 );
               },
             );
           }
         },
       ),


    );
  }
}
