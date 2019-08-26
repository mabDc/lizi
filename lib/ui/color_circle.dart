import 'package:flutter/material.dart';
import 'package:lizi/utils/page_helper.dart';

class ColorCircle extends StatelessWidget {
  final String explanation;
  final String name;
  final Color color;
  final VoidCallback onTap;
  ColorCircle(this.explanation, this.name, this.color,{this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$explanation　　'),
      subtitle: Text('$name　　'),
      leading:  Container(
          height: 32.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),color: color),
          width: 32,
        ),
        onTap: onTap,
        onLongPress:PageHelper.pushPage(context, Material(color: color)) ,
    );
  }
}
