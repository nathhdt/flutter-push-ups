import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// App
class MyApp extends StatelessWidget {
  // Root of the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Ups',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Push Ups'),
    );
  }
}

// HOME-PAGE
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// MAIN
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _incrementReset() {
    setState(() {
      _counter = 0;
    });
  }

  void _onNavbarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // LISTE DES PAGES
    List<Widget> _pages = <Widget>[
      Column(children: <Widget>[
        Row(
          //ROW 1
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: new Text(
                  'How are you today ?',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 32.0, fontStyle: FontStyle.normal),
                )),
          ],
        ),
        Row(
          //ROW 1
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: new Text(
                  'Statistics',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 24.0, fontStyle: FontStyle.normal),
                )),
          ],
        ),
      ]),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have made',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          Text(
            _counter.toString(),
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          Text(
            'Push Ups',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      ListView(
        padding: const EdgeInsets.only(top:20),
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.brown[400],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: const Center(child: Text('16 - 12 - 14 - 10 - 10', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold))),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.brown[400],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: const Center(child: Text('16 - 16 - 12 - 11 - 10', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold))),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.brown[400],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: const Center(child: Text('18 - 16 - 12 - 12 - 10', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold))),
          ),
        ],
      ),
    ];

    // SCAFFOLD
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        brightness: Brightness.dark,
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            // Si page training
            if (_selectedIndex == 1) {
              _incrementCounter();
            }
          });
        },
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_rounded),
            label: 'Resume',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.moving_rounded),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Me',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onNavbarTapped, //New
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementReset,
        tooltip: 'Reset',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
