import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:lizi/global/config.dart';

class SearchU17 {
  void search(BuildContext context, String search) {
    http
        .get(
            'http://app.u17.com/v3/appV3_3/android/phone/search/searchResult?q=$search')
        .then((response) {
      final json = jsonDecode(response.body);
      var list = <Widget>[];
      (json["data"]["returnData"]["comics"] as List).forEach((comic) {
        final id = comic['comicId'].toString();
        final name = comic['name'].toString();
        list.add(ListTile(
          leading: Image.network(comic['cover'].toString()),
          isThreeLine: true,
          title: Text(name),
          subtitle: Text(comic['author'].toString() +
              '\n' +
              comic['passChapterNum'].toString()),
          trailing: Text('U17'),
          onTap: () {
            chapter(context, name, id);
          },
        ));
        list.add(Divider());
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Page(
            AppBar(
              title: Text('搜索结果 - $search'),
            ),
            ListView(children: list));
      }));
    });
  }

  void chapter(BuildContext context, String name, String id) {
    http
        .get(
            'http://app.u17.com/v3/appV3_3/android/phone/comic/detail_static_new?&comicid=$id')
        .then((response) {
      final json = jsonDecode(response.body);
      var list = <Widget>[];
      (json["data"]["returnData"]["chapter_list"] as List).forEach((chapter) {
        final id = chapter['chapter_id'].toString();
        final name = '${chapter['name']} (${chapter['image_total']}P)';
        list.add(ListTile(
          title: Text(name),
          subtitle: Text(DateTime.fromMillisecondsSinceEpoch(
                  int.parse(chapter['pass_time'].toString()) * 1000)
              .toString()
              .substring(0, 19)),
          onTap: () {
            image(context, name, id);
          },
        ));
        list.add(Divider());
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Page(
            AppBar(
              title: Text('目录 - $name'),
            ),
            ListView(children: list));
      }));
    });
  }

  void image(BuildContext context, String name, String id) {
    http
        .get(
            'http://app.u17.com/v3/appV3_3/android/phone/comic/chapterNew?chapter_id=$id')
        .then((response) {
      final json = jsonDecode(response.body);
      List list = json["data"]["returnData"]["image_list"];
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => Page(
                  Config.option[Config.isFullScreen]
                      ? null
                      : AppBar(
                          title: Text(name),
                        ),
                  ListView(
                      children: list.map((image) {
                    return Image.network(image['location']);
                  }).toList()))));
    });
  }
}

class Page extends StatefulWidget {
  final Widget appBar;
  final Widget body;

  Page(this.appBar, this.body);

  @override
  PageState createState() => PageState();
}

class PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
    );
  }
}
