import 'package:flutter/material.dart';
import 'package:sleepycatcher/pages/unLogged/auth/login.dart';
import 'package:sleepycatcher/pages/unLogged/auth/register.dart';
import 'package:sleepycatcher/pages/unLogged/firstLog/firstLog.dart';

class RouterUnLogged extends StatefulWidget {
  const RouterUnLogged({Key? key}) : super(key: key);

  @override
  _RouterUnLoggedState createState() => _RouterUnLoggedState();
}

class _RouterUnLoggedState extends State<RouterUnLogged> {
  int _pageIndex = 0;

  void _changePage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  List<Widget> _pages = [];

  @override
  void initState() {
    _pages = [
      FirstLog(changePage: _changePage),
      LoginPage(),
      RegisterPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
    );
  }
}
