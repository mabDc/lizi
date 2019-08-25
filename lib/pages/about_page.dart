import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/pages/color_lens_page.dart';
import 'package:lizi/pages/setting_page.dart';
import 'package:lizi/ui/about_bar.dart';
import 'package:lizi/utils/page_helper.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AboutBar(PageHelper.pushPage(context, SettingPage()),
          PageHelper.pushPage(context, ColorLensPage())),
      body: ListView(
        children: <Widget>[
          Container(
            color: Config.primaryColor,
            height: 280.0,
            child: Center(
              child: ListTile(
                title: Text(
                  '栗子',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 120.0,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                subtitle: Text(
                  'version 1.0.0.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    height: 2,
                    color: Colors.white,
                  ),
                ),
                onTap: () => showAboutDialog(
                  context: context,
                  applicationVersion: '1.0.0.0',
                  children: <Widget>[
                    ListTile(
                      title: Text('2019/08/24'),
                      subtitle: Text('bata 2\nbata 1'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('2019/08/24'),
                      subtitle: Text('alpha 2\nalpha 1'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              '检查更新',
            ),
            subtitle: Text(
              '点击检查更新',
            ),
            onTap: () => print('tap check update'),
          ),
          Divider(),
          ListTile(
            title: Text(
              '源代码',
            ),
            subtitle: Text(
              'https://github.com/mabDc/lizi',
            ),
            onTap: () => print('tap source'),
          ),
          Divider(),
          ListTile(
            title: Text(
              '问题反馈',
            ),
            subtitle: Text(
              'https://github.com/mabDc/lizi/issues',
            ),
            onTap: () => print('tap issues'),
          ),
          Divider(),
          ListTile(
            title: Text(
              '信息统计',
            ),
            onTap: () => print('tap data statics'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
