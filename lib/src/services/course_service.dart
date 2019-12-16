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
  final clientId = 'online-university';
  final clientSecret = '12345';

  final log = SimpleLogger();

  CourseService() {
    _dio.options.baseUrl = UriApi.dioAuthUri;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<List<CourseModel>> getCourseByIdMentor(String idMentor) async {
    var params = {
      "idMentorProfile": idMentor,
    };

    try {
      final response = await _dio.get(UriApi.getListCourseByIDMentor, queryParameters: params);
      log.info("Course by ID Mentor { status : ${response.statusCode} }");

      if (response.statusCode == 200) {
        return compute(courseModelFromJson, json.encode(response.data));
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
    try {
      final response = await _dio.get(UriApi.getListCourseOwned,);
      log.info("Course Owned { status : ${response.statusCode} }");

      if (response.statusCode == 200) {
        return compute(courseModelFromJson, json.encode(response.data));
      }
    } catch(err) {
      log.warning(err.toString());
    }
    return null;
  }

}