import 'package:flutter/material.dart';

import 'RoundCheckBox.dart';
import 'Databean.dart';

class CartListPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<CartListPage> {
  bool isEidet;
  bool isAllSeclet=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEidet = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color(
                    0xff303133,
                  ),
                  size: 24,
                ),
              ),
              title: _getCommonText("购物车(20)",
                  textColor: Color(
                    0xff303133,
                  ),
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              actions: <Widget>[
                _addGestureDetectorToWidget(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      child: _getCommonText(isEidet ? "编辑" : "完成",
                          textColor: Color(
                            0xff00C7C7,
                          ),
                          fontSize: 14),
                    ),
                    onTap: _clickTopTittle)
              ],
            ),
            preferredSize: Size.fromHeight(45)),
        body: Container(
          color: Color(0xFFF5F5F5),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: mListData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _getCartItem(mListData[index], index);
                    }),
              )),
              SizedBox(
                height: 3,
              ),
              Offstage(
                offstage: isEidet,
                child: _getBottomView(),
              ),
            ],
          ),
        ));
  }

  _getCommonText(String data,
      {Color textColor, double fontSize, FontWeight fontWeight}) {
    return Text(
      data,
      style: TextStyle(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    );
  }

  _getBottomView() {
    return Container(
      height: 48,
      padding: EdgeInsets.only(left: 12, right: 16, top: 6, bottom: 6),
      alignment: Alignment.center,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          RoundCheckBox(
            value: isAllSeclet,
            onChanged: (v) {
              _setClickAll(v);
            },
          ),
          SizedBox(
            width: 5,
          ),
          _getCommonText("全选",
              textColor: Color(
                0xff909399,
              ),
              fontSize: 14),
          Expanded(
            child: SizedBox(),
          ),
          Container(
            height: 36,
            width: 86,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromRGBO(247, 247, 247, 1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: _getCommonText("删除",
                textColor: Color(
                  0xff606266,
                ),
                fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget _getCartItem(var item, int outPosition) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.only(top: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: EdgeInsets.only(bottom: 10, top: 5),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 23,
                    child: Row(
                      children: <Widget>[
                        Offstage(
                          child: RoundCheckBox(
                            value: item["isoutSeclet"],
                            onChanged: (v) {
                              _setOutItem(outPosition, v);
                            },
                          ),
                          offstage: item["isShow"],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        _getCommonText(item["title"],
                            textColor: Color(
                              0xff909399,
                            ),
                            fontSize: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 1,
              color: Color(0xffEBEEF5),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListView.builder(
                  itemCount: item["itemList"].length,
                  shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
                  physics: NeverScrollableScrollPhysics(), //禁用滑动事件
                  itemBuilder: (BuildContext context, int index) {
                    return _getCarInItem(
                        item["itemList"][index], outPosition, index);
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _getCarInItem(var item, int outPosition, int index) {
    return Container(
      child: Row(
        children: <Widget>[
          Offstage(
            child: RoundCheckBox(
              value: item["isintSeclet"],
              onChanged: (v) {
                _setIntItem(outPosition, index, v);
              },
            ),
            offstage: item["isintShow"],
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15, left: 3),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: AssetImage('images/pic.png'),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 15, left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _getCommonText(item["itemTittle"],
                          textColor: Color(0Xff303133), fontSize: 14),
                      SizedBox(
                        height: 4,
                      ),
                      _getCommonText(item["itemDes"],
                          textColor: Color(0xff909399), fontSize: 12),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: _getCommonText("¥",
                                textColor: Color(0xffFF7455), fontSize: 12),
                            margin: EdgeInsets.only(top: 3, right: 2),
                          ),
                          _getCommonText(item["itemPic"],
                              textColor: Color(0xffFF7455),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          Text(
                            item["itemOld"],
                            style: TextStyle(
                                color: Color(
                                  0xFFC0C4CC,
                                ),
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Expanded(child: SizedBox()),
                          Row(
                            children: <Widget>[
                              Container(
                                child: _getCommonText("-",
                                    fontSize: 12, textColor: Color(0xFF909399)),
                                height: 16,
                                width: 16,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Color(0xFFC0C4CC),
                                        width: 1,
                                        style: BorderStyle.solid)),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                child: _getCommonText(item["num"],
                                    fontSize: 12, textColor: Color(0xFF303133)),
                                height: 25,
                                width: 25,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF7F7F7),
                                ),
                              ),
                              Container(
                                child: _getCommonText("+",
                                    fontSize: 12, textColor: Color(0xFF909399)),
                                height: 16,
                                width: 16,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Color(0xFFC0C4CC),
                                        width: 1,
                                        style: BorderStyle.solid)),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  _addGestureDetectorToWidget({Widget child, GestureTapCallback onTap}) {
    return GestureDetector(onTap: onTap, child: child);
  }

  _clickTopTittle() {
    setState(() {
      isEidet = !isEidet;
      mListData.map((object) {
        object["isShow"] = isEidet;
        if (isEidet) {
          object["isoutSeclet"] = false;
        }
        List itemList = object["itemList"];
        itemList.map((value) {
          value["isintShow"] = isEidet;
          if (isEidet) {
            value["isintSeclet"] = false;
          }
        }).toList();
      }).toList();
    });
  }

  _setOutItem(int outPosition, bool v) {
    setState(() {
      mListData[outPosition]["isoutSeclet"] = v;
      List itemList = mListData[outPosition]["itemList"];
      itemList.map((value) {
        value["isintSeclet"] = v;
      }).toList();
    });
  }

  _setIntItem(int outPosition, int index, bool value) {
    setState(() {
      List itemList = mListData[outPosition]["itemList"];
      itemList[index]["isintSeclet"] = value;
      bool isAllSeclet = true;
      for (var i = 0; i < itemList.length; i++) {
        if (!itemList[i]["isintSeclet"]) {
          isAllSeclet = false;
          break;
        }
      }
      print(isAllSeclet);
      mListData[outPosition]["isoutSeclet"] = isAllSeclet;
    });
  }

  //全选
  _setClickAll(bool v) {
    setState(() {
      isAllSeclet=v;
      mListData.map((object) {
        object["isoutSeclet"] = v;
        List itemList = object["itemList"];
        itemList.map((value) {
          value["isintSeclet"] = v;
        }).toList();
      }).toList();
    });
  }
}
