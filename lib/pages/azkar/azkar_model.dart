class Azkar {
  String content;
  Azkar({this.content});


  Azkar.fromJson(Map<String,dynamic> json) {
    content = json['content'];
  }
}