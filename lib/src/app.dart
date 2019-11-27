import 'package:flutter/material.dart';
import 'package:online_university/src/views/component/bottomNavigation.dart';
import 'package:online_university/src/views/home.dart';

void app() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Open-Sans'),
      initialRoute: '/',
      routes: {
        '/': (context) => BottomNavigationDrawer(),
      },
    ),
  );
}