import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RoundUnderlineTabIndicator.dart';

class MyTaBar extends StatefulWidget {
  TabController _TabController;

  @override
  _MyTaBarState createState() => new _MyTaBarState();

  MyTaBar(this._TabController);
}

class _MyTaBarState extends State<MyTaBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: TabBar(
         controller:widget._TabController ,
          unselectedLabelColor: const Color(0xFF606266),
          unselectedLabelStyle: TextStyle(fontSize: 14),
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),
          labelColor: const Color(0xFF303133),
          indicator: RoundUnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2,
                color: Color(0xff00cdd7),
              )
          ),
          tabs: [
            Tab(
              child: Container(
                alignment: Alignment.center,
                child: Align(
                  child: Column(
                    children: <Widget>[
                      Text("全部"),
                    ],
                  ),
                ),
              ),
            ),

            Tab(
              child: Container(
                alignment: Alignment.center,
                child: Align(
                  child: Column(
                    children: <Widget>[
                      Text("优品"),
                    ],
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                alignment: Alignment.center,
                child: Align(
                  child: Column(
                    children: <Widget>[
                      Text("景点"),
                    ],
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                alignment: Alignment.center,
                child: Align(
                  child: Column(
                    children: <Widget>[
                      Text("酒店"),
                    ],
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                alignment: Alignment.center,
                child: Align(
                  child: Column(
                    children: <Widget>[
                      Text("攻略"),
                    ],
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
