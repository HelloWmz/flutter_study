import 'package:flutter/material.dart';

import 'CartListPage.dart';
import 'CommodityEvaluationPage.dart';
import 'IndexPage.dart';
import 'RouteArgumentsPage.dart';
import 'RoutePage.dart';
import 'SearchPage.dart';
import 'VerificationBoxPage.dart';

final Routes = {
  "/": (context,) => IndexPage(),
  "/routePage": (context, {arguments}) => RoutePage(arguments: arguments),
  "/searchPage": (context) => SearchPage(),
  "/commodityEvaluationPage": (context) => CommodityEvaluationPage(),
  "/verificationBoxPage": (context) => VerificationBoxPage(),
  "/cartListPage": (context) => CartListPage(),
  "/routeArgumentsPage": (context) => RouteArgumentsPage(),
};
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContextBuilder = Routes[name];
  if (pageContextBuilder != null) {
    if (settings.arguments != null) {
      print(settings.arguments);
      Route route = MaterialPageRoute(builder: (BuildContext context) {
        return pageContextBuilder(context, arguments: settings.arguments);
      });
      return route;
    } else {
      Route route = MaterialPageRoute(builder: (BuildContext context) {
        return pageContextBuilder(context);
      });
      return route;
    }
  }
};
