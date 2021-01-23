import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: FutureBuilder(
          future: _getUserProfileImage(context, '24'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Image(
                image: snapshot.data == null
                    ? NetworkImage(snapshot.data)
                    : NetworkImage(
                        'https://thumbs.dreamstime.com/b/neutral-feedback-checklist-graph-paper-background-60451839.jpg'));
          },
        ),
      ),
    );
  }

  _getUserProfileImage(BuildContext context, String imageName) async {
    NetworkImage image;
    await FireStoreSevice.loadImage(context, imageName).then((value) {
      image = NetworkImage(value.toString());
    });
    return image;
  }
}

class FireStoreSevice extends ChangeNotifier {
  FireStoreSevice();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
