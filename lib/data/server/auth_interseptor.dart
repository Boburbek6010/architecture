import 'package:architecture/data/tools/log_service.dart';
import 'package:dio/dio.dart';

import '../storage/auth/auth_holder.dart';

class AuthInterceptor extends InterceptorsWrapper {
  final AuthHolder _authData;

  AuthInterceptor(this._authData);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (_authData.authToken.isNotEmpty == true) {
      options.headers['Authorization'] = 'Bearer ${_authData.authToken}';
    }
    LogService.o("Data in interceptor${options.data}");
    LogService.o("Extra in interceptor${options.extra}");
    LogService.o("QueryParams in interceptor${options.queryParameters}");
    LogService.o("content in interceptor${options.contentType}");
    LogService.o("headers in interceptor${options.headers}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    LogService.o("Response in interceptor ${handler.toString()} : $response");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    LogService.o(
        "Error in interceptor ${handler.toString()} : ${err.requestOptions}");
    super.onError(err, handler);
  }
}