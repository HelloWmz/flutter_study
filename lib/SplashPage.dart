import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'IndexPage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPage createState() => new _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getIsLogin();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: isLogin ? IndexPage() : LoginPage(),
    );
  }

  _getIsLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLogin =  sharedPreferences.getBool("isLogin");
    setState(() {
      this.isLogin = isLogin!=null?isLogin:false;
    });
  }
}
