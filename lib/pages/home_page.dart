import 'package:flutter/material.dart';
import 'package:lizi/pages/about_page.dart';
import 'package:lizi/pages/discover_page.dart';
import 'package:lizi/pages/error_page.dart';
import 'package:lizi/pages/page.dart';
import 'package:lizi/pages/search_page.dart';
import 'package:lizi/pages/setting_page.dart';
import 'package:lizi/ui/about_bar.dart';
import 'package:lizi/ui/search_bar.dart';
import 'package:lizi/utils/page_helper.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Page _page = Page.values[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (() {
        switch (_page) {
          case Page.shelfPage:
            return SearchBar('书架', PageHelper.pushPage(context, SearchPage()));
            break;
          case Page.discoverPage:
            return SearchBar('发现', PageHelper.pushPage(context, SearchPage()));
            break;
          case Page.aboutPage:
            return AboutBar(PageHelper.pushPage(context, SettingPage()));
            break;
          default:
            return AppBar(
              title: Text('oOo'),
            );
        }
      })(),
      body: (() {
        switch (_page) {
          // case Page.shelfPage:
          //   return ;
          //   break;
          case Page.discoverPage:
            return DiscoverPage();
            break;
          case Page.aboutPage:
            return AboutPage();
            break;
          default:
            return ErrorPage('这页未写 $_page');
        }
      })(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('主页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.satellite),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            title: Text('关于'),
          ),
        ],
        currentIndex: _page.index,
        onTap: (index) {
          setState(() {
            _page = Page.values[index];
          });
        },
      ),
    );
  }
}
