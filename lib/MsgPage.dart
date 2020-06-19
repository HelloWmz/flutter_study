import 'package:flutter/material.dart';



class MsgPage extends StatefulWidget {
  @override
  _MsgPageState createState() => new _MsgPageState();
}

class _MsgPageState extends State<MsgPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(
          child: new Text('消息页面'),
        ),
      ),
    );
  }
}