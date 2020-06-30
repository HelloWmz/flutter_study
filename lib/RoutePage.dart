import 'package:flutter/material.dart';

import 'IndexPage.dart';

class RoutePage extends StatefulWidget {
  final arguments;

  RoutePage({this.arguments});

  @override
  _RoutePageState createState() => new _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('路由命名传参'),
      ),
      body: Column(
        children: <Widget>[
          Text(
              "${widget.arguments != null ? widget.arguments['tittle'] : '无数据'}"),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              //返回根目录
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => IndexPage(index: 1)),
                  (route) => route == null);
            },
            child: Text("返回根目录"),
          )
        ],
      ),
    );
  }
}
