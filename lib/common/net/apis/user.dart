/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 16:52:11
 * @LastEditTime: 2024-09-13 17:46:36
 */
import 'package:arm_chair_quaterback/common/net/index.dart';

class UserApi {
  static Future<String> auth(
      {String accountName = "w001",
      int serviceId = 0,
      String userIp = "192.168.12.46",
      int id = 7}) async {
    Map data = await HttpUtil().post(Api.authAccount, data: {
      "accountName": accountName,
      "serviceId": serviceId,
      "userIp": userIp,
      "id": id
    });
    return data["token"];
  }
}
