import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailManga extends StatefulWidget {
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<DetailManga> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(child: Scaffold(
      // No appbar provided to the Scaffold, only a body with a
      // CustomScrollView.
      body: CustomScrollView(
        slivers: <Widget>[
          // Add the app bar to the CustomScrollView.
          SliverPersistentHeader(
            delegate: DetailHeader(size.height * 0.4),
            pinned: true,
          ),
          // Next, create a SliverList
          SliverList(
            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      children: <Widget>[
                        Wrap(
                          direction: Axis.vertical,
                          children: <Widget>[
                            Container(
                              child: Text('Tan tac long ho mon', style: TextStyle(fontSize: 24)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Text('Hoang Ngoc Lang', style: TextStyle(color: Colors.blue),),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black12,
                  ),
                  Container(
                      height: 30,
                      margin: EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.centerLeft,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildCategoryItem,
                          _buildCategoryItem,
                          _buildCategoryItem,
                          _buildCategoryItem,
                          _buildCategoryItem,
                          _buildCategoryItem,
                          _buildCategoryItem,
                        ],
                      )
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text('Plot Summary',
                        style: TextStyle(
                            fontSize: 24)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
                    child: Text('Một tác phẩm lớn về Giang hồ của Khưu Thụy Tân, theo phong cách hắc ám. '
                        'Một giang hồ thật sự được khắc họa đầy bạo lực, tanh máu, trần trụi.',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500)
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildChapter,
                      _buildChapter,
                      _buildChapter,
                      _buildChapter,
                      _buildChapter,
                      _buildChapter,
                      _buildChapter,
                      _buildChapter,
                      _buildChapter,
                    ],
                  )
                ]
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.all(4),
          child: FlatButton(
            color: Colors.deepOrange,
            textColor: Colors.white,
            padding: EdgeInsets.all(16),
            splashColor: Colors.orangeAccent,
            onPressed: (){
            },
            child: Text('Read'),
          )
      ),
    ),);
  }

  Widget _buildChapter = Wrap(
    direction: Axis.horizontal,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('1. Episode 1', style: TextStyle(fontWeight: FontWeight.w500),),
                  margin: EdgeInsets.only(bottom: 4),
                ),
                Row(
                  children: <Widget>[
                    Text('29/10/2019', style: TextStyle(color: Colors.black26,
                        fontWeight: FontWeight.w500),),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 4),
                      child: Icon(Icons.thumb_up, color: Colors.black26),
                    ),
                    Text('1591',style: TextStyle(color: Colors.black26),),
                    Container(
                      margin: EdgeInsets.only(left: 12, right: 4),
                      child: Icon(Icons.remove_red_eye, color: Colors.black26),
                    ),
                    Text('136',style: TextStyle(color: Colors.black26),),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      Divider(
        color: Colors.black12,
      ),
    ],
  );

  Widget _buildCategoryItem = Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(color: Colors.black)
    ),
    child: Text('Horror',style: TextStyle(fontSize: 14),),
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 16),
    margin: EdgeInsets.symmetric(horizontal: 8),
  );
}

class DetailHeader extends SliverPersistentHeaderDelegate{
  final double expandedHeight;

  DetailHeader(this.expandedHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          Image.network(
            "https://i.ytimg.com/vi/b2zW-v_PFDY/maxresdefault.jpg",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 4,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    bottomLeft: Radius.circular(32)),
              ),
              padding: EdgeInsets.symmetric(vertical: 4),
              width: size.width * 0.55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.yellow,),
                      Text('8.2/10')
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: <Widget>[
                      Icon(Icons.remove_red_eye, color: Colors.green,),
                      Text('123000')
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: <Widget>[
                      Icon(Icons.thumb_up, color: Colors.blue,),
                      Text('123000')
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Icon(Icons.arrow_back, color: Colors.white,),
          ),
          Opacity(
              opacity: shrinkOffset / expandedHeight,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Center(
                      child : Text('tan tac long ho mon',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),)
                    ),
                    Positioned(
                      child:Icon(Icons.arrow_back, color: Colors.white,),
                      top: 0,
                      left: 16,
                      bottom: 0,
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

}
