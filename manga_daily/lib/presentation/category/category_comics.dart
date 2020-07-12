import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../detail_manga/detail_manga.dart';
import '../category/entities/category_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:paging/paging.dart';

Future<List<MangaItemModel>> fetchMangaListLatestResponse(int skip) async {
  Map<String, String> requestHeaders = {"x-api-key": "EXsJiI9PvasV2MN0JbM4LMVFI3LeTgTb"};
  final response =
  await http.get('https://vncomics.herokuapp.com/api/comics?sort=-updatedAt&skip='+skip.toString(), headers: requestHeaders);

  if (response.statusCode == 200) {
    return MangaListResponse.fromJson(json.decode(response.body)).data.list;
  } else {
    throw Exception('Failed to load list');
  }
}

Future<List<MangaItemModel>> fetchMangaListHottestResponse(int skip) async {
  Map<String, String> requestHeaders = {"x-api-key": "EXsJiI9PvasV2MN0JbM4LMVFI3LeTgTb"};
  final response =
  await http.get('https://vncomics.herokuapp.com/api/comics?sort=-viewed&skip='+skip.toString(), headers: requestHeaders);

  if (response.statusCode == 200) {
    return MangaListResponse.fromJson(json.decode(response.body)).data.list;
  } else {
    throw Exception('Failed to load list');
  }
}

class CategoryComics extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _CategoryComicsState();
  }
}

class _CategoryComicsState extends State<CategoryComics>
    with SingleTickerProviderStateMixin{
  TabController _tabController;

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
          PagingView(state: 0),
          PagingView(state: 1)
        ],
        controller: _tabController,
      ),
    );
  }
}

class PagingView extends StatefulWidget{
  final int state;

  const PagingView({Key key, this.state}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PagingState(state);
  }
}

class _PagingState extends State<PagingView> with AutomaticKeepAliveClientMixin<PagingView>{
  final int state;

  _PagingState(this.state);

  @override
  Widget build(BuildContext context) {
    return Pagination(
      pageBuilder: (currentListSize){
        if(state == 0){
          return fetchMangaListLatestResponse(currentListSize);
        } else {
          return fetchMangaListHottestResponse(currentListSize);
        }
      },
      itemBuilder: (index, item)=> _buildItem(item),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget _buildItem(MangaItemModel item){
    return InkWell(
      onTap: (){
        Navigator.push(context,  MaterialPageRoute(builder: (context) => DetailManga()));
      },
      child: Padding(
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
                      image: item.cover,
                      alignment: Alignment.topRight,
                      placeholder: 'assets/images/place_holder_port.jpg')),
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
                        child: Text(item.name,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        margin: EdgeInsets.only(left:4, bottom: 12),
                      ),
                      Container(
                        child: Wrap(
                          children: <Widget>[
                            _buildCategoryItem,
                            _buildCategoryItem,
                            _buildCategoryItem
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
      ),
    );
  }

  Widget _buildCategoryItem = Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: EdgeInsets.only(left:4, right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(color: Colors.black)
      ),
      child: Text('Horror')
  );
}