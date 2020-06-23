import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: PageViewWithIndicator(),
    );
  }
}

class PageViewWithIndicator extends StatelessWidget{
  StreamController<int> _controller = StreamController<int>();

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
      _ViewPageItem(url: 'https://i.ytimg.com/vi/Edu7QzMEcyA/maxresdefault.jpg',
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
          Container(
            margin: EdgeInsets.only(bottom: 8),
            alignment: Alignment.bottomCenter,
            child: _IndicatorDoc(stream: _controller.stream),
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
    return Image.network(url,
        alignment: Alignment.topRight,
        width:  width,
        height: height,
        fit: BoxFit.cover);
  }

}
