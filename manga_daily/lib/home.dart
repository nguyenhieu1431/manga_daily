import 'package:flutter/material.dart';
import 'detail_chapter.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    List<String> items = List<String>();
    items.add('https://st.beeng.net/public/files/uploads/images/3b/1a/3b1a65072b348bc20ce16b79e4b7a67f.jpeg');
    items.add('https://st.beeng.net/public/files/uploads/images/ce/55/ce557eac6cf449ddc05e4efff8c17dc6.jpeg');
    items.add('https://st.beeng.net/public/files/uploads/images/d3/97/d3974f4aa9ff893e955611755bcd09a4.jpeg');
    items.add('https://st.beeng.net/public/files/uploads/images/98/f0/98f01c492cb06e55917aab0df6025481.jpeg');
    items.add('https://st.beeng.net/public/files/uploads/images/0f/72/0f726584274d0503d7da0cc76467d35d.jpeg');
    items.add('https://st.beeng.net/public/files/uploads/images/ac/b3/acb3d2e1293b7b7c031fc946b51e09a9.jpeg');
    items.add('https://st.beeng.net/public/files/uploads/images/b5/b0/b5b07c89f945238b60f161e98f81a50a.jpeg');
    items.add('https://st.beeng.net/public/files/uploads/images/97/c7/97c7ef1277b95a7ed0c492971016c58d.jpeg');
    items.add('https://st.beeng.net/public/files/uploads/images/f7/68/f768b358e59639cbd9dbb935eb446e8b.jpeg');
    items.add('https://st.beeng.net/public/files/uploads/images/73/b0/73b05223abcf60f3ba63a9aef4ea3192.jpeg');

    List<Widget> introWidgetsList = <Widget>[
      _ViewPageItem(url: 'https://gamek.mediacdn.vn/zoom/700_438/2019/9/22/photo-1-15691505214321596413453.jpg'),
      _ViewPageItem(url: 'https://3.bp.blogspot.com/-nCnAvgBWZPk/WZExk5lsBSI/AAAAAAABryk/8prgWacUI1I9YZaAir9KbaTltfFsRJ6aQCLcBGAs/s0/Comicvn.net-Only-00004.jpeg'),
      _ViewPageItem(url: 'https://i.ytimg.com/vi/Edu7QzMEcyA/maxresdefault.jpg'),
      _ViewPageItem(url: 'https://i.ytimg.com/vi/Ww6wz0Sg6HQ/maxresdefault.jpg'),
      _ViewPageItem(url: 'https://st.beeng.net/public/files/uploads/images/08/9c/089c58c0f498e59a584f2b80f9a02305.jpeg')
    ];

    return Scaffold(
        appBar: AppBar(title: Text('Home Page')),
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child:
              PageView.builder(
                itemCount: introWidgetsList.length,
                itemBuilder: (context, index){
                  return introWidgetsList[index];
                },
              ),
            ),
          ],
        )
    );
  }
  Widget titleSection = Container(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('1', style: TextStyle(color: Colors.grey),),
              ),
              Text('Kander')
            ],
          ),
        ),
        Icon(Icons.star, color: Colors.red),
        Text('41')
      ],
    ),
  );

  Widget buttonSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.blue, Icons.star, 'label'),
        _buildButtonColumn(Colors.blue, Icons.star, 'label'),
        _buildButtonColumn(Colors.blue, Icons.star, 'label')
      ],
    ),
  );

  Widget textSection = Container(
      padding: EdgeInsets.all(20),
      child: Text(
          'Đây là tác phẩm manhua lừng danh của Hoàng Ngọc Lang được làm '
              'lại từ bộ manhua long hổ môn nổi đình đám suốt từ những năm '
              '70 đã đưa tên tuổi Hoàng Ngọc Lang đứng vững đến ngày nay.'
              ' bộ truyện xoay quanh cuộc đời của Vương Tiểu Long, Vương Tiểu Hổ,'
              ' Thạch Hắc Long cùng Long Hổ Võ Quán...',
          softWrap: true));

}

Column _buildButtonColumn(Color color, IconData icon, String label){
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(label)
        )
      ]);
}

class _ViewPageItem extends StatelessWidget{
  final String url;

  const _ViewPageItem({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(url,
      alignment: Alignment.topRight,
      fit: BoxFit.cover, width: double.infinity,);
  }
}
