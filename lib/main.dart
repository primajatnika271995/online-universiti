import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_university/src/app.dart';
import 'package:online_university/src/injector/injector.dart';
import 'package:online_university/src/views/component/log.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  try {
    await setupLocator();
    runApp(App());
  } catch(err) {
    log.warning(err.toString());
  }
}
