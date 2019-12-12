import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:online_university/src/config/local_storage.dart';
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/models/transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_logger/simple_logger.dart';

class TransactionService {
  Client client = new Client();
  final log = SimpleLogger();

  Future<List<TransactionModel>> getTransaction(String status) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString(LocalStorage.ACCESS_TOKEN_KEY);

    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    var params = {
      'status': status,
    };

    try {
      Uri uri = Uri.parse(UriApi.getTransactionHistory);
      final uriParams = uri.replace(queryParameters: params);
      final response = await client.get(uriParams, headers: headers);
      log.info("Transaction History { status : ${response.statusCode} }");

      if (response.statusCode == 200)
        return compute(transactionModelFromJson, response.body);

    } catch(err) {
      log.warning(err.toString());
    }
    return null;
  }
}