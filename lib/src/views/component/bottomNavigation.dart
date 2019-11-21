import 'package:flutter/material.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/home.dart';

class BottomNavigationDrawer extends StatefulWidget {
  @override
  _BottomNavigationDrawerState createState() => _BottomNavigationDrawerState();
}

class _BottomNavigationDrawerState extends State<BottomNavigationDrawer> {
  int _selectedIndex = 0;

  List<Widget> _widgetPages = [
    HomePage(),
    Center(
      child: Text('My Classes'),
    ),
    Center(
      child: Text('Sign In'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetPages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            title: Text('Watch'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            title: Text('My Classes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text('Sign In'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.blue_stone,
        onTap: _onItemTapped,
      ),
    );
  }
}
