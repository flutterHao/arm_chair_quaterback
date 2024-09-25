/*
 * @Description:
 * @Author: lihonghao
 * @Date: 2024-09-12 21:40:32
 * @LastEditTime: 2024-09-24 15:03:26
 */
import 'package:flutter/foundation.dart';

class Address {
  ///后台开发内网本机测试地址(-->应威)
  static const String personalDevUrl = 'http://192.168.12.46:9001';

  ///外网测试地址
  static const String publicDevUrl = 'http://172.18.3.137:7007';

  ///内网测试地址
  static const String privateDevUrl = 'http://10.0.3.38:7007';

  static const String httpBaseUrl = personalDevUrl;

  // static const String httpBaseUrl = kReleaseMode ? privateDevUrl : personalDevUrl;
}
