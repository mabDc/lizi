import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String _errorMsg;
  ErrorPage(this._errorMsg);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.redAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'Error',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontStyle: FontStyle.italic),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50.0),
            ),
            Text(
              '$_errorMsg',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
