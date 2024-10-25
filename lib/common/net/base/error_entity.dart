/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 10:45:33
 * @LastEditTime: 2024-10-25 10:26:33
 */
// 异常处理
class ErrorEntity implements Exception {
  String? url;
  int code = -1;
  String message = "";
  ErrorEntity({this.url, required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, $message";
  }
}
