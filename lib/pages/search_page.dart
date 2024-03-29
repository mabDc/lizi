import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/source/search_zzzfun.dart';
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
          activeColor: Theme.of(context).primaryColor,
          groupValue: searchTypeIndex,
          onChanged: (value) {
            Config().changeOption(Config.searchTypeIndex, value);
            setState(() {});
          },
        ),
      ));
    }

    final searchHelp = <Widget>[];
    searchHelp.addAll(<Widget>[
      ListTile(
        title: TextWithTheme('搜索选项'),
        trailing: IconButton(
          icon: Icon(Icons.help),
          tooltip: '说明',
          onPressed: () => print('press search help'),
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: searchTypes),
      Divider(),
      ListTile(
        title: TextWithTheme('搜索历史'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          tooltip: '清空历史',
          onPressed: () async {
            Config.history.clear();
            await Config().changeHistory();
            setState(() {});
          },
        ),
      ),
    ]);
    for (int i = 0; i < Config.history.length; ++i) {
      String keyword = Config.history[i];
      if (keyword.contains(realKeyword)) {
        searchHelp.add(
          ListTile(
              title: Text(keyword),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () async {
                  Config.history.remove(keyword);
                  await Config().changeHistory();
                  setState(() {});
                },
              ),
              onTap: () => SearchU17().search(context, keyword)),
        );
        searchHelp.add(Divider());
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          cursorColor: Theme.of(context).primaryColor,
          autofocus: true,
          textInputAction: TextInputAction.search,
          decoration:
              InputDecoration(hintText: '搜索名称或作者', border: InputBorder.none),
          onSubmitted: (keyword) async {
            keyword = keyword.trim();
            if (!Config.history.contains(keyword)) {
              Config.history.add(keyword);
              await Config().changeHistory();
            }
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
            icon: Icon(Icons.playlist_play),
            tooltip: 'zzzfun',
            onPressed: () => SearchZZZFun().search(context, realKeyword),
          ),
        ],
      ),
      body: ListView(children: searchHelp),
    );
  }
}
