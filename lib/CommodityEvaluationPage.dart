import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommodityEvaluationPage extends StatefulWidget {
  @override
  _CommodityEvaluationPageState createState() =>
      new _CommodityEvaluationPageState();
}

class _CommodityEvaluationPageState extends State<CommodityEvaluationPage> {
  var _mCurrent = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        //自定义AppBar高度
        appBar: PreferredSize(
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF303133),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
              centerTitle: true,
              title: new Text(
                '商品评价',
                style: TextStyle(color: Color(0xFF303133), fontSize: 17),
              ),
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  alignment: Alignment.center,
                  child: Text("分享",
                      style: TextStyle(color: Color(0xFF303133), fontSize: 14)),
                )
              ],
            ),
            preferredSize: Size.fromHeight(45)),
        body: Container(
          margin: EdgeInsets.only(right: 10, top: 10, left: 10, bottom: 5),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: '商品好评度',
                      style: TextStyle(
                        color: Color(0xFF909399),
                        fontSize: 12,
                      )),
                  TextSpan(
                      text: '97%',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 12,
                      ))
                ])),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _getTittleTypeItem(
                      '全部 1.3 万',
                      Color.fromRGBO(247, 247, 247, 1),
                      Color.fromRGBO(242, 242, 242, 1),
                      17,
                      Color(0xFF373D3D),
                      12,
                      isSeclt: _mCurrent == 0,
                      index: 0),
                  _getTittleTypeItem(
                      '好评',
                      Color.fromRGBO(247, 247, 247, 1),
                      Color.fromRGBO(242, 242, 242, 1),
                      17,
                      Color(0xFF373D3D),
                      12,
                      isSeclt: _mCurrent == 1,
                      index: 1),
                  _getTittleTypeItem(
                      '中评',
                      Color.fromRGBO(247, 247, 247, 1),
                      Color.fromRGBO(242, 242, 242, 1),
                      17,
                      Color(0xFF373D3D),
                      12,
                      isSeclt: _mCurrent == 2,
                      index: 2),
                  _getTittleTypeItem(
                      '差评',
                      Color.fromRGBO(247, 247, 247, 1),
                      Color.fromRGBO(242, 242, 242, 1),
                      17,
                      Color(0xFF373D3D),
                      12,
                      isSeclt: _mCurrent == 3,
                      index: 3),
                  _getTittleTypeItem(
                      '有图',
                      Color.fromRGBO(247, 247, 247, 1),
                      Color.fromRGBO(242, 242, 242, 1),
                      17,
                      Color(0xFF373D3D),
                      12,
                      isSeclt: _mCurrent == 4,
                      index: 4),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return _getListViewItem(index, "111");
                      })),
              Divider(height: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
              SizedBox(
                height: 3,
              ),
              Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.account_circle,
                        size: 24,
                        color: Color(0xFF303133),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "客服",
                        style: TextStyle(color: Color(0xFF909399), fontSize: 9),
                      )
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      _getTittleTypeItem(
                          '加入购物车',
                          Color.fromRGBO(0, 198, 198, 1),
                          Color.fromRGBO(0, 198, 198, 1),
                          24,
                          Colors.white,
                          14,
                          height: 36),
                      SizedBox(
                        width: 10,
                      ),
                      _getTittleTypeItem(
                          '  立即购买  ',
                          Color.fromRGBO(255, 116, 85, 1),
                          Color.fromRGBO(255, 116, 85, 1),
                          24,
                          Colors.white,
                          14,
                          height: 36),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget _getTittleTypeItem(
    String text,
    Color bgColor,
    Color borderColor,
    double radius,
    Color textColor,
    double textSize, {
    bool isSeclt = false,
    int index = 0,
    double height: 28,
    double topbottompadd: 5,
    double leftrightPadd: 10,
    Color bgclickColor: const Color.fromRGBO(0, 198, 198, 0.1),
    Color borderclickColor: const Color.fromRGBO(0, 198, 198, 1),
    Color textclickColor: const Color(0xFF00C6C6),
  }) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _mCurrent = index;
          });
        },
        child: Container(
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: !isSeclt ? bgColor : bgclickColor,
                border: Border.all(
                    color: !isSeclt ? borderColor : borderclickColor),
                borderRadius: BorderRadius.circular(radius)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  leftrightPadd, topbottompadd, leftrightPadd, topbottompadd),
              child: Row(
                children: <Widget>[
                  Offstage(
                    offstage: !isSeclt,
                    child: Icon(
                      Icons.check,
                      size: 16,
                      color: Color(0xFF00C6C6),
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: !isSeclt ? textColor : textclickColor,
                      fontSize: textSize,
                    ),
                  )
                ],
              ),
            )));
  }

  Widget _getListViewItem(int index, String s) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 24,
            height: 24,
            child: CircleAvatar(
              child: Icon(
                Icons.account_circle,
                size: 24,
              ),
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "小哇",
                    style: TextStyle(
                      color: Color(0xFF999399),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 2),
                    height: 14,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Color(0xFF252728),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFFF7C991),
                          ),
                          child: Text(
                            "V",
                            style: TextStyle(
                                color: Color(0xff252728),
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "01",
                          style: TextStyle(
                            color: Color(0xffF7C991),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              _getStartItem(2),
              SizedBox(
                height: 12,
              ),
              Text(
                "帽子的颜色不错，质量也不错的，而且价格便宜，柔软舒服，卖家的态度也很好，很细…",
                style: TextStyle(
                  color: Color(0xFF303133),
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ))
        ],
      ),
    );
  }

  _getStartItem(int i) {
    return Row(children: _getStart(i));
  }

  List<Widget> _getStart(int i) {
    List<Widget> list = List();
    List.generate(
        5,
        (index) => {
              list.add(Padding(
                padding: EdgeInsets.only(right: 1, top: 2),
                child: Icon(
                  Icons.star,
                  size: 10,
                  color: Color(index < i ? 0xFFF7C991 : 0x40909399),
                ),
              ))
            });
    return list;
  }
}
