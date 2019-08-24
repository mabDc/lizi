import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageHelper{
  static VoidCallback pushPage(BuildContext context, Widget page) {
      return () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) => page));
      };
    }
}