import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lizi/constants.dart';
import 'package:lizi/pages/discover_show_page.dart';
import 'package:lizi/utils/page_helper.dart';

class SearchPage extends StatefulWidget {
  @override
  State createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  String _searchType = Constants.searchConfig[Constants.searchType];
  final List<String> _orginHistory =
      Constants.searchConfig[Constants.history] as List<String>;
  List<String> _history;

  @override
  void initState() {
    super.initState();
    _history = _orginHistory;
  }

  @override
  Widget build(BuildContext context) {
    final _themeData = ThemeData(primaryColor: Colors.white);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themeData.primaryColor,
        brightness: _themeData.primaryColorBrightness,
        iconTheme: _themeData.iconTheme,
        textTheme: _themeData.textTheme,
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
              hintText: '搜索名称或作者', suffixIcon: Icon(Icons.search)),
          onSubmitted: (keyword) {
            if (!_orginHistory.contains(keyword)) {
              Constants.searchConfig[Constants.history] = _orginHistory
                ..add(keyword);
              Constants().saveConfig(Constants.searchConfig);
            }
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    DiscoverShowPage('搜索结果 - $keyword')));
          },
          onChanged: (keyword) {
            setState(() {
              List<String> newHistory = <String>[];
              _orginHistory.forEach((history) {
                if (history.contains(keyword)) {
                  newHistory.add(history);
                }
              });
              _history = newHistory;
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => print('search more'),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                '搜索设置',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: RadioListTile<String>(
                    value: '模糊',
                    title: Text('模糊'),
                    groupValue: _searchType,
                    onChanged: (value) {
                      setState(() {
                        Constants.searchConfig[Constants.searchType] = value;
                        Constants().saveConfig(Constants.searchConfig);
                        _searchType = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: RadioListTile<String>(
                    value: '准确',
                    title: Text('准确'),
                    groupValue: _searchType,
                    onChanged: (value) {
                      setState(() {
                        Constants.searchConfig[Constants.searchType] = value;
                        Constants().saveConfig(Constants.searchConfig);
                        _searchType = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: RadioListTile<String>(
                    value: '精确',
                    title: Text('精确'),
                    groupValue: _searchType,
                    onChanged: (value) {
                      setState(() {
                        Constants.searchConfig[Constants.searchType] = value;
                        Constants().saveConfig(Constants.searchConfig);
                        _searchType = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Divider(),
            ListTile(
              title: Text(
                '搜索历史',
                style: TextStyle(color: Colors.blueAccent),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _orginHistory.clear();
                    Constants.searchConfig[Constants.history] = _orginHistory;
                    Constants().saveConfig(Constants.searchConfig);
                    _history = _orginHistory;
                  });
                },
              ),
            ),
          ]..addAll(_history.map((keyword) => ListTile(
                title: Text(keyword),
                onTap: PageHelper.pushPage(
                    context, DiscoverShowPage('搜索结果 - $keyword')),
              ))),
        ),
      ),
    );
  }
}
