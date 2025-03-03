import 'package:arm_chair_quaterback/common/entities/inbox_email_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

class InboxApi {
  /// 查询邮件列表
  static Future<List<InboxEmailEntity>> getMailVOList() async {
    List json = await httpUtil.post(Api.getMailVOList);
    return json.map((e) => InboxEmailEntity.fromJson(e)).toList();
  }

  ///提取附件奖励
  static Future receiveMailAward(String mailIds) async {
    await httpUtil.post(Api.receiveMailAward, data: {"mailIds": mailIds});
  }

  ///阅读邮件
  static Future readMail(int mailId) async {
    await httpUtil.post(Api.readMail, data: {"mailId": mailId});
  }

  ///删除邮件
  static Future deleteMail(String mailIds) async {
    await httpUtil.post(Api.deleteMail, data: {"mailIds": mailIds});
  }
}
