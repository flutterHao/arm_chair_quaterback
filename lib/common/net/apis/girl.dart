import 'package:arm_chair_quaterback/common/entities/giving_gifts_entity.dart';
import 'package:arm_chair_quaterback/common/entities/query_girls_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

class GirlApi {
  static Future<List<QueryGirlsEntity>> getQueryGirls() async {
    List json = await httpUtil.get(Api.getQueryGirls);
    return json.map((e) => QueryGirlsEntity.fromJson(e)).toList();
  }

  ///赠送礼物
  static Future<GivingGiftsEntity> getGivingGifts({
    required int girlId,
    required int giftId,
    int num = 1,
  }) async {
    var json = await httpUtil.post(Api.getGivingGifts, data: {"girlId": girlId, "giftId": giftId, 'num': num});
    return GivingGiftsEntity.fromJson(json);
  }
}
