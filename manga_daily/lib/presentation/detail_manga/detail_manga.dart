import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailManga extends StatefulWidget {
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<DetailManga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No appbar provided to the Scaffold, only a body with a
      // CustomScrollView.
      body: CustomScrollView(
        slivers: <Widget>[
          // Add the app bar to the CustomScrollView.
          SliverAppBar(
            // Provide a standard title.
            centerTitle: true,
            title: Text('The Supreme System'),
            // Allows the user to reveal the app bar if they begin scrolling
            // back up the list of items.
            floating: true,
            pinned: true,
            snap: false,
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                )),
            // Make the initial height of the SliverAppBar larger than normal.
            expandedHeight: 200,
          ),
          // Next, create a SliverList
          SliverList(
            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildListDelegate(
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('Update on Thu, Sun',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.yellow,),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star),
                          Text('4.5')
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(4),
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
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.orangeAccent,
            onPressed: (){

            },
            child: Text('Read'),
      )
      ),
    );
  }

  Widget _buildChapter = Wrap(
    direction: Axis.horizontal,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(4),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 8, top: 8),
                  child: Text('1. Episode 1', style: TextStyle(fontWeight: FontWeight.w500),),
                ),
                Row(
                  children: <Widget>[
                    Text('29/10/2019', style: TextStyle(color: Colors.black26,
                        fontWeight: FontWeight.w500),),
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Icon(Icons.thumb_up, color: Colors.black26),
                    ),
                    Text('1591',style: TextStyle(color: Colors.black26),),
                    Container(
                      margin: EdgeInsets.only(left: 12),
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
        color: Colors.black,
      ),
    ],
  );
}
