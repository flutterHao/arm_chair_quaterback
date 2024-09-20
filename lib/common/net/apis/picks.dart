import 'package:arm_chair_quaterback/common/entities/guess_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

///
///@auther gejiahui
///created at 2024/9/20/10:42

class PicksApi{
  static Future<GuessInfosEntity>  getGuessInfos() async{
    var json =  await httpUtil.post(Api.getGuessInfos);
    return GuessInfosEntity.fromJson(json);
  }

  static Future<NbaPlayerInfosEntity> getNBAPlayerInfo() async{
    var json = await httpUtil.post(Api.getNBAPlayerInfo);
    return NbaPlayerInfosEntity.fromJson(json);
  }

  static Future<NewsDefineEntity> getNewsDefine() async{
    var json = await httpUtil.get(Api.cNewsDefine);
    return NewsDefineEntity.fromJson(json);
  }

}