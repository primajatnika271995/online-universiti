import 'package:flutter/cupertino.dart';
import 'package:online_university/src/models/authenticated.dart';
import 'package:online_university/src/repository/loginRepository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_logger/simple_logger.dart';

class LoginBloc {
  final log = SimpleLogger();

  final loginRepository = LoginRepository();
  final authorizedFetcher = PublishSubject<Authenticated>();

  Observable<Authenticated> get authorizedStream => authorizedFetcher.stream;

  login(BuildContext context, String username, String password) async {
    Authenticated authenticated = await loginRepository.login(context, username, password).then((value) {
      log.info(value.accessToken);
      authorizedFetcher.sink.add(value);
    }).catchError((err) => log.warning(err.toString()));
  }

  dispose() async {
    authorizedFetcher.close();
  }

  final loginBloc = LoginBloc();
}