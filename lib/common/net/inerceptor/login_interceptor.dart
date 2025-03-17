import 'dart:async';

import 'package:dio/dio.dart';

///
///@auther gejiahui
///created at 2025/3/17/11:44

class LoginInterceptor extends InterceptorsWrapper{
  Completer? _loginCompleter;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}