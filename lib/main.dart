
import 'package:flutter/material.dart';
import 'widget/router.dart';


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
/*
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: const EdgeInsets.only(left: 10, right: 10),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.grey[300],
          backgroundColor: Colors.orange,
          // enableFloatingNavBar: false,
          onTap: _handleIndexChanged,
          items: [
            /// HomePage
            DotNavigationBarItem(
              icon: const Icon(Icons.home),
              selectedColor: const Color(0xff73544C),
            ),

            /// News
            DotNavigationBarItem(
              icon: const Icon(Icons.newspaper),
              selectedColor: const Color(0xff73544C),
            ),


          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { home, news }

 */