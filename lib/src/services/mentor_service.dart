import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/models/mentor_model.dart';
import 'package:simple_logger/simple_logger.dart';

class MentorService {

  Map<String, String> headers = {
    'Authorization': 'Basic b25saW5lLXVuaXZlcnNpdHk6MTIzNDU='
  };

  Client client = new Client();
  final log = SimpleLogger();

  Future<MentorModel> getMentorByID(String idUser) async {
    var params = {
      "idUserProfile": idUser
    };

    try {
      Uri uri = Uri.parse(UriApi.getMentorByID);
      final uriParams = uri.replace(queryParameters: params);
      final response = await client.get(uriParams);
      log.info("Mentor by ID { status: ${response.statusCode} }");

      if (response.statusCode == 200)
        return compute(mentorObjectModelFromJson, response.body);

    }catch(err) {
      log.warning(err.toString());
    }
    return null;
  }

  Future<List<MentorModel>> getListMentor() async {
    try {
      final response = await client.get(UriApi.getListMentorUri);
      log.info("List Mentor { status: ${response.statusCode} }");

      if (response.statusCode == 200)
        return compute(mentorModelFromJson, response.body);
      else
        return null;

    } catch(err) {
      log.warning(err.toString());
    }
    return null;
  }
}