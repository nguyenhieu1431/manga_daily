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
            itemBuilder: (context, index) {
              return Image.network(
                items[index],
              );
            }));
  }
}