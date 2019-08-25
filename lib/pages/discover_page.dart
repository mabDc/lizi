import 'package:flutter/material.dart';
import 'package:lizi/pages/discover_show_page.dart';
import 'package:lizi/pages/source_edit_page.dart';
import 'package:lizi/source/U17.dart';
import 'package:lizi/ui/source_item.dart';
import 'package:lizi/utils/page_helper.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SourceItem(
          U17.name,
          PageHelper.pushPage(context,
              SourceEditPage(U17.name, U17.source as Map<String, dynamic>)),
          PageHelper.pushPage(context, DiscoverShowPage('发现 - ${U17.name}')),
        ),
        Divider(),
        ListTile(
          title: Icon(Icons.add),
          onTap: () => print('add source'),
        ),
      ],
    );
  }
}