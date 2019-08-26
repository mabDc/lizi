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
  List<Widget> _list = <Widget>[];
  String _name;
  String _url;

  @override
  void dispose() {
    super.dispose();
    if (_videoPlayerController != null) {
      _videoPlayerController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_url != null) {
      _videoPlayerController = VideoPlayerController.network(_url);
    }

    if (_name == null) {
      _name = widget._item["name"];
      _list = listBuild(widget._item);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
      ),
      body: Column(
        children: <Widget>[
          _videoPlayerController == null
              ? Container()
              : Chewie(
                  controller: ChewieController(
                  videoPlayerController: _videoPlayerController,
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  looping: true,
                )),
          Padding(padding: EdgeInsets.only(bottom: 2.0)),
          Expanded(child: ListView(children: _list)),
        ],
      ),
    );
  }

  List<Widget> listBuild(dynamic item) {
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
          '$info\n${item["juqing"].replaceAll('\n', '\n　　')}',
          style: TextStyle(
            height: 1.4,
          ),
        ),
      ),
      Divider(),
      ListTile(title: TextWithTheme('目录')),
    ];
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
    return list;
  }
}
