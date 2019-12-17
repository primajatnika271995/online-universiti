import 'package:dio/dio.dart';
import 'package:online_university/src/config/url.dart';
import 'package:online_university/src/utils/dio_logging_interceptors.dart';
import 'package:simple_logger/simple_logger.dart';

class CheckoutService {
  final Dio _dio = new Dio();
  final clientId = 'online-university';
  final clientSecret = '12345';

  final log = SimpleLogger();

  CheckoutService() {
    _dio.options.baseUrl = UriApi.dioAuthUri;
    _dio.interceptors.add(DioLoggingInterceptors(_dio));
  }

  Future<Response> checkoutCourse(Checkout value) async {

    try {
      final response = await _dio.post(
        UriApi.checkOutCourse,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'idCourse': value.idCourse,
          'paymentTotal': value.paymentTotal,
          'paymentMethode': value.paymentMethode,
        }
      );

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
