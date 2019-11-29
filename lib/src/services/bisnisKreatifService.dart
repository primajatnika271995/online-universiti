import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/models/bisnisKreatifModel.dart';
import 'package:simple_logger/simple_logger.dart';

class BisnisKreatifService {

  Map<String, String> headers = {
    'Authorization': 'Basic b25saW5lLXVuaXZlcnNpdHk6MTIzNDU='
  };

  Client client = new Client();
  final log = SimpleLogger();

  Future<List<BisnisKreatifModel>> getListBisnisKreatif(String nameCourse) async {

    var params = {
      "categoryCourseId": nameCourse
    };

    try {
      Uri uri = Uri.parse(UriApi.getListDataTabs);
      final uriParams = uri.replace(queryParameters: params);
      final response = await client.get(uriParams);

      log.info("List Course Tabs { status: ${response.statusCode} }");

      if (response.statusCode == 200)
        return compute(bisnisKreatifModelFromJson, response.body);

    } catch(err) {
      log.warning(err.toString());
    }

    return null;
  }
}