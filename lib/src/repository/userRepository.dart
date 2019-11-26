import 'package:flutter/cupertino.dart';

class UserRepository {
  Future<String> authenticate({@required username, @required password}) async {
    await Future.delayed(Duration(milliseconds: 1000));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from SharedPreferences
    await Future.delayed(Duration(milliseconds: 1000));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to SharedPreferences
    await Future.delayed(Duration(milliseconds: 1000));
    return;
  }

  Future<bool> hasToken() async {
    /// read from SharedPreferences
    await Future.delayed(Duration(milliseconds: 1000));
    return false;
  }
}