import 'package:flutter/cupertino.dart';
import 'package:online_university/src/config/local_storage.dart';
import 'package:online_university/src/models/authenticated.dart';
import 'package:online_university/src/repository/login_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_logger/simple_logger.dart';

class LoginBloc {
  SharedPreferences _preferences;

  final log = SimpleLogger();

  final loginRepository = LoginRepository();
  final authorizedFetcher = PublishSubject<Authenticated>();

  Observable<Authenticated> get authorizedStream => authorizedFetcher.stream;

  login(BuildContext context, String username, String password) async {
    Authenticated authenticated = await loginRepository.login(context, username, password).then((value) async {
      log.info(value.accessToken);

      _preferences = await SharedPreferences.getInstance();
      _preferences.setString(LocalStorage.ACCESS_TOKEN_KEY, value.accessToken != null ? value.accessToken : null);
      _preferences.setString(LocalStorage.EMAIL_KEY, value.email != null ? value.email : null);
      _preferences.setString(LocalStorage.NAME_KEY, value.name != null ? value.name : null);
      _preferences.setString(LocalStorage.PROFILE_IMG_KEY, value.imageUrl != null ? value.imageUrl : "https://content-static.upwork.com/uploads/2014/10/02123010/profilephoto_goodcrop.jpg");

      authorizedFetcher.sink.add(value);
      _onNavigation(context);
    }).catchError((err) => log.warning(err.toString()));
  }

  _onNavigation(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/');
  }

  dispose() async {
    authorizedFetcher.close();
  }
}

final loginBloc = LoginBloc();