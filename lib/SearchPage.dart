import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/MyTabBar.dart';

import 'ListItem.dart';
import 'SearchAppBarWidget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  TextEditingController controller = new TextEditingController();
  PageController _PageController = new PageController(initialPage: 0);
  bool isPageCanChanged = true;
  List<String> mLists = List.generate(10, (index) => '${index + 1}');
  List datas = [
    {
      'tittle': "全部",
      'isSeclct': true,
    },
    {
      'tittle': "优品",
      'isSeclct': false,
    },
    {
      'tittle': "景点",
      'isSeclct': false,
    },
    {
      'tittle': "酒店",
      'isSeclct': false,
    },
    {
      'tittle': "攻略",
      'isSeclct': false,
    },
  ];

  ScrollController _ScrollController;

  //是否正在加载,防止多次请求加载下一页
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _ScrollController = ScrollController();
    _ScrollController.addListener(() {
      if (_ScrollController.position.pixels >=
          _ScrollController.position.maxScrollExtent) {
        //滚动到底
        _loadMore();
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
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: datas.length,
                childAspectRatio: 3 / 2,
              ),
              itemCount: datas.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: MyTittle(datas[index]),
                  onTap: () {
                    _onPageChanged(index, pageController: _PageController);
                  },
                );
              }),
          Expanded(
            child: PageView.builder(
                itemCount: 5,
                controller: _PageController,
                onPageChanged: (index) {
                  if (isPageCanChanged) {
                    //由于pageview切换是会回调这个方法
                    _onPageChanged(index);
                  }
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: RefreshIndicator(
                        child: ListView.builder(
                            itemCount: mLists.length + 1,
                            controller: _ScrollController,
                            itemBuilder: (BuildContext context, int index) {
                              if (index < mLists.length) {
                                return ListItem(mLists[index]);
                              } else {
                                //加载更多布局
                                return _buildLoadMoreItem();
                              }
                            }),
                        onRefresh: _handRefresh),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future<void> _handRefresh() async {
    //模拟数据
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        mLists.clear();
        List<String> refreshData = List.generate(5, (index) => '刷新数据${index}');
        mLists.insertAll(0, refreshData);
      });
    });
  }

  _onBackCall() {
    Navigator.of(context).pop();
  }

  _rightCallBack() {}

  _onPageChanged(int currentIndex, {PageController pageController}) {
    if (pageController == null) {
      setState(() {
        datas
            .asMap()
            .keys
            .map((index) => {
                  if (index == currentIndex)
                    {datas[currentIndex]['isSeclct'] = true}
                  else
                    {datas[index]['isSeclct'] = false}
                })
            .toList();
      });
    } else {
      isPageCanChanged = false;
      //等待pageview切换完毕,再释放pageivew监听
      _PageController.animateToPage(currentIndex,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
      isPageCanChanged = true;
    }
  }

  Future<void> _loadMore() async {
    if (!isLoadingMore) {
      setState(() {
        isLoadingMore = true;
      });
    }
    await Future.delayed(Duration(seconds: 3), () {
      List<String> loadMoreData = List.generate(5, (index) => '加载更多${index}');
      setState(() {
        mLists.addAll(loadMoreData);
      });

    });
  }

  Widget _buildLoadMoreItem() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text("加载中..."),
      ),
    );
  }

  Widget MyTittle(var data) {
    return Container(
      color: const Color(0xFFF5F5F5),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '${data['tittle']}',
            style: TextStyle(
                color: Color(data['isSeclct'] ? 0xFF303133 : 0xFF606266),
                fontSize: data['isSeclct'] ? 16 : 14,
                fontWeight:
                data['isSeclct'] ? FontWeight.bold : FontWeight.normal),
          ),
          Opacity(
            opacity: data['isSeclct'] ? 1 : 0,
            child: Container(
              margin: EdgeInsets.only(top: 5),
              height: 2,
              width: 16,
              decoration: BoxDecoration(
                color: Color(0xff00cdd7),
                borderRadius: BorderRadius.all(Radius.circular(1)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

