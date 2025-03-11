/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:16:54
 * @LastEditTime: 2024-09-23 12:25:24
 */
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

// lihonghao
// 2022/03/08
///日志打印
class Log {
  static const String _tag = "FTX";
  static final Logger _logger = Logger();

  static void i(String msg, {String tag = _tag}) {
    if (kReleaseMode) return;
    _logger.i("$tag :: $msg");
  }

  static void d(String msg, {String tag = _tag}) {
    if (kReleaseMode) return;
    _logger.d("$tag :: $msg");
  }

  static void e(String msg, {String tag = _tag}) {
    if (kReleaseMode) return;
    _logger.e("$tag :: $msg");
  }

  static void w(String msg, {String tag = _tag}) {
    if (kReleaseMode) return;
    _logger.w("$tag :: $msg");
  }

  static void wtf(String msg, {String tag = _tag}) {
    if (kReleaseMode) return;
    _logger.wtf("$tag :: $msg");
  }

  static void v(String msg, {String tag = _tag}) {
    if (kReleaseMode) return;

    _logger.v("$tag :: $msg");
  }

  // // Sample of abstract logging function
  // static void write(String text, {bool isError = false}) {
  //   Future.microtask(() => e('** $text. isError: [$isError]'));
  // }
}
