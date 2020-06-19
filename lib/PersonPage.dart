import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('个人中心'),
      ),
    );
  }
}