import 'package:flutter/material.dart';
import 'detail_chapter.dart';

void main() {
  runApp(MangaApplication());
}

class MangaApplication extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      home: HomePage()
    );
  }
}

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

    return Scaffold(
        appBar: AppBar(title: Text('Home Page'),),
        body: ListView(
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailChapterManga(items: items)));
                },
                child: Column(children: [
                  Image.network(
                    'https://beeng.net/public/assets/manga_manhwa/LHM.jpg',
                    fit: BoxFit.cover,
                  ),
                  titleSection,
                  buttonSection,
                  textSection
                ]))
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
      child: Text('Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
          softWrap: true)
  );

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


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
