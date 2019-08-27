import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/ui/color_circle.dart';
import 'package:lizi/ui/text_with_theme.dart';

class ColorLensPage extends StatefulWidget {
  @override
  State createState() => ColorLensPageState();
}

class ColorLensPageState extends State<ColorLensPage> {
  Widget build(BuildContext context) {
    final themeList = <Widget>[];
    themeList.add(ListTile(
      title: TextWithTheme('预设主题'),
      trailing: IconButton(
        icon: Icon(Icons.help),
        tooltip: '所有颜色可以长按预览yo',
        onPressed: () => print('press ColorLens help'),
      ),
    ));
    themeList.add(ListTile(
      title: Text('夜间模式'),
      subtitle: Text('黑色背景'),
      trailing: Switch(
        value: Config.option[Config.isBrightnessDark],
        activeColor: Theme.of(context).primaryColor,
        onChanged: (value) async {
          await Config().changeOption(Config.isBrightnessDark, value);
          Config.setTheme(() {});
          setState(() {});
        },
      ),
      onTap: () async {
        await Config().changeOption(
            Config.isBrightnessDark, !Config.option[Config.isBrightnessDark]);
        Config.setTheme(() {});
        setState(() {});
      },
    ));

    for (var i = 0; i < Colors.primaries.length; i++) {
      Color color = Colors.primaries[i];
      themeList.add(
        ColorCircle(color.toString(), '', color, onTap: () async {
          await Config().changeOption(Config.themeIndex, i);
          Config.setTheme(() {});
          setState(() {});
        }),
      );
      themeList.add(Divider());
    }

    themeList.addAll(<Widget>[
      ListTile(title: TextWithTheme('主题预览')),
      ColorCircle("突出颜色", "highlightColor", Theme.of(context).highlightColor),
      ColorCircle("提示颜色", "hintColor", Theme.of(context).hintColor),
      ColorCircle("文本选择手柄颜色", "textSelectionHandleColor",
          Theme.of(context).textSelectionHandleColor),
      ColorCircle(
          "文字选择颜色", "textSelectionColor", Theme.of(context).textSelectionColor),
      ColorCircle("背景颜色", "backgroundColor", Theme.of(context).backgroundColor),
      ColorCircle("强调颜色", "accentColor", Theme.of(context).accentColor),
      ColorCircle("画布颜色", "canvasColor", Theme.of(context).canvasColor),
      ColorCircle("卡片颜色", "cardColor", Theme.of(context).cardColor),
      ColorCircle("按钮颜色", "buttonColor", Theme.of(context).buttonColor),
      ColorCircle("对话框背景颜色", "dialogBackgroundColor",
          Theme.of(context).dialogBackgroundColor),
      ColorCircle("禁用颜色", "disabledColor", Theme.of(context).disabledColor),
      ColorCircle("分频器颜色", "dividerColor", Theme.of(context).dividerColor),
      ColorCircle("错误颜色", "errorColor", Theme.of(context).errorColor),
      ColorCircle("指示灯颜色", "indicatorColor", Theme.of(context).indicatorColor),
      ColorCircle("原色", "primaryColor", Theme.of(context).primaryColor),
      ColorCircle("脚手架背景颜色", "scaffoldBackgroundColor",
          Theme.of(context).scaffoldBackgroundColor),
      ColorCircle("次标头颜色", "secondaryHeaderColor",
          Theme.of(context).secondaryHeaderColor),
      ColorCircle(
          "选择行颜色", "selectedRowColor", Theme.of(context).selectedRowColor),
      ColorCircle("飞溅颜色", "splashColor", Theme.of(context).splashColor),
      ColorCircle("未选择的控件颜色", "unselectedWidgetColor",
          Theme.of(context).unselectedWidgetColor),
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text('调色版'),
      ),
      body: ListView(
        children: themeList,
      ),
    );
  }
}
