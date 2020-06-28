import 'package:flutter/material.dart';
import '../home/home.dart';

void main() {
  runApp(MangaApplication());
}

class MangaApplication extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      home: HomePage()
    );
  }
}
