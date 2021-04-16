import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Completer _completer = Completer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                onPressed: () async {
                  print('Function started waiting on Future');
                  var result = await doThings();
                  print('Function has completed');
                },
                child: Text('Start Completer'),
              ),
              MaterialButton(
                onPressed: () {
                  _completer.complete();
                },
                child: Text('Release Completer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future doThings() {
    return _completer.future;
  }
}
