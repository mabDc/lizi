import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lizi/constants.dart';

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
          ListTile(
            title: Text(
              '阅读设置',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          ListTile(
            title: Text('全屏'),
            trailing: Switch(
              value: Constants.settingConfig[Constants.isFullScreen],
              onChanged: (isActive) {
                setState(() {
                  Constants.settingConfig[Constants.isFullScreen] = isActive;
                  Constants().saveConfig(Constants.settingConfig);
                });
              },
            ),
            onTap: () {
              setState(() {
                Constants.settingConfig[Constants.isFullScreen] = !Constants.settingConfig[Constants.isFullScreen];
                Constants().saveConfig(Constants.settingConfig);
              });
            },
          ),
          ListTile(
            title: Text('音量键控制'),
            trailing: Switch(
              value: Constants.settingConfig[Constants.isVolumeControl],
              onChanged: (isActive) {
                setState(() {
                  Constants.settingConfig[Constants.isVolumeControl] = isActive;
                  Constants().saveConfig(Constants.settingConfig);
                });
              },
            ),
            onTap: () {
              setState(() {
                Constants.settingConfig[Constants.isVolumeControl] = !Constants.settingConfig[Constants.isVolumeControl];
                Constants().saveConfig(Constants.settingConfig);
              });
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              '下载设置',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
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
