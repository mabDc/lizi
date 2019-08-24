import 'package:flutter/material.dart';

class SourceItem extends ListTile {
  final String _name;
  final VoidCallback _onTap;
  final VoidCallback _onEdit;

  SourceItem(this._name, this._onEdit, this._onTap);

  @override
  Widget get title => Text(_name);

  @override
  Widget get trailing => IconButton(
        icon: Icon(Icons.edit),
        onPressed: _onEdit,
      );

  @override
  get onTap => _onTap;
}
