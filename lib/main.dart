import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widget/router/RouterLogged.dart';
import 'widget/router/RouterUnLogged.dart';
import 'package:sleepycatcher/services/authService.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer' as developer;
AuthService authService = AuthService();


void main() async {
  // await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  bool validJwt = await authService.checkJWT();
  print("validJwt");
  print(validJwt);

  runApp(MyApp(isLoggedIn: validJwt));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

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
