import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/ui/text_with_theme.dart';

class ColorLensPage extends StatefulWidget {
  @override
  State createState() => ColorLensPageState();
}

class ColorLensPageState extends State<ColorLensPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData(primaryColor: Config.primaryColor);
    final theme = <Widget>[ListTile(title: TextWithTheme('预设主题'))];
    for (var i = 0; i < Config.themeList.length; i++) {
      theme.add(
        ListTile(
          leading: Icon(
            Icons.ac_unit,
            color: Config.themeList[i],
          ),
          title: Text(Config.themeList[i].toString()),
          onTap: () => print('color change ${Config.themeList[i]}'),
        ),
      );
    }
    theme.addAll(<Widget>[
      ListTile(title: TextWithTheme('当前颜色示例')),
      ListTile(
          leading: Icon(
            Icons.ac_unit,
            color: themeData.primaryColor,
          ),
          title: Text('主色')),
      Divider(),
      ListTile(
        leading: Icon(
          Icons.ac_unit,
          color: themeData.cardColor,
        ),
        title: Text('强调色'),
      ),
      Divider(),
      ListTile(
        leading: Icon(
          Icons.ac_unit,
          color: themeData.backgroundColor,
        ),
        title: Text('背景色'),
      ),
      Divider(),
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text('选择配色'),
      ),
      body: ListView(
        children: theme,
      ),
    );
  }
}
