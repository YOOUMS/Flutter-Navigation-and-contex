import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:push_and_pop/AppRouter.dart';

import 'Screen2.dart';

class Screen1 extends StatelessWidget {
  final screenName = 'screen1';
  String title;
  Screen1(this.title);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context, "This data from screen1");
          return Future.value(true);
        } else {
          log("this is the last screen");
          return Future.value(false);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
            child: TextButton(
          onPressed: () async {
            AppRouter.NavigateWidget(Screen2("Screen 2 from approuter clas"));
            // dynamic x = await Navigator.pushNamed(
            //     context, Screen2("Screen 2").screenName,
            //     arguments: 'Screen2 from cont');
            // print(x);
          },
          child: Text("Go to screen2"),
        )),
      ),
    );
  }
}
