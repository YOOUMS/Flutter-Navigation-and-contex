import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navkey = GlobalKey<NavigatorState>();

  static NavigateWidget(Widget widget) {
    Navigator.of(navkey.currentContext!)
        .push(MaterialPageRoute(builder: (context) => widget));
  }
}
