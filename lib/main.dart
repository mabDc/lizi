import 'package:flutter/material.dart';
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
}

