
import 'package:flutter/material.dart';
import 'widget/router.dart';
import 'widget/sleepTheme.dart';


void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'SleepyCatcher',
      home: RouterApp(),

    );
  }
}