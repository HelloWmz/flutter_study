import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'IndexPage.dart';
import 'LoginPage.dart';
import 'RouteUtils.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        onGenerateRoute: onGenerateRoute),
  );
}

class MyAPP extends StatefulWidget {
  @override
  _MyAPPState createState() => new _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getIsLogin();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: isLogin ? IndexPage() : LoginPage(),
    );
  }

  _getIsLogin() async {
    bool isLogin = false;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isLogin = sharedPreferences.getBool("isLogin");
    setState(() {
      this.isLogin = isLogin ? false : isLogin;
    });
  }
}
