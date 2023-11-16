
import 'package:flutter/material.dart';
import 'package:flutter_architecture/features/activity/presentation/screens/activity_screen.dart';
import 'dart:io';

import 'package:flutter_architecture/features/index/presentation/tabbar_item.dart';
import 'package:flutter_architecture/features/workspace%20copy/presentation/screens/workspace_screen.dart';
import 'package:flutter_architecture/features/workspace/presentation/screens/workspace_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _NormalTabBarState();
}

class _NormalTabBarState extends State<IndexScreen> {

  final PageController _controller = PageController(
    initialPage: 0 
  );

  final List<TabBarItem> items = [
    TabBarItem(title: 'Workspace', norImage: "images/tabbar_chat.png", selImage: "images/tabbar_chat_hl.png"),
    TabBarItem(title: 'Activity', norImage: "images/tabbar_contact.png", selImage: "images/tabbar_contact_hl.png"),
    TabBarItem(title: 'Me', norImage: "images/tabbar_discover.png", selImage: "images/tabbar_discover_hl.png")
  ];

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (int page) {
          setState(() {
            _pageIndex = page;
          });
          _controller.jumpToPage(page);
        },
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.cyanAccent,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        items: items.map((e) {
          return BottomNavigationBarItem(
            label: e.title,
            icon: Image.asset(e.norImage,  width: 20, height: 20,),
            activeIcon: Image.asset(e.selImage, width: 20, height: 20,),
          );
        }).toList(),
      ),
      body: PageView(
        controller: _controller,
        //不设置默认可以左右活动，如果不想左右滑动如下设置，可以根据ios或者android来设置
        physics: Platform.isAndroid ? const PageScrollPhysics() : const NeverScrollableScrollPhysics(),
        children: const [
          //设置内容页面即可，要和 bottomNavigationBar 数量一致
          WorkspaceScreen(),
          ActivityScreen(),
          MeScreen()
        ],
      ),
    );
  }
}