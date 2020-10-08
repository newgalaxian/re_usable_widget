import 'package:flutter/material.dart';
import 'package:sliding_card/sliding_card.dart';
import 'package:world_info_wiki/widgets/reusable.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SlidingCardController controller;
  @override
  void initState() {
    super.initState();
    controller = SlidingCardController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('World Info'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                child: _card(Colors.cyan, 'cyan'),
                onTap: () {
                  scaffoldKey.currentState.showSnackBar(snackBar);
                },
              ),
              _card(Colors.blue, 'from widget'),
              _card(Colors.green, 'green'),
              TileData(
                widgetsList: [
                  _card(Colors.blueGrey, 'main'),
                  TileData(
                    widgetsList: [
                      _card(Colors.lightGreen, 'inside'),
                      RaisedButton(onPressed: null),
                      TileData(
                        widgetsList: [
                          _card(Colors.redAccent, 'inside'),
                          RaisedButton(onPressed: null),
                          TileData(
                            widgetsList: [
                              _card(Colors.brown, 'inside'),
                              RaisedButton(onPressed: null),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              TileData(
                widgetsList: [Text('hello')],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _card(Color color, String text) {
  return InkWell(
    onTap: () {
      scaffoldKey.currentState.showSnackBar(snackBar);
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
