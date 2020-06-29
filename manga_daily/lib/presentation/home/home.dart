import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import '../category/category_comics.dart';

class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.blue
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                PageViewWithIndicator(),
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
            buttonSection,
            _NewestSection(),
            _NewestSection(),
            _NewestSection()
          ],
        )
      )
    );
  }
}


// intro section
class PageViewWithIndicator extends StatelessWidget{
  final StreamController<int> _controller = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = screenWidth * 2/4;

    List<Widget> introWidgetsList = <Widget>[
      _ViewPageItem(
          url: 'https://gamek.mediacdn.vn/zoom/700_438/2019/9/22/photo-1-15691505214321596413453.jpg',
          width: screenWidth,
          height: screenHeight),
      _ViewPageItem(
          url: 'https://3.bp.blogspot.com/-nCnAvgBWZPk/WZExk5lsBSI/AAAAAAABryk/8prgWacUI1I9YZaAir9KbaTltfFsRJ6aQCLcBGAs/s0/Comicvn.net-Only-00004.jpeg',
          width: screenWidth,
          height: screenHeight),
      _ViewPageItem(url: 'https://c4.wallpaperflare.com/wallpaper/471/183/590/manga-anime-one-piece-monkey-d-luffy-wallpaper-preview.jpg',
          width: screenWidth,
          height: screenHeight),
      _ViewPageItem(url: 'https://i.ytimg.com/vi/Ww6wz0Sg6HQ/maxresdefault.jpg',
          width: screenWidth,
          height: screenHeight),
      _ViewPageItem(url: 'https://st.beeng.net/public/files/uploads/images/08/9c/089c58c0f498e59a584f2b80f9a02305.jpeg',
          width: screenWidth,
          height: screenHeight)
    ];


    return Container(
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        children: <Widget>[
          PageView.builder(
            itemCount: introWidgetsList.length,
            itemBuilder: (context, index){
              return introWidgetsList[index];
              },
              onPageChanged: (int page) {
                _controller.add(page);
              }
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    'Tân tác long hổ môn',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontSize: 35, shadows: [
                      Shadow(
                        offset: Offset(3, 3),
                        blurRadius: 10.0,
                        color: Colors.black,
                      ),
                      Shadow(
                        offset: Offset(-3, -3),
                        blurRadius: 10.0,
                        color: Colors.black,
                      )
                    ]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: _IndicatorDoc(stream: _controller.stream),
                ),
                Container(
                  height: 32,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(48),
                            topRight: const Radius.circular(48))),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}

class _IndicatorDoc extends StatefulWidget{
  final Stream<int> stream;

  const _IndicatorDoc({Key key, this.stream}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IndicatorDocState();
  }
}

class _IndicatorDocState extends State<_IndicatorDoc>{
  int currentPageValue = 0;
  int docSize = 5;

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

class _ViewPageItem extends StatelessWidget{
  final String url;
  final double width;
  final double height;

  const _ViewPageItem({Key key, this.url, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
        image: url,
        alignment: Alignment.topRight,
        placeholder: 'assets/images/lake.jpg',
        width: width,
        height: height,
        fit: BoxFit.cover);
  }

}

// tab section
Widget buttonSection = Container(
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
class _NewestSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewestState();
  }
}

class _NewestState extends State<_NewestSection>{
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
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                      child: Text('New Comics',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,  MaterialPageRoute(builder: (context) => CategoryComics()));
                    },
                    child: Text('See All', style: TextStyle(color: Colors.black54)),
                  )
                ],
              ),
            ),
            Container(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildNewestItem,
                  _buildNewestItem,
                  _buildNewestItem,
                  _buildNewestItem,
                  _buildNewestItem,
                  _buildNewestItem,
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildNewestItem = Container(
      width: 120,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child:FadeInImage.assetNetwork(
                image: 'https://beeng.net/public/assets/manga/2016/KhuMaLuc.jpg',
                alignment: Alignment.topRight,
                placeholder: 'assets/images/lake.jpg',
                fit: BoxFit.cover)
          ),
          Text(
            'Newest comic',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          )
        ],
      ));
}