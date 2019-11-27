import 'package:flutter/material.dart';
import 'package:online_university/src/views/component/bottomNavigation.dart';
import 'package:online_university/src/views/home.dart';
import 'package:online_university/src/views/introduction_page/introduction.dart';

void app() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Open-Sans'),
      initialRoute: '/introduction',
      routes: {
        '/': (context) => BottomNavigationDrawer(),
        '/introduction': (context) => IntroductionPage(),
      },
    ),
  );
}