import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  //返回按钮的回调
  Function onBackCall;

  //输入框的
  TextEditingController controller;

  //右侧文本颜色
  int rightTextColor;

//右侧文本点击事件
  Function rightCallBack;

  String hintText;

  SearchAppBarWidget({
    this.onBackCall,
    this.rightCallBack,
    this.controller,
    this.hintText,
    this.rightTextColor = 0xFF00C7C7,
  });
  @override
  _SearchAppBarWidgetState createState() => new _SearchAppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(40); //这里设置控件（appBar）的高度;

}

class _SearchAppBarWidgetState extends State<SearchAppBarWidget> {
 bool isVisible=false;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        isVisible= widget.controller.text.isNotEmpty;
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Container(
        color: const Color(0xFFF5F5F5),
        alignment: Alignment(0, 0),
        padding: EdgeInsets.fromLTRB(10, 25, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Icon(Icons.arrow_back_ios),
              onTap: widget.onBackCall,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      border: Border.all(color: Colors.white, width: 1)),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.search,size: 17,color: Color(0xFFC0C4CC)),
                      Expanded(
                        child: TextField(
                          controller: widget.controller,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                              hintText: widget.hintText,
                              contentPadding: EdgeInsets.fromLTRB(5, 9, 0, 9),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: const Color(0xFF909399),
                              )),
                        ),
                      ),
                      GestureDetector(
                        child: Opacity(
                          opacity: isVisible?1:0,
                          child: Icon(Icons.cancel,size: 17,color: Color(0xFFC0C4CC)),
                        ),
                        onTap: () {
                          widget.controller.text = "";
                        },
                      )
                    ],
                  ),
                )),
            GestureDetector(
              child: Text(
                "搜索",
                style: TextStyle(
                    color: Color(widget.rightTextColor), fontSize: 14),
              ),
              onTap: () {
                widget.rightCallBack;
              },

            )
          ],
        ),
      ),
      preferredSize: Size.fromHeight(40),
    );
  }
}
