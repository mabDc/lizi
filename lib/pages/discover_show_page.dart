import 'package:flutter/material.dart';

class DiscoverShowPage extends StatelessWidget {
  final String _title;
  DiscoverShowPage(this._title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: ListView(
        children: <Widget>[
          Center(child: Text('\n 这页显示随机图 yo\n')),
          Image.network('http://lorempixel.com/1080/1920/'),
          Center(child: Text('\n以上来自 http://lorempixel.com/1080/1920/ 随机图片\n')),
          Image.network('https://unsplash.it/1080/1920'),
          Center(child: Text('\n以上来自 https://unsplash.it/1080/1920 随机图片\n')),
        ],
      ),
    );
  }
}
