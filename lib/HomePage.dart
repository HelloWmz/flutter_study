import 'package:flutter/material.dart';

import 'CartListPage.dart';
import 'CommodityEvaluationPage.dart';
import 'LoginPage.dart';
import 'RouteArgumentsPage.dart';
import 'SearchPage.dart';
import 'VerificationBoxPage.dart';

class HomePage extends StatefulWidget {
  String tittle;

  HomePage(this.tittle);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTittle;
  List list = [
    {'tittle': "筛选页面", 'routeName': "/searchPage"},
    {'tittle': "商品评价", 'routeName': "/commodityEvaluationPage"},
    {'tittle': "验证码输入框", 'routeName': "/verificationBoxPage"},
    {'tittle': "购物车", 'routeName': "/cartListPage"},
    {'tittle': "路由命名传参", 'routeName': "/routeArgumentsPage"},
    {'tittle': "点击小游戏", 'routeName': "/palyGamePage"},
    {'tittle': "provider使用", 'routeName': "/providerPage"},
    {'tittle': "吸顶sticky_headers", 'routeName': "/stickyPage"},
    {'tittle': "点赞小动画", 'routeName': "/likeAnimationPage"},
    {'tittle': "Dio使用", 'routeName': "/DioDemo"},
  ];

  @override
  void initState() {
    super.initState();
    newTittle = widget.tittle;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: _getListViewItem('${list[index]['tittle']}', index),
              onTap: () {
                Navigator.pushNamed(context, list[index]['routeName']);
              },
            );
          }),
      /*  body: Center(
        child: GestureDetector(
          child: Text(newTittle),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
          },

        ),
      ),*/
    );
  }

  Widget _getListViewItem(String tittle, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          color: index % 2 == 0 ? Colors.red : Colors.pink,
          border: Border(bottom: BorderSide(color: Colors.black, width: 1))),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            '${tittle}',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
