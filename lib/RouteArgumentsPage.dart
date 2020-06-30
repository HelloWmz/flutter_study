import 'package:flutter/material.dart';



class RouteArgumentsPage extends StatefulWidget {
  @override
  _RouteArgumentsPageState createState() => new _RouteArgumentsPageState();
}

class _RouteArgumentsPageState extends State<RouteArgumentsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('路由命名传参'),
      ),
      body: RaisedButton(onPressed: (){
        Navigator.pushNamed(context, "/routePage",arguments: {
          "tittle":"路由命名传参的数据"
        });

      },child: Text("点我路由命名传参"),),
    );
  }
}