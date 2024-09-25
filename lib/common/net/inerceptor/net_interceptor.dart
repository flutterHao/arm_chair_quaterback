// import 'dart:convert';

// import 'package:arm_chair_quaterback/common/net/apis/user.dart';
// import 'package:arm_chair_quaterback/common/net/base/error_entity.dart';
// import 'package:arm_chair_quaterback/common/net/base/result_entity.dart';
// import 'package:arm_chair_quaterback/common/store/user.dart';
// import 'package:arm_chair_quaterback/common/utils/loading.dart';
// import 'package:arm_chair_quaterback/common/utils/logger.dart';
// import 'package:arm_chair_quaterback/pages/home/index.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart' as getx;

// ///author ：lihonghao
// /// date:2024/9/13
// /// desc : 网络拦截
// class NetInterceptor extends InterceptorsWrapper {
//   static const other = 'unknown error';

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // super.onRequest(options, handler);
//     Map<String, dynamic>? authorization = getAuthorizationHeader();
//     if (authorization != null) {
//       options.headers.addAll(authorization);
//     }
//     // Do something before request is sent
//     return handler.next(options); //continue
//     // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
//     // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
//     //
//     // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
//     // 这样请求将被中止并触发异常，上层catchError会被调用。
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // super.onResponse(response, handler);
//     // Do something with response data
//     // return handler.next(response); // continue

//     //处理自己服务器业务逻辑的错误
//     dynamic responseData =
//         response.data is String ? json.decode(response.data) : response.data;

//     if (responseData is Map<String, dynamic>) {
//       Result result = Result.fromJson(responseData);
//       if (result.code == 200) {
//         // 成功返回数据，将数据传递给下一步
//         return handler.next(Response(
//           requestOptions: response.requestOptions,
//           data: result.data, // 将解析后的 data 部分返回
//         ));
//       } else if (result.code != null) {
//         // 业务逻辑错误，处理错误并返回 DioException
//         handlerError(ErrorEntity(code: result.code!, message: result.message!));
//         return handler.reject(DioException(
//           requestOptions: response.requestOptions,
//           response: response,
//           type: DioExceptionType.badResponse, // 标记为服务器返回错误
//           error: result.message, // 返回错误信息
//         ));
//       } else {
//         //Map 文件格式
//         return handler.next(Response(
//           requestOptions: response.requestOptions,
//           data: responseData, // 将解析后的 data 部分返回
//         ));
//       }
//     } else {
//       //list json 文件格式
//       return handler.next(Response(
//         requestOptions: response.requestOptions,
//         data: responseData, // 将解析后的 data 部分返回
//       ));
//     }

//     // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
//     // 这样请求将被中止并触发异常，上层catchError会被调用。
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     // super.onError(err, handler);
//     // Do something with response error
//     Loading.dismiss();
//     ErrorEntity eInfo = createErrorEntity(err);
//     handlerError(eInfo);
//     return handler.next(err); //continue
//     // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
//     // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
//   }

//   /// 读取本地配置Authorization
//   Map<String, dynamic>? getAuthorizationHeader() {
//     var headers = <String, dynamic>{};
//     if (getx.Get.isRegistered<UserStore>() && UserStore.to.hasToken == true) {
//       headers['Authorization'] = UserStore.to.token;
//     }
//     return headers;
//   }

//   // 错误处理
//   void handlerError(ErrorEntity eInfo) {
//     if (eInfo.code != 401) {
//       Log.e('error.code -> ${eInfo.code}, error.message -> ${eInfo.message}');
//       EasyLoading.showError(eInfo.message);
//     }
//   }

//   // 错误信息
//   ErrorEntity createErrorEntity(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//         return ErrorEntity(code: -1, message: "connection exception");
//       case DioExceptionType.sendTimeout:
//         return ErrorEntity(code: -1, message: "Send Timeout");
//       case DioExceptionType.receiveTimeout:
//         return ErrorEntity(code: -1, message: "receive timeout");
//       case DioExceptionType.cancel:
//         return ErrorEntity(code: -1, message: "Cancel Connection");
//       case DioExceptionType.badResponse:
//         {
//           try {
//             int errCode =
//                 error.response != null ? error.response!.statusCode! : -1;
//             // String errMsg = error.response.statusMessage;
//             // return ErrorEntity(code: errCode, message: errMsg);
//             switch (errCode) {
//               case 400:
//                 return ErrorEntity(
//                     code: errCode, message: "Request syntax error");
//               case 401:
//                 HomeController.to.login();
//                 return ErrorEntity(code: errCode, message: "Unauthorized");
//               case 403:
//                 return ErrorEntity(code: errCode, message: "Forbidden");
//               case 404:
//                 return ErrorEntity(code: errCode, message: "Not Found");
//               case 405:
//                 return ErrorEntity(
//                     code: errCode, message: "Method Not Allowed");
//               case 500:
//                 return ErrorEntity(
//                     code: errCode, message: "Internal Server Error");
//               case 502:
//                 return ErrorEntity(code: errCode, message: "Bad Gateway");
//               case 503:
//                 return ErrorEntity(
//                     code: errCode, message: "Service Unavailable");
//               case 505:
//                 return ErrorEntity(
//                     code: errCode, message: "HTTP Version Not Supported");
//               default:
//                 {
//                   return ErrorEntity(
//                     code: errCode,
//                     message: error.response != null
//                         ? error.response!.statusMessage!
//                         : "",
//                   );
//                 }
//             }
//           } on Exception catch (_) {
//             return ErrorEntity(code: -1, message: other);
//           }
//         }
//       default:
//         {
//           return ErrorEntity(code: -1, message: error.message ?? other);
//         }
//     }
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:arm_chair_quaterback/common/net/base/error_entity.dart';
import 'package:arm_chair_quaterback/common/net/base/result_entity.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';
import 'package:arm_chair_quaterback/common/store/user.dart';
import 'package:arm_chair_quaterback/common/utils/loading.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/home/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as getx;

class NetInterceptor extends InterceptorsWrapper {
  static const other = 'unknown error';
  Completer<void>? _refreshCompleter;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 在每个请求中添加 token
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      options.headers.addAll(authorization);
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    dynamic responseData =
        response.data is String ? json.decode(response.data) : response.data;

    if (responseData is Map<String, dynamic>) {
      Result result = Result.fromJson(responseData);
      if (result.code == 200) {
        // 成功返回数据，将数据传递给下一步
        handler.next(Response(
          requestOptions: response.requestOptions,
          data: result.data, // 将解析后的 data 部分返回
        ));
      } else if (result.code != null) {
        handlerError(
            ErrorEntity(code: result.code!, message: result.message ?? ""));
        // 业务逻辑错误，处理错误并返回 DioException
        if (result.code == 401) {
          // 捕获业务逻辑返回的 401 错误
          await _handle401Error(response.requestOptions, handler);
        } else {
          // await _retryOnError(response.requestOptions, handler);
          handlerError(
              ErrorEntity(code: result.code!, message: result.message ?? ""));
          return handler.reject(DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse, // 标记为服务器返回错误
            error: result.message, // 返回错误信息
          ));
        }
      } else {
        //Map json文件格式
        handler.next(Response(
          requestOptions: response.requestOptions,
          data: responseData, // 将解析后的 data 部分返回
        ));
      }
    } else {
      //list json 文件格式
      handler.next(Response(
        requestOptions: response.requestOptions,
        data: responseData, // 将解析后的 data 部分返回
      ));
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    Loading.dismiss();

    ErrorEntity eInfo = createErrorEntity(err);
    handlerError(eInfo);
    handler.next(err);
  }

  Future<void> _retryOnError(
      RequestOptions requestOptions, ResponseInterceptorHandler handler) async {
    const maxRetryAttempts = 3;
    var retryCount = 0;

    while (retryCount < maxRetryAttempts) {
      try {
        Log.e("${requestOptions.uri} 开始重试，第 $retryCount 次");

        // 标记重试请求，防止重复进入 onResponse
        final options = requestOptions.copyWith(
          extra: {'isRetry': true}, // 添加标记
        );

        // 重试请求
        final response = await HttpUtil().dio.fetch(options);

        // 手动检查状态码，如果不是成功状态码，抛出异常
        if (response.statusCode != 200) {
          throw DioException(
            requestOptions: options,
            response: response,
            type: DioExceptionType.badResponse,
            error: '服务器返回错误状态码: ${response.statusCode}',
          );
        }

        handler.resolve(response);
        return;
      } catch (e) {
        retryCount++;

        // 达到最大重试次数
        if (retryCount >= maxRetryAttempts) {
          Log.e("${requestOptions.uri} 请求失败，达到最大重试次数");
          handler.reject(DioException(
            requestOptions: requestOptions,
            type: DioExceptionType.connectionError,
            error: '请求失败，达到最大重试次数',
          ));
          return;
        }

        Log.e("${requestOptions.uri} 重试失败，第 $retryCount 次，错误: $e");
      }
    }
  }

  Future<void> _handle401Error(
      RequestOptions requestOptions, ResponseInterceptorHandler handler) async {
    String uri = requestOptions.uri.toString();
    Log.e("$uri捕获到 401 错误 当前token=${UserStore.to.token}，,开始处理 token 刷新");

    if (_refreshCompleter != null) {
      // 如果正在刷新 token，等待刷新完成
      await _refreshCompleter!.future;
    } else {
      // 开始刷新 token
      _refreshCompleter = Completer<void>();
      try {
        await _refreshToken(); // 刷新 token 方法
        _refreshCompleter!.complete(); // 刷新成功
      } catch (e) {
        _refreshCompleter!.completeError(e); // 刷新失败
        handlerError(ErrorEntity(code: 401, message: 'Token 刷新失败'));
        return handler.reject(DioException(
          requestOptions: requestOptions,
          type: DioExceptionType.badResponse,
          error: 'Token 刷新失败',
        ));
      } finally {
        _refreshCompleter = null;
      }
    }

    // 刷新 token 成功后，重新发送请求
    try {
      Log.d("开始重新发送请求${requestOptions.uri}");
      final newOptions = requestOptions;
      newOptions.headers['Authorization'] = UserStore.to.token; // 更新 token
      // final response = await Dio().fetch(newOptions);
      final response = await HttpUtil().dio.fetch(newOptions);
      handler.resolve(response); // 返回新请求的结果
    } catch (e) {
      handler.reject(e as DioException);
    }
  }

  /// 刷新 token 的逻辑
  Future<void> _refreshToken() async {
    await HomeController.to.login(); // 假设刷新 token 逻辑在 login 方法中
  }

  /// 读取本地配置 Authorization
  Map<String, dynamic>? getAuthorizationHeader() {
    // Log.d("token是否存在 ${UserStore.to.hasToken}");
    var headers = <String, dynamic>{};
    // if (getx.Get.isRegistered<UserStore>() && UserStore.to.hasToken == true) {
    if (UserStore.to.hasToken == true) {
      // Log.d("添加请求头token");
      headers['Authorization'] = UserStore.to.token;
    }
    return headers;
  }

  /// 错误处理
  void handlerError(ErrorEntity eInfo) {
    Log.e('error.code -> ${eInfo.code}, error.message -> ${eInfo.message}');

    ///TODO
    // if (eInfo.code != 401) {
    //   EasyLoading.showError(eInfo.message);
    // }
  }

  /// 错误信息
  ErrorEntity createErrorEntity(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ErrorEntity(code: -1, message: "Connection exception");
      case DioExceptionType.sendTimeout:
        return ErrorEntity(code: -1, message: "Send Timeout");
      case DioExceptionType.receiveTimeout:
        return ErrorEntity(code: -1, message: "Receive timeout");
      case DioExceptionType.cancel:
        return ErrorEntity(code: -1, message: "Cancel Connection");
      case DioExceptionType.badResponse:
        {
          int errCode = error.response?.statusCode ?? -1;
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
            case 500:
              return ErrorEntity(
                  code: errCode, message: "Internal Server Error");
            default:
              return ErrorEntity(
                code: errCode,
                message: error.response?.statusMessage ?? "",
              );
          }
        }
      default:
        return ErrorEntity(code: -1, message: error.message ?? other);
    }
  }
}
