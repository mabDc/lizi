import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/ui/color_display_box.dart';
import 'package:lizi/ui/text_with_theme.dart';

class ColorLensPage extends StatefulWidget {
  @override
  State createState() => ColorLensPageState();
}

class ColorLensPageState extends State<ColorLensPage> {
  ThemeData _theme = ThemeData(primaryColor: Config.primaryColor);//Theme.of(context);
  Widget build(BuildContext context) {
    final themeList = <Widget>[ListTile(title: TextWithTheme('预设主题'))];
    for (var i = 0; i < Config.themeList.length; i++) {
      Color color = Config.themeList[i];
      themeList.add(
        ListTile(
            leading: Icon(
              Icons.ac_unit,
              color: color,
            ),
            title: Text(color.toString()),
            onTap: () async {
              await Config().changeTheme(i);
              _theme = ThemeData(primaryColor: color);
              setState(() {});
            }),
      );
    }
    
    themeList.add(ListTile(title: TextWithTheme('主题预览')));
    themeList.addAll(<Widget>[
      ColorDisplayBox("突出颜色", "highlightColor", _theme.highlightColor),
      ColorDisplayBox("提示颜色", "hintColor", _theme.hintColor),
      ColorDisplayBox("文本选择手柄颜色", "textSelectionHandleColor",
          _theme.textSelectionHandleColor),
      ColorDisplayBox("文字选择颜色", "textSelectionColor", _theme.textSelectionColor),
      ColorDisplayBox("背景颜色", "backgroundColor", _theme.backgroundColor),
      ColorDisplayBox("强调颜色", "accentColor", _theme.accentColor),
      ColorDisplayBox("画布颜色", "canvasColor", _theme.canvasColor),
      ColorDisplayBox("卡片颜色", "cardColor", _theme.cardColor),
      ColorDisplayBox("按钮颜色", "buttonColor", _theme.buttonColor),
      ColorDisplayBox(
          "对话框背景颜色", "dialogBackgroundColor", _theme.dialogBackgroundColor),
      ColorDisplayBox("禁用颜色", "disabledColor", _theme.disabledColor),
      ColorDisplayBox("分频器颜色", "dividerColor", _theme.dividerColor),
      ColorDisplayBox("错误颜色", "errorColor", _theme.errorColor),
      ColorDisplayBox("指示灯颜色", "indicatorColor", _theme.indicatorColor),
      ColorDisplayBox("原色", "primaryColor", _theme.primaryColor),
      ColorDisplayBox(
          "脚手架背景颜色", "scaffoldBackgroundColor", _theme.scaffoldBackgroundColor),
      ColorDisplayBox(
          "次标头颜色", "secondaryHeaderColor", _theme.secondaryHeaderColor),
      ColorDisplayBox("选择行颜色", "selectedRowColor", _theme.selectedRowColor),
      ColorDisplayBox("飞溅颜色", "splashColor", _theme.splashColor),
      ColorDisplayBox(
          "未选择的控件颜色", "unselectedWidgetColor", _theme.unselectedWidgetColor),
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text('选择配色'),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 12.0, right: 12.0),
        children: themeList,
      ),
    );
  }
}
