import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/MyTabBar.dart';

import 'ListItem.dart';
import 'SearchAppBarWidget.dart';

class SearchPage extends StatefulWidget   {
  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  TextEditingController controller = new TextEditingController();
  TabController _TabController;
  int _CurrentIndex;

  PageController _PageController = new PageController(initialPage: 0);

  bool isPageCanChanged=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _TabController = new TabController(initialIndex: 0, length: 5, vsync: this,);
    _TabController.addListener(() {
      if (_TabController.indexIsChanging) {
        _CurrentIndex = _TabController.index;
        print(_CurrentIndex);
        _onPageChanged(_CurrentIndex, pageController: _PageController);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBarWidget(
        controller: controller,
        onBackCall: _onBackCall,
        rightCallBack: _rightCallBack,
        hintText: "搜索",
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: const Color(0xFFF5F5F5),
            child: MyTaBar(_TabController),
          ),
          Expanded(
            child: PageView.builder(
                itemCount: 5,
                controller: _PageController,
                onPageChanged: (index) {
                  if (isPageCanChanged) {
                    //由于pageview切换是会回调这个方法,又会触发切换tabbar的操作,所以定义一个flag,控制pageview的回调
                    _onPageChanged(index);
                  }
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return ListItem("111");
                      });
                }),
          )
        ],
      ),
    );
  }

  _onBackCall() {
    Navigator.of(context).pop();
  }

  _rightCallBack() {}

  _onPageChanged(int index, {PageController pageController}) async {
    if (pageController == null) {
      _TabController.animateTo(index);
    } else {
      isPageCanChanged = false;
      //等待pageview切换完毕,再释放pageivew监听
      await _PageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
      isPageCanChanged = true;
    }
  }
}
