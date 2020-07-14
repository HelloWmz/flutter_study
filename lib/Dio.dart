import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/netUtils/DioUtils.dart';
import 'package:logger/logger.dart';

import 'netUtils/RestClient.dart';



class DioDemo extends StatefulWidget {
  @override
  _DioDemoState createState() => new _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('dioDemo'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Map<String, String> queries = Map();
            queries["city_type"] = "1";
            queries["mobileNo"] = "7Lvg0V7ovR9BKFuLuWuigw==";
            RestClient(DioUtils.instance.dio)
                .sendMessageFastRegistration(queries)
                .then((value) => {Logger().e(value.toString())})
                .catchError((Object obj) {
              // non-200 error goes here.
              switch (obj.runtimeType) {
                case DioError:
                  // Here's the sample to get the failed response error code and message
                  final res = (obj as DioError);
                  Logger().e("Got error : ${res.error} -> ${res.message}");
                  break;
                default:
              }
            });
          },
          child: Text("点击"),
        ),
      ),
    );
  }
}
