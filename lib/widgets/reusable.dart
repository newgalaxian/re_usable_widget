import 'package:flutter/material.dart';

double mainTab = 150;

class TileData extends StatefulWidget {
  List<Widget> widgetsList;
  TileData({this.widgetsList});
  @override
  _TileDataState createState() => _TileDataState();
}

class _TileDataState extends State<TileData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(16.0)),
        // color: Colors.cyan,
        // height: 200 - 15.0,
        // width: mainTab - 10.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: widget.widgetsList,
          ),
        ),
      ),
    );
  }
}
