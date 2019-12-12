import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/models/authenticated.dart';
import 'package:simple_logger/simple_logger.dart';

class LoginService {

  Map<String, String> headers = {
    'Authorization': 'Basic b25saW5lLXVuaXZlcnNpdHk6MTIzNDU='
  };
  
  Client client = new Client();
  final log = SimpleLogger();

  Future<Authenticated> login(BuildContext context, String username, String password) async {
    var params = {
      "username": username,
      "password": password,
      "grant_type": "password",
    };

    try {
      final response = await client.post(UriApi.loginUri, headers: headers, body: params);
      log.info(response.statusCode);

      if (response.statusCode == 200)
        return compute(authenticatedFromJson, response.body);
      else if (response.statusCode == 400)
        log.info(response.body);
    } catch (error) {
      log.warning(error.toString());
    }

    return null;
  }

}