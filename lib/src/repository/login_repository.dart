import 'package:flutter/cupertino.dart';
import 'package:online_university/src/models/authenticated.dart';
import 'package:online_university/src/services/login_service.dart';

class LoginRepository {
  final serviceApi =  LoginService();

  Future<Authenticated> login(BuildContext context, String username, String password) {
    return serviceApi.login(context, username, password);
  }
}