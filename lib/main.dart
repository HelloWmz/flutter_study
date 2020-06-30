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



