import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:push_and_pop/Screens/Screen1.dart';

class Screen3 extends StatelessWidget {
  final screenName = "screen3";

  String title;
  Screen3(this.title);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context, "This data from screen3");
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
          onPressed: () {
            Navigator.pop(context, "This data from screen3");

            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return Screen1();
            // }));
          },
          child: Text("Go Back to screen 1"),
        )),
      ),
    );
  }
}
