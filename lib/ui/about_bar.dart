import 'package:flutter/material.dart';

class AboutBar extends AppBar {
  final VoidCallback _setting;
  AboutBar(this._setting);

  @override
  Widget get title => Text('关于');

  @override
  List<Widget> get actions => <Widget>[
        IconButton(
          icon: Icon(
            Icons.settings,
          ),
          onPressed: _setting,
        ),
      ];
}
