import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/ui/color_circle.dart';
import 'package:lizi/ui/text_with_theme.dart';

class ColorLensPage extends StatefulWidget {
  ColorLensPage();
  @override
  State createState() => ColorLensPageState();
}

class ColorLensPageState extends State<ColorLensPage> {
  ThemeData _theme =
      ThemeData(primaryColor: Config.primaryColor); //Theme.of(context);
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
    for (var i = 0; i < Config.themeList.length; i++) {
      Color color = Config.themeList[i];
      themeList.add(
        ColorCircle(color.toString(), '', color, onTap: () async {
          await Config().changeTheme(i);
          _theme = ThemeData(primaryColor: color);
          Config.setTheme((){});
          setState(() {});
        }),
      );
      themeList.add(Divider());
    }

    themeList.addAll(<Widget>[
      ListTile(title: TextWithTheme('主题预览')),
      ColorCircle("主色调", "primaryColor", _theme.primaryColor),
      Divider(),
      ListTile(title: TextWithTheme('全部预览')),
      ColorCircle("突出颜色", "highlightColor", _theme.highlightColor),
      ColorCircle("提示颜色", "hintColor", _theme.hintColor),
      ColorCircle("文本选择手柄颜色", "textSelectionHandleColor",
          _theme.textSelectionHandleColor),
      ColorCircle("文字选择颜色", "textSelectionColor", _theme.textSelectionColor),
      ColorCircle("背景颜色", "backgroundColor", _theme.backgroundColor),
      ColorCircle("强调颜色", "accentColor", _theme.accentColor),
      ColorCircle("画布颜色", "canvasColor", _theme.canvasColor),
      ColorCircle("卡片颜色", "cardColor", _theme.cardColor),
      ColorCircle("按钮颜色", "buttonColor", _theme.buttonColor),
      ColorCircle(
          "对话框背景颜色", "dialogBackgroundColor", _theme.dialogBackgroundColor),
      ColorCircle("禁用颜色", "disabledColor", _theme.disabledColor),
      ColorCircle("分频器颜色", "dividerColor", _theme.dividerColor),
      ColorCircle("错误颜色", "errorColor", _theme.errorColor),
      ColorCircle("指示灯颜色", "indicatorColor", _theme.indicatorColor),
      ColorCircle("原色", "primaryColor", _theme.primaryColor),
      ColorCircle(
          "脚手架背景颜色", "scaffoldBackgroundColor", _theme.scaffoldBackgroundColor),
      ColorCircle("次标头颜色", "secondaryHeaderColor", _theme.secondaryHeaderColor),
      ColorCircle("选择行颜色", "selectedRowColor", _theme.selectedRowColor),
      ColorCircle("飞溅颜色", "splashColor", _theme.splashColor),
      ColorCircle(
          "未选择的控件颜色", "unselectedWidgetColor", _theme.unselectedWidgetColor),
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
