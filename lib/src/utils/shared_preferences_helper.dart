import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  ///
  /// Instantiation of the SharedPreferences library
  ///
  static final String _kSkipIntro = "intro";
  static final String _kAccessToken = "token";
  static final String _kEmail = "email";
  static final String _kName = "name";
  static final String _kProfileImg = "profileImg";

  /// ------------------------------------------------------------
  /// Method that returns the skip introduction, 'false' if not set
  /// ------------------------------------------------------------
  static Future<bool> getSkipIntro() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_kSkipIntro) ?? false;
  }

  /// ----------------------------------------------------------
  /// Method that saves the skip introduction
  /// ----------------------------------------------------------
  static Future<bool> setSkipIntro(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_kSkipIntro, value);
  }

  /// ------------------------------------------------------------
  /// Method that returns the access token, 'null' if not set
  /// ------------------------------------------------------------
  static Future<String> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kAccessToken) ?? null;
  }

  /// ----------------------------------------------------------
  /// Method that saves the access token
  /// ----------------------------------------------------------
  static Future<bool> setAccessToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kAccessToken, value);
  }

  /// ------------------------------------------------------------
  /// Method that returns the email, 'null' if not set
  /// ------------------------------------------------------------
  static Future<String> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kEmail) ?? null;
  }

  /// ----------------------------------------------------------
  /// Method that saves the email
  /// ----------------------------------------------------------
  static Future<bool> setEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kEmail, value);
  }

  /// ------------------------------------------------------------
  /// Method that returns the name, 'null' if not set
  /// ------------------------------------------------------------
  static Future<String> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kName) ?? null;
  }

  /// ----------------------------------------------------------
  /// Method that saves the name
  /// ----------------------------------------------------------
  static Future<bool> setName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kName, value);
  }

  /// ------------------------------------------------------------
  /// Method that returns the profile image, 'null' if not set
  /// ------------------------------------------------------------
  static Future<String> getProfileImg() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kProfileImg) ?? null;
  }

  /// ----------------------------------------------------------
  /// Method that saves the profile image
  /// ----------------------------------------------------------
  static Future<bool> setProfileImg(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kProfileImg, value);
  }
}