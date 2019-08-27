import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:lizi/source/parse_zzzfun.dart';
import 'package:lizi/ui/text_with_theme.dart';
import 'package:video_player/video_player.dart';

class VideoPlayPage extends StatefulWidget {
  final dynamic _item;
  final String _html;
  VideoPlayPage(this._item, this._html);
  @override
  VideoPlayPageState createState() => VideoPlayPageState();
}

class VideoPlayPageState extends State<VideoPlayPage> {
  VideoPlayerController _videoPlayerController;
  List<Widget> _chapter = <Widget>[];
  List<Widget> _info = <Widget>[];
  String _name;
  String _url;

  @override
  void dispose() {
    if (_videoPlayerController != null) {
      _videoPlayerController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_url != null) {
      if (_videoPlayerController != null &&
          _videoPlayerController.dataSource != _url) {
        _videoPlayerController.dispose();
      }
      _videoPlayerController = VideoPlayerController.network(_url);
    }

    if (_name == null) {
      _name = widget._item["name"];
      _chapter = chapterBuild(widget._item);
      _info = infoBuild(widget._item);
      _info.addAll(_chapter);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
      ),
      body: Column(
        children: <Widget>[
          _url == null
              ? Container()
              : Chewie(
                  controller: ChewieController(
                  videoPlayerController: _videoPlayerController,
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  looping: true,
                )),
          Padding(padding: EdgeInsets.only(bottom: 2.0)),
          Expanded(child: ListView(children: _info)),
        ],
      ),
    );
  }

  List<Widget> infoBuild(dynamic item) {
    String info = '';
    (item["info"] as Map<String, String>)
        .forEach((key, value) => info += '$key：$value\n');
    return <Widget>[
      Container(
        height: 320,
        child: Image.network(item["img"]),
      ),
      Text(
        item["name"],
        style: TextStyle(
          height: 2,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
      Divider(),
      ListTile(
        title: TextWithTheme('介绍'),
      ),
      ListTile(
        title: Text(
          '$info\n${item["juqing"].replaceAll('\n', '\n　　')}',
          style: TextStyle(
            height: 1.4,
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
