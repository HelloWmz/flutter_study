import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'IndexPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mPhonetextEditingController;
  TextEditingController mPasstextEditingController;
  bool isVisible = false;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    mPhonetextEditingController = new TextEditingController();
    mPasstextEditingController = new TextEditingController();
    mPhonetextEditingController.addListener(() {
      bool flag = false;
      if (mPhonetextEditingController.text.isNotEmpty &&
          mPasstextEditingController.text.isNotEmpty) {
        flag = true;
      } else {
        flag = false;
      }
      setState(() {
        isVisible = mPhonetextEditingController.text.isNotEmpty;
        isLogin = flag;
      });
    });
    mPasstextEditingController.addListener(() {
      bool flag = false;
      if (mPhonetextEditingController.text.isNotEmpty &&
          mPasstextEditingController.text.isNotEmpty) {
        flag = true;
      } else {
        flag = false;
      }
      setState(() {
        isLogin = flag;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 98, left: 32, right: 32),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "images/logo_icon.png",
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "高旅",
                        style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                _getEditText(mPhonetextEditingController, Icons.cancel,
                    _mCancelBack, "账号",
                    isVisible: isVisible),
                SizedBox(
                  height: 16,
                ),
                _getEditText(mPasstextEditingController, Icons.remove_red_eye,
                    _mPassCallBack, "密码"),
                SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () {
                    _loginCallBack();
                  },
                  child: _getCommonButton("登录", 48,
                      bgColor: isLogin
                          ? Color.fromRGBO(0, 198, 198, 1)
                          : Color.fromRGBO(0, 198, 198, 0.2),
                      radius: 25,
                      fontSize: 16,
                      textColor: Colors.white),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: 8, left: 2, bottom: 8, right: 8),
                      child: _getCommonText("验证码登录",
                          fontSize: 12, textColor: Color(0xFF00C6C6)),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, left: 8, bottom: 8, right: 2),
                            child: _getCommonText("忘记密码",
                                fontSize: 12, textColor: Color(0xFF00C6C6)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                  child: Image.asset(
            "images/bg_buttom_login.png",
            fit: BoxFit.fill,
          )))
        ],
      ),
    );
  }

  _mCancelBack() {
    mPhonetextEditingController.text = "";
  }

  _mPassCallBack() {}

  _getEditText(TextEditingController textEditingController, IconData iconData,
      Function cancelBack, String thintText,
      {bool isVisible: true}) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 12, right: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(25)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: TextField(

            controller: textEditingController,
            maxLines: 1,
            style: TextStyle(color: Color(0xFF303133), fontSize: 16),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: thintText,
                hintMaxLines: 1,
                hintStyle: TextStyle(color: Color(0xFFC0C4CC), fontSize: 14)),
          )),
          Opacity(
            opacity: isVisible ? 1 : 0,
            child: GestureDetector(
              onTap: () {
                cancelBack();
              },
              child: Icon(
                iconData,
                size: 16,
                color: Color(0xFFC0C4CC),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getCommonButton(String data, double height,
      {Color bgColor, double radius, Color textColor, double fontSize}) {
    return Container(
      alignment: Alignment.center,
      height: height,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(radius)),
      child: Text(
        data,
        style: TextStyle(color: textColor, fontSize: fontSize),
      ),
    );
  }

  _getCommonText(String data,
      {Color textColor, double fontSize, FontWeight fontWeight}) {
    return Text(
      data,
      style: TextStyle(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    );
  }

  void _loginCallBack() {
    if (isLogin) {
      if (mPhonetextEditingController.text == "123456" &&
          mPasstextEditingController.text == "123456") {
        saveIsLogin();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => IndexPage()));
      } else {
        Fluttertoast.showToast(
          msg: "用户名或密码不正确",
        );
      }
    }
  }

  Future saveIsLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance()..setBool("isLogin", true);
  }
}
