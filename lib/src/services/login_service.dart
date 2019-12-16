import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/models/authenticated.dart';
import 'package:online_university/src/utils/dio_logging_interceptors.dart';
import 'package:online_university/src/views/component/log.dart';

class LoginService {
  final Dio _dio = new Dio();
  final clientId = 'online-university';
  final clientSecret = '12345';

  LoginService() {
    _dio.options.baseUrl = UriApi.dioAuthUri;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<Authenticated> login(String username, String password) async {
    var params = {
      "username": username,
      "password": password,
      "grant_type": "password",
    };

    try {
      final response = await _dio.post(
        UriApi.loginUri,
        data: FormData.fromMap(params),
        options: Options(
          headers: {
            'Authorization':
                'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}'
          },
        ),
      );
      log.info(response.statusCode);
      return compute(authenticatedFromJson, json.encode(response.data));
    } catch (error) {
      log.warning(error.toString());
    }
    return null;
  }
}
