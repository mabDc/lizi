import 'package:flutter/material.dart';
import 'package:lizi/global/config.dart';
import 'package:lizi/pages/about_page.dart';
import 'package:lizi/pages/discover_page.dart';
import 'package:lizi/pages/search_page.dart';
import 'package:lizi/ui/search_bar.dart';
import 'package:lizi/utils/page_helper.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final text = "text";
    final icon = "icon";
    final navigationItems = [
      {text: "主页", icon: Icons.library_books},
      {text: "发现", icon: Icons.satellite},
      {text: "关于", icon: Icons.info_outline},
    ];

    List<Widget> pages = <Widget>[
      Scaffold(appBar: SearchBar('书架', PageHelper.pushPage(context, SearchPage())),),
      DiscoverPage(),
      AboutPage(),
    ];

    return Scaffold(
      body: Config.option[Config.isSlidingNavigationBar]
          ? TabBarView(
              controller: _tabcontroller,
              children: pages,
            )
          : pages[_currentIndex],
      bottomNavigationBar: Config.option[Config.isSlidingNavigationBar]
          ? new Material(
              child: TabBar(
                controller: _tabcontroller,
                indicatorColor: Config.primaryColor,
                labelColor: Config.primaryColor,
                unselectedLabelColor: Colors.black87,
                tabs: navigationItems
                    .map(
                        (item) => Tab(text: item[text], icon: Icon(item[icon])))
                    .toList(),
              ),
            )
          : BottomNavigationBar(
              items: navigationItems
                  .map((item) => BottomNavigationBarItem(
                      title: Text(item[text]), icon: Icon(item[icon])))
                  .toList(),
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
    );
  }
}
