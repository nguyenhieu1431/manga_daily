import 'package:flutter/material.dart';

class CategoryComics extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _CategoryComicsState();
  }
}

class _CategoryComicsState extends State<CategoryComics> with SingleTickerProviderStateMixin{
  TabController _tabController;

  get data => List<String>.generate(30, (i) => "Item $i");

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
    return Container(
      child: Column(
        children: <Widget>[
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  child: _buildCategoryItem
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildCategoryItem = Container(
      child: Row(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child:FadeInImage.assetNetwork(
                  image: 'https://beeng.net/public/assets/manga/2016/KhuMaLuc.jpg',
                  alignment: Alignment.topRight,
                  placeholder: 'assets/images/lake.jpg',
                  fit: BoxFit.cover)
          ),
          Column(
            children: <Widget>[
              Text('Mortals of the Doom'),
              Row(
                children: <Widget>[
                  Card(
                    child: Text('Horror'),
                  ),
                  Card(
                    child: Text('Action'),
                  ),
                  Card(
                    child: Text('TimeTravel'),
                  )
                ],
              ),
              Text('Up to Ep.122')
            ],
          )
        ],
      ));
}