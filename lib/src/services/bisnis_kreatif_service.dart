import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/models/bisnis_kreatif_model.dart';
import 'package:online_university/src/utils/dio_logging_interceptors.dart';
import 'package:simple_logger/simple_logger.dart';

class BisnisKreatifService {
  final Dio _dio = new Dio();
  final clientId = 'online-university';
  final clientSecret = '12345';

  final log = SimpleLogger();

  BisnisKreatifService() {
    _dio.options.baseUrl = UriApi.dioAuthUri;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<List<BisnisKreatifModel>> getListBisnisKreatif(String nameCourse) async {
    var params = {
      "categoryCourseId": nameCourse
    };

    try {
      final response = await _dio.get(UriApi.getListDataTabs, queryParameters: params);
      log.info("List Course Tabs { status: ${response.statusCode} }");

      if (response.statusCode == 200)
        return compute(bisnisKreatifModelFromJson, json.encode(response.data));

    } catch(err) {
      log.warning(err.toString());
    }

    return null;
  }
}