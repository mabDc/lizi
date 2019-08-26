import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/pages/theme_proxy_page.dart';

void main() async {
  Config();
  await Config().init();

  runApp(ThemeProxyPage());
}

