import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/models/transaction_model.dart';
import 'package:online_university/src/utils/shared_preferences_helper.dart';
import 'package:simple_logger/simple_logger.dart';

class TransactionService {
  final Dio _dio = new Dio();
  final clientId = 'online-university';
  final clientSecret = '12345';

  final log = SimpleLogger();

  Future<List<TransactionModel>> getTransaction(String status) async {
    var token = await SharedPreferencesHelper.getAccessToken();

    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    var params = {
      'status': status,
    };

    try {
      final response = await _dio.get(
        UriApi.getTransactionHistory,
        queryParameters: params,
        options: Options(
          headers: {
            'Authorization':
                'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}'
          },
        ),
      );
      log.info("Transaction History { status : ${response.statusCode} }");

      if (response.statusCode == 200)
        return compute(transactionModelFromJson, json.encode(response.data));
    } catch (err) {
      log.warning(err.toString());
    }
    return null;
  }
}
