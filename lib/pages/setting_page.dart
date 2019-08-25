import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/ui/setting_switch.dart';
import 'package:lizi/ui/text_with_theme.dart';

class SettingPage extends StatefulWidget {
  @override
  State createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: TextWithTheme('启动设置')),
          SettingSwitch('自动刷新', '启动应用时自动后台刷新', Config.isAutoRefresh),
          Divider(),
          ListTile(title: TextWithTheme('阅读设置')),
          SettingSwitch('全屏阅读', '浏览时全屏', Config.isFullScreen),
          SettingSwitch('音量键控制', '音量键翻页', Config.isVolumeControl),
          SettingSwitch('翻页动画', '翻页过渡动画', Config.isFlippingAnimation),
          Divider(),
          ListTile(title: TextWithTheme('下载设置')),
          ListTile(
            title: Text('路径'),
            subtitle: Text('/root/'),
            onTap: () => print('download path'),
          ),
        ],
      ),
    );
  }
}
