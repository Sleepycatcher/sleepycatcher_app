import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:sleepycatcher/pages/news/news.dart';
import 'package:sleepycatcher/pages/record/record.dart';
import 'package:sleepycatcher/pages/statistics/statistics.dart';

import '../pages/home/home.dart';
import '../pages/profile/profile.dart';

class RouterApp extends StatefulWidget {
  @override
  _RouterAppState createState() => _RouterAppState();
}

class _RouterAppState extends State<RouterApp> {
  var _selectedTab = _SelectedTab.values.indexOf(_SelectedTab.home);
  final PageController _pageController = PageController();
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values.indexOf(_SelectedTab.values[i]);
    });
  }

  void _handleIndexChangedByClick(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values.indexOf(_SelectedTab.values[i]);
      _pageController.jumpToPage(_selectedTab);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration:
          const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff1A1C2B),
                Color(0xff1A1C2B),
                Color(0xff1F223B),
                Color(0xff1F223B),
                Color(0xff1F223B),
                Color(0xff1F223B),
                Color(0xff1F223B),
                Color(0xff1A1C2B),
                Color(0xff1A1C2B),
                Color(0xff1F223B),
                Color(0xff1F223B),
            ],
          )
        ),
        child: PageView(
          controller: _pageController,
          onPageChanged: _handleIndexChanged,
          children: const<Widget> [
            HomePage(),
            NewsPage(),
            ProfilePage(),
            RecordPage(),
            StatisticsPage(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: const EdgeInsets.only(left: 10, right: 10),
        //  currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          currentIndex: _selectedTab,
          dotIndicatorColor: Colors.purpleAccent.withOpacity(0.2),
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.purpleAccent.withOpacity(0.2),
          // enableFloatingNavBar: false,
          onTap: _handleIndexChangedByClick,


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
            /// profile
            DotNavigationBarItem(
              icon: const Icon(Icons.man_sharp),
              selectedColor: const Color(0xff73544C),
            ),
            /// Record
            DotNavigationBarItem(
              icon: const Icon(Icons.shield_moon),
              selectedColor: const Color(0xff73544C),
            ),
            /// Statistic
            DotNavigationBarItem(
              icon: const Icon(Icons.query_stats),
              selectedColor: const Color(0xff73544C),

            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { home, news, profile, record, statistics }