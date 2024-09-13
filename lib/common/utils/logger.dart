import 'package:logger/logger.dart';

// lihonghao
// 2022/03/08
///日志打印
class Log {
  static const String _tag = "FTX";
  static final Logger _logger = Logger();

  static void i(String msg, {String tag = _tag}) {
    _logger.i("$tag :: $msg");
  }

  static void d(String msg, {String tag = _tag}) {
    _logger.d("$tag :: $msg");
  }

  static void e(String msg, {String tag = _tag}) {
    _logger.e("$tag :: $msg");
  }

  static void w(String msg, {String tag = _tag}) {
    _logger.w("$tag :: $msg");
  }

  static void wtf(String msg, {String tag = _tag}) {
    _logger.wtf("$tag :: $msg");
  }

  static void v(String msg, {String tag = _tag}) {
    _logger.v("$tag :: $msg");
  }

  // // Sample of abstract logging function
  // static void write(String text, {bool isError = false}) {
  //   Future.microtask(() => e('** $text. isError: [$isError]'));
  // }
}
