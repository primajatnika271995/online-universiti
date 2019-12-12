import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/models/materi_model.dart';
import 'package:simple_logger/simple_logger.dart';

class MateriService {
  Map<String, String> headers = {
    'Authorization': 'Basic b25saW5lLXVuaXZlcnNpdHk6MTIzNDU='
  };

  Client client = new Client();
  final log = SimpleLogger();

  Future<List<MateriModel>> getListMateri(String idCourse) async {

    var params = {
      "idCourse": idCourse,
    };

    try {
      Uri uri = Uri.parse(UriApi.getListMateriCourse);
      final uriParams = uri.replace(queryParameters: params);
      final response = await client.get(uriParams);
      log.info("Materi by ID Mentor { status : ${response.statusCode} } ");

      if (response.statusCode == 200)
        return compute(materiModelFromJson, response.body);
    } catch(err) {
      log.warning(err.toString());
    }
    return null;
  }
}