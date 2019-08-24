import 'package:flutter/material.dart';

class SourceEdit extends StatefulWidget {
  final String _name;
  final Map<String, dynamic> _source;
  SourceEdit(this._name, this._source);
  @override
  State createState() => SourceEditState();
}

class SourceEditState extends State<SourceEdit> {
  @override
  Widget build(BuildContext context) {
    final _body = <Widget>[];

    widget._source.forEach((ruleName, rule) {
      _body.add(TextField(
        minLines: 1,
        maxLines: 30,
        controller: TextEditingController(text: rule.toString()),
        decoration: InputDecoration(
          labelText: ruleName,
        ),
      ));
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('源编辑 - ${widget._name}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => print('save edited source'),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => print('edit source more'),
          ),
        ],
      ),
      body: ListView(
        children: _body,
        padding: EdgeInsets.only(left: 12, right: 12, top: 0,bottom: 12),
      ),
    );
  }
}
