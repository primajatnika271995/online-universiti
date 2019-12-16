import 'package:dio/dio.dart';
import 'package:online_university/src/injector/injector.dart';
import 'package:online_university/src/utils/shared_preferences_helper.dart';
import 'package:online_university/src/views/component/log.dart';

class DioLoggingInterceptors extends InterceptorsWrapper {
  final Dio _dio;
  final SharedPreferencesHelper _sharedPreferencesHelper = locator<SharedPreferencesHelper>();

  DioLoggingInterceptors(this._dio);

  @override
  Future onRequest(RequestOptions options) async {
    log.info("--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    log.info("Headers:");

    options.headers.forEach((k, v) => log.info('$k: $v'));
    if (options.queryParameters != null) {
      log.info("queryParameters:");
      options.queryParameters.forEach((k, v) => log.info('$k: $v'));
    }
    if (options.data != null) {
      log.info("Body: ${options.data}");
    }
    log.info("--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    if (options.headers.containsKey('requiresToken')) {
      options.headers.remove('requiresToken');
      log.info('accessToken: ${_sharedPreferencesHelper.getString(SharedPreferencesHelper.kAccessToken)}');

      String accessToken = _sharedPreferencesHelper.getString(SharedPreferencesHelper.kAccessToken);
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    // TODO: implement onRequest
    return options;
  }

  @override
  Future onResponse(Response response) {
    log.info("<-- ${response.statusCode} ${(response.request != null ? (response.request.baseUrl + response.request.path) : 'URL')}");

    log.info("Headers:");
    response.headers?.forEach((k, v) => log.info('$k: $v'));
    log.info("Response: ${response.data}");
    log.info("<-- END HTTP");

    // TODO: implement onResponse
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    log.info("<-- ${err.message} ${(err.response?.request != null ? (err.response.request.baseUrl + err.response.request.path) : 'URL')}");
    log.info("${err.response != null ? err.response.data : 'Unknown Error'}");
    log.info("<-- End Error");

    int responseCode = err.response.statusCode;
    String oldAccessToken = _sharedPreferencesHelper.getString(SharedPreferencesHelper.kAccessToken);
    if (oldAccessToken != null && responseCode == 401 && _sharedPreferencesHelper != null) {
      _dio.interceptors.requestLock.lock();
      _dio.interceptors.responseLock.lock();

      RequestOptions options = err.response.request;
      options.headers.addAll({'requiresToken': true});
      _dio.interceptors.requestLock.unlock();
      _dio.interceptors.responseLock.unlock();
      return _dio.request(options.path, options: options);
    }
    // TODO: implement onError
    return super.onError(err);
  }
}