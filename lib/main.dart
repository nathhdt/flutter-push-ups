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

  List<int> _currentSeries = [3,3,3,3,3];
  int _currentSerie = 0;
  int _highscore = 0;
  bool _highscoreSerie = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_highscore < _counter) {
        _highscore = _counter;
      }
    });
  }

  void _incrementReset() {
    setState(() {
      _counter = 0;
      _currentSerie = 0;
      _highscoreSerie = false;
    });
  }

  void _incrementSerie() {
    setState(() {
      // C'est l'heure du high-score !
      if (_currentSerie == 4 ) {
        _highscoreSerie = true;
        _counter++;
      } else {
        if (_highscore < _counter + 1) {
          _highscore++;
        }
        _counter = 0;
        _currentSerie++;
      }
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
      // PAGE POMPES
      Column(
        children: <Widget>[
          // BARRE SÉRIE DE POMPES
          Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              //child: const Center(child: Text('16 - 16 - 12 - 11 - 10', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold))),
              child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('TRAINING', style: TextStyle(fontSize: 14, color: Colors.grey[700], fontWeight: FontWeight.bold))
                      )
                    ),
                    Container(
                      width: 40,
                      decoration: new BoxDecoration(
                        color: _currentSerie == 0 ? Colors.green : null,
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                        _currentSeries[0].toString(),
                        style: TextStyle(
                            fontSize: _currentSerie == 0 ? 14 : 13,
                            color: _currentSerie == 0 ? Colors.grey[900] : Colors.grey[600],
                            fontWeight: FontWeight.bold
                          )
                        )
                      )
                    ),
                    Container(
                        width: 40,
                        decoration: new BoxDecoration(
                          color: _currentSerie == 1 ? Colors.green : null,
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        child: Center(
                            child: Text(
                                _currentSeries[1].toString(),
                                style: TextStyle(
                                    fontSize: _currentSerie == 1 ? 14 : 13,
                                    color: _currentSerie == 1 ? Colors.grey[900] : Colors.grey[600],
                                    fontWeight: FontWeight.bold
                                )
                            )
                        )
                    ),
                    Container(
                        width: 40,
                        decoration: new BoxDecoration(
                          color: _currentSerie == 2 ? Colors.green : null,
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        child: Center(
                            child: Text(
                                _currentSeries[2].toString(),
                                style: TextStyle(
                                    fontSize: _currentSerie == 2 ? 14 : 13,
                                    color: _currentSerie == 2 ? Colors.grey[900] : Colors.grey[600],
                                    fontWeight: FontWeight.bold
                                )
                            )
                        )
                    ),
                    Container(
                        width: 40,
                        decoration: new BoxDecoration(
                          color: _currentSerie == 3 ? Colors.green : null,
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        child: Center(
                            child: Text(
                                _currentSeries[3].toString(),
                                style: TextStyle(
                                    fontSize: _currentSerie == 3 ? 14 : 13,
                                    color: _currentSerie == 3 ? Colors.grey[900] : Colors.grey[600],
                                    fontWeight: FontWeight.bold
                                )
                            )
                        )
                    ),
                    Container(
                        width: 40,
                        decoration: new BoxDecoration(
                          color: _currentSerie == 4 ? Colors.green : null,
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        child: Center(
                            child: Text(
                                _currentSeries[4].toString(),
                                style: TextStyle(
                                    fontSize: _currentSerie == 4 ? 14 : 13,
                                    color: _currentSerie == 4 ? Colors.grey[900] : Colors.grey[600],
                                    fontWeight: FontWeight.bold
                                )
                            )
                        )
                    ),
                  ]
              )
          ),
          // COMPTEUR
          Expanded(
              child: Column(
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
              )
          ),
          // HIGH SCORE
          Container(
            height: 50,
            child: Center(child: Text(
                'HIGH-SCORE : ' + _highscore.toString(),
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                )
            )
            ),
          )
        ]
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
      // PAGE CHOISIR SON NIVEAU
      Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Choose your level',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 30.0, fontStyle: FontStyle.normal),
                )
            ),
            Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                          color: Colors.blue,
                          child: Text('LEVEL 1')
                      )
                  ),
                  Expanded(
                      child: Container(
                          color: Colors.blue,
                          child: Text('LEVEL 2')
                      )
                  ),
                  Expanded(
                      child: Container(
                          color: Colors.blue,
                          child: Text('LEVEL 3')
                      )
                  )
                ]
            )
          ]
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
            // Si page Training
            if (_selectedIndex == 1) {
              // On a fini la série, on passe à la prochaine
              if (_currentSeries[_currentSerie] == _counter + 1){
                // Si on tape un high score
                if (_highscoreSerie == true) {
                  _incrementCounter();
                } else {
                  _incrementSerie();
                }
              }
              // Sinon, on incrémente le compteur
              else
              {
                _incrementCounter();
              }
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
