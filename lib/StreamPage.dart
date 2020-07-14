import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => new _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Stream学习'),
      ),
      body: _getBoy(context),
    );
  }
// 创建一个计时器的示例：每隔1秒，计数加1。这里，使用Stream来实现每隔一秒生成一个数字。
  Stream<int> conunt() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }

  _getBoy(context) {
    return StreamBuilder<int>(
        stream: conunt(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Container();
        });
  }
}
