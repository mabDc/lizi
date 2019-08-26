import 'dart:convert';

import 'package:html/parser.dart' show parse;

class ParseZZZFun {
  var exam = {
    "name": "街角魔族",
    "url": "/vod-detail-id-1729.html",
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

  static List<dynamic> search(String html) {
    return parse(html)
        .querySelectorAll('#list-focus li')
        .map((li) => {
              "name": li.querySelector('h2').text,
              "url": li.querySelector('a').attributes['href'],
              "img": li.querySelector('img').attributes['src'],
              "juqing": li.querySelector('.juqing').text,
              "info":
                  //{"主演":"小原好美,鬼头明里,高柳知叶,高桥未奈美","状态":"第7话/共0话","分类":"社团,日常","类型":"本季新番","地区":"日本","时间":"2019-08-23","年份":"2019"}
                  (() {
                Map<String, String> info = Map();
                li.querySelectorAll('dl').forEach((dl) {
                  if (dl.querySelector('dt') != null) {
                    info.addAll({
                      dl.querySelector('dt').text.replaceAll('：', ''):
                          dl.querySelector('dd').text
                    });
                  }
                });
                return info;
              })()
            })
        .toList();
  }

  static List<dynamic> chapter(String html) {
    final document = parse(html);
    final roads = document.querySelectorAll('.slider-list');
    final chapters = document.querySelectorAll('.episode-wrap ul');
    final list = <dynamic>[];
    for (var i = 0; i < roads.length; i++) {
      list.add({
        "name": roads[i].text.trim(),
        "chapter": chapters[i]
            .querySelectorAll('a')
            .map((a) => {"name": a.text, "url": a.attributes["href"]})
            .toList(),
      });
    }
    return list;
  }

  static dynamic video(String html){
    final json = parse(html).querySelector('#bofang_box script').innerHtml.substring(16);
    return jsonDecode(json);
  }
}
