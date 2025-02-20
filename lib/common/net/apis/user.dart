/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 16:52:11
 * @LastEditTime: 2024-12-30 11:54:00
 */
import 'package:arm_chair_quaterback/common/entities/user_entiry/team.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_login_info.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_prop_list.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/user_entiry.dart';
import 'package:arm_chair_quaterback/common/net/index.dart';

class UserApi {
  static Future<String> auth(
      {required String accountName, required int serviceId, required String userIp, required int id}) async {
    String data = await HttpUtil()
        .post(Api.authAccount, data: {"accountName": accountName, "serviceId": serviceId, "userIp": userIp, "id": id});
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

  static Future<TeamLoginInfo> getTeamLoginInfo() async {
    var data = await HttpUtil().post(Api.getTeamLoginInfo);
    return TeamLoginInfo.fromJson(data);
  }

  static Future<UserEntity> updateTeamInfo() async {
    await HttpUtil().post(Api.updateTeamInfo);
    return await visitorLogin();
  }

  static Future<List<TeamPropList>> getTeamProp({int propId = 0}) async {
    var list = await HttpUtil().post(Api.getTeamProp, data: {"propId": propId});
    return list.map<TeamPropList>((e) => TeamPropList.fromJson(e)).toList();
  }

  static Future<Team> likePlayer(String likes) async {
    var data = await HttpUtil().post(Api.likePlayer, data: {'type': 1, 'likes': likes});
    return Team.fromMap(data);
  }

  static Future<Team> cancelLikingPlayer(String likes) async {
    var data = await HttpUtil().post(Api.cancelLikingPlayer, data: {'type': 1, 'likes': likes});
    return Team.fromMap(data);
  }
}
