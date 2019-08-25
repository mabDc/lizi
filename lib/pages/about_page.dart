import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Config.primaryColor,
          height: 280.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '栗子',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
                Text(
                  'version 1.0.0.0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
              ],
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
            '信息统计',
          ),
          onTap: () => print('tap data statics'),
        ),
        Divider(),
      ],
    );
  }
}
