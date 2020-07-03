import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CartPage.dart';
import 'HomePage.dart';
import 'MsgPage.dart';
import 'PersonPage.dart';

class IndexPage extends StatefulWidget {
  var index;

  @override
  State<StatefulWidget> createState() {
    return _IndexState(this.index);
  }

  IndexPage({this.index = 0});
}

class _IndexState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      title: Text("消息"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text("购物车"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text("个人中心"),
    ),
  ];

  int currentIndex;

  final pages = [HomePage("搜索"), MsgPage(), CartPage(), PersonPage()];

  _IndexState(index) {
    this.currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      bottomNavigationBar: Theme(
        //去掉底部导航的水波纹效果
          data: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              brightness: Brightness.light),
          child: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              _changePage(index);
            },
          )),
      body: pages[currentIndex],
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
