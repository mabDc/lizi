import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/pages/error_page.dart';
import 'package:lizi/pages/theme_proxy_page.dart';

void main() async {
  Config();
  await Config().init();

  ErrorWidget.builder = (FlutterErrorDetails err){
    String errorMsg = err.toStringShort() + '\n' + err.toString();
    print(errorMsg);
    return ErrorPage(errorMsg);
  };
  
  runApp(ThemeProxyPage());
  if (Platform.isAndroid) {
      // 以下两行 
      // 设置android状态栏为透明的沉浸。
      // 写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏
      // 写在渲染之前，MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor:    Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

