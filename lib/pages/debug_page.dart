import 'package:flutter/material.dart';

class DebugPage extends StatefulWidget {
  @override
  DebugPageState createState() => DebugPageState();
}

class DebugPageState extends State<DebugPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('title'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[],
          ),
        ));
  }
}
