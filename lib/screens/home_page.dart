import 'package:flutter/material.dart';
import 'package:health_app/screens/home_screen.dart';
import 'package:health_app/screens/info_screen.dart';
import 'package:health_app/utilities/colors.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _pages = [
    HomePage(),
    InfoScreen(),
    SettingsScreen(),
  ];

  int _selectedIndex = 0;

  void navBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: navBottomBar,
        unselectedFontSize: 10,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryClr,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Info'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
