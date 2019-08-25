import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/pages/home_page.dart';

void main() async{
  
  Config();
  await Config().init();
  
  runApp(MaterialApp(
      title: '栗子',
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Config.primaryColor,
      ),
    ));
}