import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryComics extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _CategoryComicsState();
  }
}

class _CategoryComicsState extends State<CategoryComics> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> data = List<String>.generate(30, (i) => "Item $i");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tìm Truyện"),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: [
            new Tab(text: 'Truyện mới cập nhật'),
            new Tab(text: 'Truyện Hot'),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab),
          bottomOpacity: 1,
      ),
      body: TabBarView(
        children: <Widget>[
          _CategoryListSection(items: data),
          _CategoryListSection(items: data)
        ],
        controller: _tabController,
      ),
    );
  }
}

class _CategoryListSection extends StatefulWidget {
  final List<String> items;

  const _CategoryListSection({Key key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return __CategoryListState(items);
  }
}

class __CategoryListState extends State<_CategoryListSection>{
  final List<String> items;

  __CategoryListState(this.items);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 12),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: FadeInImage.assetNetwork(
                                width: 100,
                                image: 'https://beeng.net/public/assets/manga/2016/KhuMaLuc.jpg',
                                alignment: Alignment.topRight,
                                placeholder: 'assets/images/lake.jpg')),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text('Mortals of the Doom',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  margin: EdgeInsets.only(left:4, bottom: 12),
                                ),
                                Container(
                                  child: Wrap(
                                    children: <Widget>[
                                      Card(
                                        child: Container(
                                          child: Text('Horror'),
                                          margin: EdgeInsets.all(4),
                                        ),
                                        color: Colors.grey[100],
                                      ),
                                      Card(
                                        child: Container(
                                          child: Text('Adventured'),
                                          margin: EdgeInsets.all(4),
                                        ),
                                        color: Colors.grey[100],
                                      ),
                                      Card(
                                        child: Container(
                                          child: Text('Manga'),
                                          margin: EdgeInsets.all(4),
                                        ),
                                        color: Colors.grey[100],
                                      ),
                                      Card(
                                        child: Container(
                                          child: Text('Manhua'),
                                          margin: EdgeInsets.all(4),
                                        ),
                                        color: Colors.grey[100],
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(bottom: 12),
                                ),
                                Container(
                                  child: Text('Up to Ep.122'),
                                  margin: EdgeInsets.only(left:4, bottom: 12),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      );
  }
}