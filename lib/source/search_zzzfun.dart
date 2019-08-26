import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lizi/source/parse_zzzfun.dart';
import 'package:lizi/ui/text_with_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchZZZFun {
  final host = 'http://www.zzzfun.com';

  void search(BuildContext context, String keyword, {int page = 1}) {
    http
        .get('http://www.zzzfun.com/vod-search-page-$page-wd-$keyword.html')
        .then((response) {
      var exam = {
        "name": "街角魔族",
        "url": "http://www.zzzfun.com/vod-detail-id-1729.html",
        "img":
            "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2557850609.jpg",
        "juqing":
            "剧情：某天早晨，突然觉醒了暗之力量的女高中生·吉田优子，为了解除一族所遭受的诅咒而准备开始打倒魔法少女！！但对方却是自己的救命恩人！？而且根本就没可能打赢！？废柴系庶民派魔族与高冷系肌肉魔法少女编织的日常系魔法喜剧开始！！！",
        "info": {
          "主演": "小原好美,鬼头明里,高柳知叶,高桥未奈美",
          "状态": "第7话/共0话",
          "分类": "社团,日常",
          "类型": "本季新番",
          "地区": "日本",
          "时间": "2019-08-23",
          "年份": "2019"
        }
      };
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
              title: Text('搜索结果 - $keyword'),
            ),
            ListView(children: list));
      }));
    });
  }

  void chapter(BuildContext context, Map<String, dynamic> item) {
    http.get('$host${item["url"]}').then((response) {
      String info = '';
      (item["info"] as Map<String, String>)
          .forEach((key, value) => info += '$key：$value\n');
      final list = <Widget>[
        Container(
          height: 200,
          child: Image.network(item["img"]),
        ),
        ListTile(
          title: TextWithTheme('介绍'),
        ),
        Divider(),
        ListTile(
          title: Text(
            '$info\n${item["juqing"]}',
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 1,
              height: 1.4,
            ),
          ),
        ),
        Divider(),
        ListTile(title: TextWithTheme('目录')),
      ];

      ParseZZZFun.chapter(response.body).forEach((roads) {
        list.add(ListTile(title: TextWithTheme(roads["name"])));
        list.addAll((roads["chapter"] as List).map((chapter) {
          return ListTile(
            title: Text(chapter["name"]),
            onTap: () {
              video(context, chapter["name"], chapter["url"]);
            },
          );
        }).toList());
        list.add(Divider());
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Page(
            AppBar(
              title: Text('${item["name"]}'),
            ),
            ListView(children: list));
      }));
    });
  }

  void video(BuildContext context, String name, String url) {
    // http.get('$host$url').then((response) {
    //   final json = ParseZZZFun.video(response.body);
    //   final url = base64Decode(json["url"]).toString();
    //   print(url);
    //   var x = {
    //     "baseUrl": "http://129.204.138.35:1681/api.php",
    //     "chapterFind":
    //         "js:var json = getResCode();var codeJson = {};eval('codeJson=' + json);var res = {};var header = {};header.type = 1;header.title = codeJson.message;header.url = \"\";res.data = [];res.data.push(header);if(codeJson.result){for(var i = 0; i < codeJson.result.length; i++){var mo = codeJson.result[i];var r = {};r.type = 2;r.title = mo.ji;r.url = 'http://129.204.138.35:8059/zapi/play.php?url=' + mo.id;res.data.push(r);}}if(codeJson.result2){for(var i = 0; i < codeJson.result2.length; i++){var mo = codeJson.result2[i];var r = {};r.type = 2;r.title = mo.ji;r.url = 'http://129.204.138.35:8059/zapi/play2.php?url=' + mo.id;res.data.push(r);}}if(codeJson.result3){for(var i = 0; i < codeJson.result3.length; i++){var mo = codeJson.result3[i];var r = {};r.type = 2;r.title = mo.ji;r.url = 'http://129.204.138.35:8059/zapi/play3.php?url=' + mo.id;res.data.push(r);}}setChapterResult(res);",
    //     "forFearch": false,
    //     "id": 828,
    //     "movieFind": "",
    //     "pinYinTitle": "ZzzFundongmanapp_json_",
    //     "searchFind":
    //         "js:var json = getResCode();var fires = {};var resJson = {};eval('resJson=' + json);var res = [];if(resJson.total <= 0){fires.data = [];setSearchResult(fires);}else {for(var i = 0; i<resJson.list.length;i++){var mo = resJson.list[i];var r = {};r.title = mo.vod_name;r.url = 'http://129.204.138.35:8059/zapi/list.php?id='+mo.vod_id+'-1';res.push(r);} fires.data = res;setSearchResult(fires);}",
    //     "searchUrl":
    //         "http://129.204.138.35:1681/api.php/provvde/vod/?ac=list&wd=**;get",
    //     "title": "ZzzFun动漫app（json）",
    //     "weight": 435
    //   };
    // });
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(name)),
        body: WebView(
          initialUrl: '$host$url',
          onWebViewCreated: (web){
            web.loadUrl(url);
          },
        ),
      );
    }));
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
