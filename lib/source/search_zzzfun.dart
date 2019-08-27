import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lizi/pages/video_play_page.dart';
import 'package:lizi/source/parse_zzzfun.dart';

class SearchZZZFun {
  final host = 'http://www.zzzfun.com';

  void search(BuildContext context, String keyword, {int page = 1}) {
    http
        .get('http://www.zzzfun.com/vod-search-page-$page-wd-$keyword.html')
        .then((response) {
      final list = ParseZZZFun.search(response.body).map((item) {
        return ListTile(
          leading: Image.network(item["img"]),
          title: Text('' + item["name"]),
          subtitle: Text(
            '\n' + item["info"]["主演"],
            maxLines: 2,
          ),
          trailing: Text('${item["info"]["地区"]}\n${item["info"]["年份"]}'),
          isThreeLine: true,
          onTap: () {
            chapter(context, item);
          },
        );
      }).toList();
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Page(
            AppBar(
              title: Text('zzzfun - $keyword'),
            ),
            ListView(children: list));
      }));
    });
  }

  void chapter(BuildContext context, Map<String, dynamic> item) {
    http.get('$host${item["url"]}').then((response) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return VideoPlayPage(item, response.body);
      }));
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
