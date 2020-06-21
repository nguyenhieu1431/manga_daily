import 'package:flutter/material.dart';

class DetailChapterManga extends StatelessWidget{
  final List<String> items;

  DetailChapterManga({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Chapter Page"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            return Image.network('https://cdn.beeng.net/i/b9/55/b9554d46cee4fe5bab731324e90973b6.jpeg',);
      })
    );
  }
}