import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/source/parse_zzzfun.dart';
import 'package:lizi/ui/text_with_theme.dart';
import 'package:video_player/video_player.dart';

class VideoPlayPageForZhuzi extends StatefulWidget {
  final dynamic _item;
  final String _html;
  VideoPlayPageForZhuzi(this._item, this._html);
  @override
  VideoPlayPageForZhuziState createState() => VideoPlayPageForZhuziState();
}

class VideoPlayPageForZhuziState extends State<VideoPlayPageForZhuzi>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;
  VideoPlayerController _videoPlayerController;
  List<Widget> _chapter;
  List<Widget> _info;
  String _name;
  String _url;

  @override
  void initState() {
    super.initState();
    _name = widget._item["name"];
    _info = infoBuild(widget._item);
    _chapter = chapterBuild(widget._item);
    _tabcontroller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    if (_videoPlayerController != null) {
      _videoPlayerController.dispose();
    }
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_url != null) {
      if (_videoPlayerController == null) {
        _videoPlayerController = VideoPlayerController.network(_url);
      } else if (_videoPlayerController.dataSource != _url) {
        _videoPlayerController.dispose();
        _videoPlayerController = VideoPlayerController.network(_url);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
      ),
      body: Column(
        children: <Widget>[
          _url == null
              ? Container(
                  height: 250,
                  color: Config.primaryColor.withOpacity(0.1),
                )
              : Chewie(
                  controller: ChewieController(
                  videoPlayerController: _videoPlayerController,
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  looping: true,
                )),
          Expanded(
            child: Scaffold(
              bottomNavigationBar: TabBar(
                controller: _tabcontroller,
                indicatorColor: Config.primaryColor,
                labelColor: Config.primaryColor,
                unselectedLabelColor: Colors.black,
                tabs: <Tab>[
                  Tab(
                    text: '选集',
                  ),
                  Tab(
                    text: '详情',
                  ),
                ],
              ),
              body: TabBarView(controller: _tabcontroller, children: <Widget>[
                ListView(children: _chapter),
                ListView(children: _info),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> infoBuild(dynamic item) {
    String info = '';
    (item["info"] as Map<String, String>)
        .forEach((key, value) => info += '$key：$value\n');
    return <Widget>[
      ListTile(title: TextWithTheme('介绍')),
      Divider(),
      ListTile(
        title: Text(
          item["name"],
          style: TextStyle(
            height: 2,
            fontSize: 18,
          ),
        ),
      ),
      ListTile(
        title: Text(
          '$info',
          style: TextStyle(
            height: 1.2,
          ),
        ),
      ),
      Container(
        height: 320,
        child: Image.network(item["img"]),
      ),
      Divider(),
      ListTile(title: TextWithTheme('剧情')),
      ListTile(
        title: Text(
          (item["juqing"] as String)
              .substring(3)
              .replaceAllMapped(RegExp('(^|\\n)'), (match) => "${match[0]}　　"),
          style: TextStyle(
            height: 1.2,
          ),
        ),
      ),
      Divider(),
    ];
  }

  List<Widget> chapterBuild(dynamic item) {
    final list = <Widget>[];
    ParseZZZFun.chapter(widget._html).forEach((roads) {
      list.add(ListTile(
        title: TextWithTheme(roads["name"]),
        subtitle: Text('共${roads["chapter"].length}话'),
      ));
      list.addAll((roads["chapter"] as List).map((chapter) {
        return ListTile(
          title: Text(chapter["name"]),
          onTap: () {
            setState(() {
              _name = chapter["name"];
              _url = ParseZZZFun.video(chapter["url"]);
            });
          },
        );
      }).toList());
      list.add(Divider());
    });
    list.addAll(<Widget>[]);
    return list;
  }
}
