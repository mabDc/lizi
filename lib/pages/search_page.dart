import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/ui/text_with_theme.dart';
import 'package:lizi/source/search_u17.dart';

class SearchPage extends StatefulWidget {
  @override
  State createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  String realKeyword = '';

  @override
  Widget build(BuildContext context) {
    final searchTypeList = Config.searchTypeList;
    final searchTypeIndex = Config.option[Config.searchTypeIndex] as int;
    final searchTypes = <Widget>[];
    for (int i = 0; i < searchTypeList.length; ++i) {
      searchTypes.add(Flexible(
        child: RadioListTile<int>(
          value: i,
          title: Text(searchTypeList[i]),
          groupValue: searchTypeIndex,
          onChanged: (value) {
            Config().changeOption(Config.searchTypeIndex, value);
            setState(() {});
          },
        ),
      ));
    }

    final history = <Widget>[];
    for (int i = 0; i < Config.history.length; ++i) {
      String keyword = Config.history[i];
      if (keyword.contains(realKeyword)) {
        history.add(ListTile(
          title: Text(keyword),
          onTap: () => SearchU17().search(context, keyword),
          //PageHelper.pushPage(context, DiscoverShowPage('搜索结果 - $keyword')),
        ));
      }
    }

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
            keyword = keyword.trim();
            if (!Config.history.contains(keyword)) {
              Config.history.add(keyword);
              Config().changeHistory();
            }
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (BuildContext context) =>
            //         DiscoverShowPage('搜索结果 - $keyword')));
            SearchU17().search(context, keyword);
          },
          onChanged: (keyword) {
            setState(() {
              keyword = keyword.trim();
              realKeyword = keyword;
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
            ListTile(title: TextWithTheme('搜索选项')),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: searchTypes),
            Divider(),
            ListTile(
              title: TextWithTheme('搜索历史'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    Config.history.clear();
                    Config().changeHistory();
                  });
                },
              ),
            ),
          ]..addAll(history),
        ),
      ),
    );
  }
}
