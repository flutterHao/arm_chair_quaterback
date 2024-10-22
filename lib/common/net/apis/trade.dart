import 'package:arm_chair_quaterback/common/entities/trade_entity/trade_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

///
///@auther gejiahui
///created at 2024/10/19/10:45

class TradeApi {
  static Future<TradeInfoEntity> getTradeInfo() async {
    var json = await httpUtil.post(Api.getTradeInfo);
    return TradeInfoEntity.fromJson(json);
  }

  static Future<List<TradeInfoTradePlayers>> getAllTeamPlayerByTrend() async {
    List json = await httpUtil.post(Api.getAllTeamPlayerByTrend);
    return json.map((e) => TradeInfoTradePlayers.fromJson(e)).toList();
  }

  static Future sellPlayer(String uuid) async {
    var json = await httpUtil.post(Api.sellPlayer, data: {"uuid": uuid});
    return json;
  }

  static Future buyPlayer(int playerId) async {
    var json = await httpUtil.post(Api.buyPlayer, data: {"playerId": playerId});
    return json;
  }
}
