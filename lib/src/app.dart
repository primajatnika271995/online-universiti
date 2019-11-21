import 'package:flutter/material.dart';
import 'package:online_university/src/views/component/bottomNavigation.dart';
import 'package:online_university/src/views/home.dart';

void app() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => BottomNavigationDrawer(),
      },
    ),
  );
}