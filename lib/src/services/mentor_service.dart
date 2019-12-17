import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/models/mentor_model.dart';
import 'package:online_university/src/utils/dio_logging_interceptors.dart';
import 'package:simple_logger/simple_logger.dart';

class MentorService {
  final Dio _dio = new Dio();
  final clientId = 'online-university';
  final clientSecret = '12345';

  final log = SimpleLogger();

  MentorService() {
    _dio.options.baseUrl = UriApi.dioAuthUri;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<MentorModel> getMentorByID(String idUser) async {
    var params = {
      "idUserProfile": idUser
    };

    try {
      final response = await _dio.get(UriApi.getMentorByID, queryParameters: params);
      log.info("Mentor by ID { status: ${response.statusCode} }");

      if (response.statusCode == 200)
        return compute(mentorObjectModelFromJson, json.encode(response.data));

    }catch(err) {
      log.warning(err.toString());
    }
    return null;
  }

  Future<List<MentorModel>> getListMentor() async {
    try {
      final response = await _dio.get(UriApi.getListMentorUri);
      log.info("List Mentor { status: ${response.statusCode} }");

      if (response.statusCode == 200)
        return compute(mentorModelFromJson, json.encode(response.data));
    } catch(err) {
      log.warning(err.toString());
    }
    return null;
  }
}