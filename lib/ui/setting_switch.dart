import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';

class SettingSwitch extends StatefulWidget {
  final String _title;
  final String _subtitle;
  final String _optionName;

  SettingSwitch(this._title, this._subtitle, this._optionName);

  @override
  State createState() => SettingSwitchState();
}

class SettingSwitchState extends State<SettingSwitch> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget._title),
      subtitle: Text(widget._subtitle),
      trailing: Switch(
        value: Config.option[widget._optionName],
        onChanged: (value) async {
          await Config().changeOption(widget._optionName, value);
          setState(() {});
        },
      ),
      onTap: () async {
        await Config().changeOption(
            widget._optionName, !Config.option[widget._optionName]);
        setState(() {});
      },
    );
  }
}
