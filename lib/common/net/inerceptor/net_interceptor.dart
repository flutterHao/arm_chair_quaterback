import 'dart:convert';

import 'package:arm_chair_quaterback/common/net/base/error_entity.dart';
import 'package:arm_chair_quaterback/common/net/base/result_entity.dart';
import 'package:arm_chair_quaterback/common/store/user.dart';
import 'package:arm_chair_quaterback/common/utils/loading.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as getx;

///author ：lihonghao
/// date:2024/9/13
/// desc : 网络拦截
class NetInterceptor extends InterceptorsWrapper {
  static const other = 'unknown error';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // super.onRequest(options, handler);
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      options.headers.addAll(authorization);
    }
    // Do something before request is sent
    return handler.next(options); //continue
    // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    //
    // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // super.onResponse(response, handler);
    // Do something with response data
    // return handler.next(response); // continue

    //处理自己服务器业务逻辑的错误
    var responseData =
        response.data is String ? json.decode(response.data) : response.data;

    // 假设你的 Result.fromJson 可以处理 Map 类型的数据
    Result result = Result.fromJson(responseData);

    if (result.code == 200) {
      // 成功返回数据，将数据传递给下一步
      return handler.next(Response(
        requestOptions: response.requestOptions,
        data: result.data, // 将解析后的 data 部分返回
      ));
    } else {
      // 业务逻辑错误，处理错误并返回 DioException
      handlerError(ErrorEntity(code: result.code!, message: result.message!));
      return handler.reject(DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse, // 标记为服务器返回错误
        error: result.message, // 返回错误信息
      ));
    }

    // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // super.onError(err, handler);
    // Do something with response error
    Loading.dismiss();
    ErrorEntity eInfo = createErrorEntity(err);
    handlerError(eInfo);
    return handler.next(err); //continue
    // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
  }

  /// 读取本地配置Authorization
  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    if (getx.Get.isRegistered<UserStore>() && UserStore.to.hasToken == true) {
      headers['Authorization'] = 'Bearer ${UserStore.to.token}';
    }
    return headers;
  }

  // 错误处理
  void handlerError(ErrorEntity eInfo) {
    Log.e('error.code -> ${eInfo.code}, error.message -> ${eInfo.message}');
    EasyLoading.showError(eInfo.message);
  }

  // 错误信息
  ErrorEntity createErrorEntity(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ErrorEntity(code: -1, message: "connection exception");
      case DioExceptionType.sendTimeout:
        return ErrorEntity(code: -1, message: "Send Timeout");
      case DioExceptionType.receiveTimeout:
        return ErrorEntity(code: -1, message: "receive timeout");
      case DioExceptionType.cancel:
        return ErrorEntity(code: -1, message: "Cancel Connection");
      case DioExceptionType.badResponse:
        {
          try {
            int errCode =
                error.response != null ? error.response!.statusCode! : -1;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (errCode) {
              case 400:
                return ErrorEntity(
                    code: errCode, message: "Request syntax error");
              case 401:
                return ErrorEntity(code: errCode, message: "Unauthorized");
              case 403:
                return ErrorEntity(code: errCode, message: "Forbidden");
              case 404:
                return ErrorEntity(code: errCode, message: "Not Found");
              case 405:
                return ErrorEntity(
                    code: errCode, message: "Method Not Allowed");
              case 500:
                return ErrorEntity(
                    code: errCode, message: "Internal Server Error");
              case 502:
                return ErrorEntity(code: errCode, message: "Bad Gateway");
              case 503:
                return ErrorEntity(
                    code: errCode, message: "Service Unavailable");
              case 505:
                return ErrorEntity(
                    code: errCode, message: "HTTP Version Not Supported");
              default:
                {
                  return ErrorEntity(
                    code: errCode,
                    message: error.response != null
                        ? error.response!.statusMessage!
                        : "",
                  );
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: other);
          }
        }
      default:
        {
          return ErrorEntity(code: -1, message: error.message ?? other);
        }
    }
  }
}
