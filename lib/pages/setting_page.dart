import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/ui/option_switch.dart';
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
          ListTile(title: TextWithTheme('主页设置')),
          OptionSwitch('自动刷新', '启动应用时自动后台刷新', Config.isAutoRefresh),
          OptionSwitch('页面滑动', '可左右滑动切换页面导航', Config.isSlidingNavigationBar),
          Divider(),
          ListTile(title: TextWithTheme('阅读设置')),
          OptionSwitch('全屏阅读', '浏览时全屏', Config.isFullScreen),
          OptionSwitch('音量键控制', '音量键翻页', Config.isVolumeControl),
          OptionSwitch('翻页动画', '翻页过渡动画', Config.isFlippingAnimation),
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
