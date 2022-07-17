import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:push_and_pop/AppRouter.dart';

import 'Screen3.dart';

class Screen2 extends StatelessWidget {
  final screenName = 'screen2';
  String title;
  Screen2(this.title);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context, "This data from screen2");
          return Future.value(true);
        } else {
          log("this is the last screen");
          return Future.value(false);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                AppRouter.NavigateWidget(
                    Screen3("Screen3 from approuter class"));
                // dynamic x = await Navigator.pushNamed(
                //     context, Screen3("Screen 3").screenName,
                //     arguments: 'Screen3 from cons');

                // print(x);
              },
              child: Text("Go to screen3"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.canPop(context)
                    ? Navigator.pop(context, "this data from screen2")
                    : log("this the last screen");
              },
              child: Text("Go back to screen1"),
            ),
          ],
        )),
      ),
    );
  }
}
