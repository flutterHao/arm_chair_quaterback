/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 16:52:11
 * @LastEditTime: 2024-09-25 14:44:04
 */
import 'package:arm_chair_quaterback/common/entities/user_entity/user_entiry.dart';
import 'package:arm_chair_quaterback/common/net/index.dart';

class UserApi {
  static Future<String> auth(
      {required String accountName,
      required int serviceId,
      required String userIp,
      required int id}) async {
    String data = await HttpUtil().post(Api.authAccount, data: {
      "accountName": accountName,
      "serviceId": serviceId,
      "userIp": userIp,
      "id": id
    });
    return data;
  }

  static Future<UserEntity> login() async {
    var data = await HttpUtil().post(Api.login);
    return UserEntity.fromJson(data);
  }

  static Future<UserEntity> visitorLogin() async {
    var data = await HttpUtil().post(Api.visitorLogin);
    return UserEntity.fromJson(data);
  }
}
