import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:statistics_app/pages/community.dart';
import 'package:statistics_app/pages/home.dart';
import 'package:statistics_app/pages/settings.dart';
import 'package:statistics_app/pages/statistics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    UserHome(),
    UserCommunity(),
    UserStatistics(),
    UserSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.pinkAccent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GNav(
            backgroundColor: Colors.pinkAccent,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.pink.shade800.withOpacity(0.7),
            padding: EdgeInsets.all(16),
            gap: 8,
            onTabChange: _navigateBottomBar,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.message,
                text: 'Community',
              ),
              GButton(
                icon: Icons.bar_chart,
                text: 'statistics',
              ),
              GButton(
                icon: Icons.settings,
                text: 'settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
