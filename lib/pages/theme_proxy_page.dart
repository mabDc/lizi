import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/pages/home_page.dart';

class ThemeProxyPage extends StatefulWidget {
  @override
  State createState() => ThemeProxyPageState();
}

class ThemeProxyPageState extends State<ThemeProxyPage> {
  @override
  void initState() {
    Config.setTheme = setState;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '亦搜',
      theme: ThemeData(primaryColor: Config.primaryColor),
      home: HomePage(),
    );
  }
}
