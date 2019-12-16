import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_university/src/app.dart';
import 'package:online_university/src/injector/injector.dart';
import 'package:online_university/src/views/component/log.dart';

void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    app();
  } catch(err) {
    log.warning(err.toString());
  }
}
