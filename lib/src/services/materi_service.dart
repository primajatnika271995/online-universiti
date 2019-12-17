import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/models/materi_model.dart';
import 'package:online_university/src/utils/dio_logging_interceptors.dart';
import 'package:simple_logger/simple_logger.dart';

class MateriService {
  final Dio _dio = new Dio();
  final clientId = 'online-university';
  final clientSecret = '12345';

  final log = SimpleLogger();

  MateriService() {
    _dio.options.baseUrl = UriApi.dioAuthUri;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<List<MateriModel>> getListMateri(String idCourse) async {
    var params = {
      "idCourse": idCourse,
    };

    try {
      final response = await _dio.get(UriApi.getListMateriCourse, queryParameters: params);
      log.info("Materi by ID Mentor { status : ${response.statusCode} } ");

      if (response.statusCode == 200)
        return compute(materiModelFromJson, json.encode(response.data));
    } catch(err) {
      log.warning(err.toString());
    }
    return null;
  }
}