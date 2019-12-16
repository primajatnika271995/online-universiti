import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/models/course_details_model.dart';
import 'package:online_university/src/models/course_model.dart';
import 'package:online_university/src/utils/dio_logging_interceptors.dart';
import 'package:online_university/src/utils/shared_preferences_helper.dart';
import 'package:simple_logger/simple_logger.dart';

class CourseService {

  final Dio _dio = new Dio();

  CourseService() {
    _dio.options.baseUrl = UriApi.dioAuthUri;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Client client = new Client();
  final log = SimpleLogger();

  Future<List<CourseModel>> getCourseByIdMentor(String idMentor) async {
    var params = {
      "idMentorProfile": idMentor,
    };

    try {
      Uri uri = Uri.parse(UriApi.getListCourseByIDMentor);
      final uriParams = uri.replace(queryParameters: params);
      final response = await client.get(uriParams);
      log.info("Course by ID Mentor { status : ${response.statusCode} }");

      if (response.statusCode == 200) {
        return compute(courseModelFromJson, response.body);
      }
    } catch(err) {
      log.warning(err.toString());
    }
    return null;
  }

  Future<CourseDetailsModel> getCourseDetailTabs(String idCourse) async {
    try {
      final response = await _dio.get(UriApi.getDetailsCourseTabs + idCourse);
      log.info("Course Details { status : ${response.statusCode} } ");

      if (response.statusCode == 200) {
        return compute(courseDetailsModelFromJson, json.encode(response.data));
      }
    } catch(err) {
      log.warning(err.toString());
    }
    return null;
  }

  Future<List<CourseModel>> getCourseOwned() async {
    var token = await SharedPreferencesHelper.getAccessToken();

    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await client.get(UriApi.getListCourseOwned, headers: headers);
      log.info("Course Owned { status : ${response.statusCode} }");

      if (response.statusCode == 200) {
        return compute(courseModelFromJson, response.body);
      }
    } catch(err) {
      log.warning(err.toString());
    }
    return null;
  }

}