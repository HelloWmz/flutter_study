import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends Dialog {
  final double width; // 宽度
  final double height; // 高度
  final String content; // 内容
  final String cancelTxt; // 取消按钮的文本
  final String enterTxt; // 确认按钮的文本
  final Function canceCallback;
  final Function enterCallback;

  final String tittle; // 修改之后的回掉函数

  CustomDialog(
      {this.width: 270,
      this.height: 141,
      this.content,
      this.tittle,
      this.cancelTxt: "取消",
      this.enterTxt: "确认",
      this.canceCallback,
      this.enterCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // 点击遮罩层隐藏弹框
        child: Material(
            type: MaterialType.transparency, // 配置透明度
            child: Center(
                child: GestureDetector(
                    // 点击遮罩层关闭弹框，并且点击非遮罩区域禁止关闭
                    onTap: () {
                      print('我是非遮罩区域～');
                    },
                    child: Container(
                        width: this.width,
                        height: this.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: <
                                Widget>[
                          Positioned(
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                              alignment: Alignment.center,
                              child: Text("${this.tittle}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          ScreenUtil(allowFontScaling: true)
                                              .setSp(17),
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              alignment: Alignment.center,
                              child: Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                                  alignment: Alignment.center,
                                  child: Text("${this.content}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              ScreenUtil(allowFontScaling: true)
                                                  .setSp(13),
                                          fontWeight: FontWeight.w500)))),
                          Container(
                              height: 43,
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          width: 1, color: Color(0xffEFEFF4)))),
                              child: Row(children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        child: Container(
                                            height: double.infinity,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    right: BorderSide(
                                                        width: 1,
                                                        color: Color(
                                                            0xffEFEFF4)))),
                                            child: Text("${this.cancelTxt}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff007AFF),
                                                    fontSize: ScreenUtil(
                                                            allowFontScaling:
                                                                true)
                                                        .setSp(17),
                                                    fontWeight:
                                                        FontWeight.w400))),
                                        onTap: () {
                                          this.canceCallback();
                                          Navigator.pop(context);
                                        })),
                                Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        child: Container(
                                            height: double.infinity,
                                            // 继承父级的高度
                                            alignment: Alignment.center,
                                            child: Text("${this.enterTxt}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff007AFF),
                                                    fontSize: ScreenUtil(
                                                            allowFontScaling:
                                                                true)
                                                        .setSp(17),
                                                    fontWeight:
                                                        FontWeight.w600))),
                                        onTap: () {
                                          this.enterCallback();
                                          Navigator.pop(context); // 关闭dialog
                                        }))
                              ]))
                        ]))))),
        onTap: () {
          Navigator.pop(context);
        });
  }
}
