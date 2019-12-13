import 'dart:convert';

import 'package:http/http.dart';
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/utils/shared_preferences_helper.dart';
import 'package:simple_logger/simple_logger.dart';

class CheckoutService {
  Client client = new Client();
  final log = SimpleLogger();

  Future<Response> checkoutCourse(Checkout value) async {
    var token = await SharedPreferencesHelper.getAccessToken();

    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    Map body = {
      'idCourse': value.idCourse,
      'paymentTotal': value.paymentTotal,
      'paymentMethode': value.paymentMethode,
    };

    try {
      final response = await client.post(UriApi.checkOutCourse,
          headers: headers, body: json.encode(body));

      if (response.statusCode == 201) return response;
    } catch (err) {
      log.warning(err.toString());
    }
    return null;
  }
}

class Checkout {
  final String idCourse;
  final String paymentTotal;
  final String paymentMethode;

  Checkout({this.idCourse, this.paymentTotal, this.paymentMethode});
}
