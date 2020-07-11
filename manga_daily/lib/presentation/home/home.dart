import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import '../category/category_comics.dart';
import '../home/entities/home_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<HomeResponse> fetchHomeResponse() async {
  Map<String, String> requestHeaders = {"x-api-key": "EXsJiI9PvasV2MN0JbM4LMVFI3LeTgTb"};
  final response =
  await http.get('https://vncomics.herokuapp.com/api/home', headers: requestHeaders);

  if (response.statusCode == 200) {
    return HomeResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load home');
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  Future<HomeResponse> futureHomeResponse;

  @override
  void initState() {
    super.initState();
    futureHomeResponse = fetchHomeResponse();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.blue
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder<HomeResponse>(
          future: futureHomeResponse,
            builder: (context, snapshot){
              if (snapshot.hasData) {
                List<HomeItemModel> random = snapshot.data.data.random;
                if(random != null && random.isNotEmpty){
                  random = random.sublist(0,5);
                }
                List<HomeItemModel> latest =snapshot.data.data.latest;
                List<HomeItemModel> hottest =snapshot.data.data.hottest;
                List<HomeItemModel> completed =snapshot.data.data.completed;

                return ListView(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        PageViewWithIndicator(random),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0.0,
                          ),
                        ),
                      ],
                    ),
                    _buttonSection,
                    NewestSection(latest, 'Latest'),
                    NewestSection(hottest, 'Hottest'),
                    NewestSection(completed, 'Completed')
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return Center(child: CircularProgressIndicator());
            }
        )
      )
    );
  }
}


// intro section
class PageViewWithIndicator extends StatelessWidget{
  List<HomeItemModel> _homeItemModels;
  final StreamController<int> _controller = StreamController<int>();

  PageViewWithIndicator(this._homeItemModels);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = screenWidth * 2/4;

    return Container(
        width: screenWidth,
        height: screenHeight,
        child: ClipPath(
          clipper: MyClipper(),
          child: Stack(
            children: <Widget>[
              PageView.builder(
                  itemCount: _homeItemModels.length,
                  itemBuilder: (context, index) {
                    return _buildViewPageItem(index, screenWidth, screenHeight);
                  },
                  onPageChanged: (int page) {
                    _controller.add(page);
                  }),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 32),
                      child: IndicatorDoc(_controller.stream, _homeItemModels.length),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildViewPageItem(int index, double width, double height) {
    return ViewPageItem(_homeItemModels[index].cover,
        _homeItemModels[index].name, width, height);
  }
}

class IndicatorDoc extends StatefulWidget{
  final Stream<int> stream;
  int docSize;

  IndicatorDoc(this.stream, this.docSize);

  @override
  State<StatefulWidget> createState() {
    return _IndicatorDocState(docSize);
  }
}

class _IndicatorDocState extends State<IndicatorDoc>{
  int currentPageValue = 0;
  int docSize;

  _IndicatorDocState(this.docSize);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.stream.listen((page) {
      getChangePageAndMoveBar(page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < docSize; i++)
          if (i == currentPageValue) ...[circleBar(true)] else circleBar(false),
      ],
    );
  }

  Widget circleBar(bool isActive){
    return AnimatedContainer(
      width: 8,
      height: 8,
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
    );
  }

  void getChangePageAndMoveBar(int page){
    setState(() {
      currentPageValue = page;
    });
  }
}

class ViewPageItem extends StatelessWidget{
  final String url;
  final String name;
  final double width;
  final double height;

  ViewPageItem(this.url, this.name, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FadeInImage.assetNetwork(
            image: url,
            alignment: Alignment.topRight,
            placeholder: 'assets/images/place_holder_land.jpg',
            width: width,
            height: height,
            fit: BoxFit.cover),
//        Positioned(
//          left: 0,
//          right: 0,
//          child: Container(
//            child: Text(
//              name,
//              overflow: TextOverflow.ellipsis,
//              textAlign: TextAlign.center,
//              style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 35,
//                  shadows: [
//                    Shadow(
//                      offset: Offset(3, 3),
//                      blurRadius: 10.0,
//                      color: Colors.black,
//                    ),
//                    Shadow(
//                      offset: Offset(-3, -3),
//                      blurRadius: 10.0,
//                      color: Colors.black,
//                    )
//                  ]),
//            ),
//          ),
//        )
      ],
    );
  }
}

// tab section
Widget _buttonSection = Container(
  margin: EdgeInsets.only(bottom: 42),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Colors.yellow, Icons.whatshot, 'Newest'),
      _buildButtonColumn(Colors.greenAccent, Icons.insert_chart, 'Ranking'),
      _buildButtonColumn(Colors.deepOrange, Icons.local_offer, 'Category'),
    ],
  ),
);

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color
        ),
        child: Icon(icon, color: Colors.white),
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}

//Newest Section
class NewestSection extends StatefulWidget {
  List<HomeItemModel> _homeItemModels;
  String _labelName;

  NewestSection(this._homeItemModels, this._labelName);

  @override
  State<StatefulWidget> createState() {
    return _NewestState(_homeItemModels, _labelName);
  }
}

class _NewestState extends State<NewestSection>{
  List<HomeItemModel> _homeItemModels;
  String _labelName;

  _NewestState(this._homeItemModels, this._labelName);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(_labelName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryComics()));
                    },
                    child: Text('See All',
                        style: TextStyle(color: Colors.black54)),
                  )
                ],
              ),
            ),
            Container(
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _homeItemModels.length,
                  itemBuilder: (buildContext, index) =>_buildNewestItem(index)),
            )
          ],
        ));
  }

  Widget _buildNewestItem(int index) {
    return Container(
        margin: EdgeInsets.only(right: 10),
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: FadeInImage.assetNetwork(
                  width: 120,
                  height: 150,
                  image: _homeItemModels[index].cover,
                  alignment: Alignment.topRight,
                  fit: BoxFit.cover,
                  placeholder: 'assets/images/place_holder_port.jpg',
                )),
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(
                _homeItemModels[index].name,
                overflow: TextOverflow.ellipsis,
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            )
          ],
        ));
  }


}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 40, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipter) {
    return false;
  }
}