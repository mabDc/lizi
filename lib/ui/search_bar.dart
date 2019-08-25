import 'package:flutter/material.dart';

class SearchBar extends AppBar {
  final String _titleText;
  final VoidCallback _toggleSearch;
  SearchBar(this._titleText, this._toggleSearch);

  @override
  Widget get title => Text(_titleText);

  @override
  List<Widget> get actions => <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
          ),
          onPressed: _toggleSearch,
        ),
      ];
}
