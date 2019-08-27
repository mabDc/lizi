import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String _errorMsg;
  ErrorPage(this._errorMsg);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('错误'),
      ),
      body: Material(
        color: Theme.of(context).primaryColor.withOpacity(0.9),
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 30.0)),
              Icon(
                Icons.error_outline,
                color: Theme.of(context).primaryTextTheme.title.color,
                size: 48,
              ),
              Text(
                '看到此页面说明遇到错误\n不要担心，点击返回可退回上页',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).primaryTextTheme.title.color,
                    height: 3,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic),
              ),
              Padding(padding: EdgeInsets.only(bottom: 50.0)),
              ListTile(title: Text(_errorMsg)),
            ],
          ),
        ),
      ),
    );
  }
}
