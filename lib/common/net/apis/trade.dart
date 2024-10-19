import 'package:arm_chair_quaterback/common/entities/trade_entity/trade_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

///
///@auther gejiahui
///created at 2024/10/19/10:45

class TradeApi{

  static Future<TradeInfoEntity> getTradeInfo() async{
    var json = await httpUtil.post(Api.getTradeInfo);
    return TradeInfoEntity.fromJson(json);
  }

}