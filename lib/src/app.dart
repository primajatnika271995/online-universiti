import 'package:flutter/material.dart';
import 'package:online_university/src/injector/injector.dart';
import 'package:online_university/src/views/component/bottom_navigation.dart';
import 'package:online_university/src/views/component/log.dart';
import 'package:online_university/src/views/home.dart';
import 'package:online_university/src/views/introduction_page/introduction.dart';
import 'package:online_university/src/views/payment_page/transaksi_screen.dart';

void app() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Open-Sans'),
        initialRoute: '/introduction',
        routes: {
          '/': (context) => BottomNavigationDrawer(),
          '/introduction': (context) => IntroductionPage(),
          '/transaction-history': (context) => TransaksiScreen(),
        },
      ),
    );
  } catch(err) {
    log.info(err.toString());
  }
}