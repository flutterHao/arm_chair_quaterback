/*
 * @Description:
 * @Author: lihonghao
 * @Date: 2024-09-12 21:40:32
 * @LastEditTime: 2025-03-05 16:07:16
 */
import 'package:flutter/foundation.dart';

class Address {
  ///后台开发内网本机测试地址(-->应威)
  static const String personalDevUrl = 'http://192.168.12.46:9001';

  ///后台开发内网本机测试地址(-->余溪)
  // static const String personalDevUrl2 = 'http://192.168.12.74:9001';

  ///后台开发内网本机测试地址(-->胡川)
  static const String personalDevUrl3 = 'http://192.168.12.227:9001';

  ///外网测试地址
  // static const String publicDevUrl = 'http://172.18.3.137:7007';
  static const String publicDevUrl = 'http://seanba-te.ftxgame.com';

  ///海外外网测试地址
  static const String pubDevUrl = 'http://47.88.19.59:7007';

  ///内网测试地址
  static const String privateDevUrl = 'http://10.0.3.38:7007';

  static const String httpBaseUrl =
      ((kIsWeb && kProfileMode) || kDebugMode) ? privateDevUrl : publicDevUrl;

  // static const String httpBaseUrl = kReleaseMode ? privateDevUrl : personalDevUrl;

  ///后台开发内网本机测试地址(-->应威)
  static const String wsPersonalDevUrl = "ws://192.168.12.46:9003";

  ///后台开发内网本机测试地址(-->余溪)
  static const String wsPersonalDevUrl2 = 'ws://192.168.12.74:9001';

  ///后台开发内网本机测试地址(-->胡川)
  static const String wsPersonalDevUrl3 = 'ws://192.168.12.227:9003';

  static const String wsPublicDevUrl = 'ws://seanba-te.ftxgame.com:9003';

  ///海外外网测试地址
  static const String wsPubDevUrl = 'ws://47.88.19.59:9003';
  static const String wsPrivateDevUrl = 'ws://10.0.3.38:9005';

  static const String wsBaseUrl =
  ((kIsWeb && kProfileMode) || kDebugMode) ? wsPrivateDevUrl : wsPublicDevUrl;

  static const String imgBaseUrl =
      "https://seaball-1324211645.cos.ap-guangzhou.myqcloud.com/";
  static const String compressImgBaseUrl = "${imgBaseUrl}compressed/";
}
