import 'package:flutter/material.dart';

class ColorDisplayBox extends StatelessWidget {
  final String explanation;
  final String name;
  final Color color;
  ColorDisplayBox(this.explanation, this.name, this.color);
  
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Text(
              "$explanation　　\n$name　　",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                
              ),
            ),
            new Flexible(
                child: new Container(
                    height: 30.0, decoration: new BoxDecoration(color: color)))
          ],
        ),
        new Divider()
      ],
    );
  }
}
