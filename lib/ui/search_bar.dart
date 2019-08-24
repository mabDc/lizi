import 'package:flutter/material.dart';

class SearchBar extends AppBar {
  final String titleText;
  final VoidCallback _toggleSearch;
  SearchBar(this.titleText, this._toggleSearch);

  @override
  Widget get title => Text(titleText);

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
