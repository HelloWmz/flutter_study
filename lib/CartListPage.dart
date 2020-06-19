import 'package:flutter/material.dart';

import 'RoundCheckBox.dart';

class CartListPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<CartListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              leading: Icon(
                Icons.arrow_back_ios,
                color: Color(
                  0xff303133,
                ),
                size: 24,
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
                Container(
                  margin: EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  child: _getCommonText("完成",
                      textColor: Color(
                        0xff00C7C7,
                      ),
                      fontSize: 14),
                )
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
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return _getCartItem("11");
                    }),
              )),
              SizedBox(height: 3,),
              _getBottomView(),
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
            value: true,
            onChanged: (v) {},
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

  Widget _getCartItem(String s) {
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
                        RoundCheckBox(
                          value: true,
                          onChanged: (v) {},
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        _getCommonText("青年旅行舍",
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
                  itemCount: 2,
                  shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
                  physics: NeverScrollableScrollPhysics(), //禁用滑动事件
                  itemBuilder: (BuildContext context, int index) {
                    return _getCarInItem();
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _getCarInItem() {
    return Container(
      child: Row(
        children: <Widget>[
          RoundCheckBox(
            value: false,
            onChanged: (v) {},
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
                      _getCommonText("夏季出行必备太阳帽海滩帽遮阳两用帽大方简单",
                          textColor: Color(0Xff303133), fontSize: 14),
                      SizedBox(
                        height: 4,
                      ),
                      _getCommonText("桔红色的荷叶卷边",
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
                          _getCommonText("90.00",
                              textColor: Color(0xffFF7455),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          Text(
                            "100.00",
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
                                child: _getCommonText("-",fontSize: 12,textColor: Color(0xFF909399)),
                                height: 16,
                                width: 16,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(color: Color( 0xFFC0C4CC),width: 1,style: BorderStyle.solid)
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5,right: 5),
                                child: _getCommonText("1",fontSize: 12,textColor: Color(0xFF303133)),
                                height: 25,
                                width: 25,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF7F7F7),
                                ),
                              ),Container(
                                child: _getCommonText("+",fontSize: 12,textColor: Color(0xFF909399)),
                                height: 16,
                                width: 16,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:Border.all(color: Color( 0xFFC0C4CC),width: 1,style: BorderStyle.solid)
                                ),
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
}
