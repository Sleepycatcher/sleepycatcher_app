import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget/router/RouterLogged.dart';
import 'widget/router/RouterUnLogged.dart';



void main() {

  runApp(const MyApp());
}

const isLoggedIn = true;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      title: 'SleepyCatcher',

      home: isLoggedIn ? const RouterLogged() : const RouterUnLogged(),

    );
  }
}
