import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';

class TextWithTheme extends Text{
  final String title;
  TextWithTheme(this.title) : super(title);
  
  @override
  TextStyle get style => TextStyle(color: Config.primaryColor);
}