import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper _instance;
  static SharedPreferences _sharedPreferences;

  static const String kSkipIntro = "intro";
  static const String kAccessToken = "accessToken";
  static const String kRefreshToken = "refreshToken";
  static const String kEmail = "email";
  static const String kName = "name";
  static const String kProfileImg = "profileImg";

  static Future<SharedPreferencesHelper> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferencesHelper();
    }
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  Future<bool> putBool(String key, bool value) {
    return _sharedPreferences.setBool(key, value);
  }

  bool getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  Future<bool> putDouble(String key, double value) {
    return _sharedPreferences.setDouble(key, value);
  }

  double getDouble(String key) {
    return _sharedPreferences.getDouble(key);
  }

  Future<bool> putInt(String key, int value) {
    return _sharedPreferences.setInt(key, value);
  }

  int getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  Future<bool> putString(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }

  String getString(String key) {
    return _sharedPreferences.getString(key);
  }

  Future<bool> putStringList(String key, List<String> value) {
    return _sharedPreferences.setStringList(key, value);
  }

  List<String> getStringList(String key) {
    return _sharedPreferences.getStringList(key);
  }

  bool isKeyExists(String key) {
    return _sharedPreferences.containsKey(key);
  }

  Future<bool> clearKey(String key) {
    return _sharedPreferences.remove(key);
  }

  Future<bool> clearAll() {
    return _sharedPreferences.clear();
  }

  // ------------------------------------------------------------
  /// Method that returns the skip introduction, 'false' if not set
  /// ------------------------------------------------------------
  static Future<bool> getSkipIntro() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(kSkipIntro) ?? false;
  }

  /// ----------------------------------------------------------
  /// Method that saves the skip introduction
  /// ----------------------------------------------------------
  static Future<bool> setSkipIntro(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(kSkipIntro, value);
  }

  /// ------------------------------------------------------------
  /// Method that returns the access token, 'null' if not set
  /// ------------------------------------------------------------
  static Future<String> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(kAccessToken) ?? null;
  }

  /// ----------------------------------------------------------
  /// Method that saves the access token
  /// ----------------------------------------------------------
  static Future<bool> setAccessToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(kAccessToken, value);
  }

  /// ------------------------------------------------------------
  /// Method that returns the email, 'null' if not set
  /// ------------------------------------------------------------
  static Future<String> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(kEmail) ?? null;
  }

  /// ----------------------------------------------------------
  /// Method that saves the email
  /// ----------------------------------------------------------
  static Future<bool> setEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(kEmail, value);
  }

  /// ------------------------------------------------------------
  /// Method that returns the name, 'null' if not set
  /// ------------------------------------------------------------
  static Future<String> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(kName) ?? null;
  }

  /// ----------------------------------------------------------
  /// Method that saves the name
  /// ----------------------------------------------------------
  static Future<bool> setName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(kName, value);
  }

  /// ------------------------------------------------------------
  /// Method that returns the profile image, 'null' if not set
  /// ------------------------------------------------------------
  static Future<String> getProfileImg() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(kProfileImg) ?? null;
  }

  /// ----------------------------------------------------------
  /// Method that saves the profile image
  /// ----------------------------------------------------------
  static Future<bool> setProfileImg(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(kProfileImg, value);
  }

}