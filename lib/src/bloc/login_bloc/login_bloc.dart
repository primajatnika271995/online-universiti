import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:online_university/src/bloc/login_bloc/login_event.dart';
import 'package:online_university/src/bloc/login_bloc/login_state.dart';
import 'package:online_university/src/models/authenticated.dart';
import 'package:online_university/src/services/login_service.dart';
import 'package:online_university/src/utils/shared_preferences_helper.dart';
import 'package:online_university/src/views/component/log.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginService loginService;
  LoginBloc(this.loginService);

  @override
  // TODO: implement initialState
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is FetchLogin) {
      yield LoginLoading();

      try {
        Authenticated value = await loginService.login(event.username, event.password);

        await SharedPreferencesHelper.setAccessToken(value.accessToken);
        await SharedPreferencesHelper.setName(value.name);
        await SharedPreferencesHelper.setEmail(value.email);
        await SharedPreferencesHelper.setProfileImg(value.imageUrl);

        yield LoginSuccess(value);
      } catch(err) {
        log.warning(err.toString());
        yield LoginFailed();
      }
    }
  }
}