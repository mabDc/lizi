import 'package:flutter/material.dart';

class AboutBar extends AppBar {
  final VoidCallback _settings;
  final VoidCallback _colorLens;
  AboutBar(this._settings, this._colorLens);

  @override
  Widget get title => Text('关于');

  @override
  List<Widget> get actions => <Widget>[
        IconButton(
          icon: Icon(
            Icons.color_lens,
          ),
          onPressed: _colorLens,
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
          ),
          onPressed: _settings,
        ),
      ];
}
