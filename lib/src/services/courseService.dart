import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/models/courseDetailsModel.dart';
import 'package:online_university/src/models/courseModel.dart';
import 'package:online_university/src/models/mentorModel.dart';
import 'package:simple_logger/simple_logger.dart';

class CourseService {

  Map<String, String> headers = {
    'Authorization': 'Basic b25saW5lLXVuaXZlcnNpdHk6MTIzNDU='
  };

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
      final response = await client.get(UriApi.getDetailsCourseTabs + idCourse);
      log.info("Course Details { status : ${response.statusCode} } ");

      if (response.statusCode == 200) {
        return compute(courseDetailsModelFromJson, response.body);
      }
    } catch(err) {
      log.warning(err.toString());
    }
    return null;
  }

  Future<List<CourseModel>> getCourseOwned() async {
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