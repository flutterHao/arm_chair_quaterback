import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_v2_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/31/17:40

class GuessHistoryItemController extends GetxController {
  GuessHistoryItemController(this.guessInfo);

  final ReciveAwardV2GuessInfo guessInfo;
  GlobalKey globalKey = GlobalKey();

  late PicksDefineEntity picksDefineEntity;

  @override
  void onInit() {
    super.onInit();
    picksDefineEntity = CacheApi.pickDefine!;
  }

  /// 获取竞猜模式
  String getTypeString() {
    return guessInfo.type == 1
        ? "Flex"
        : guessInfo.type == 2
            ? "Power"
            : "";
  }

  /// 获取总赔率
  double getBetCount() {
    List<double> bets = guessInfo.type == 1
        ? CacheApi.pickDefine!.toJson()["flexBet${guessInfo.guessData.length}"]
        : guessInfo.type == 2
            ? CacheApi.pickDefine!.powerBetWin
            : [];
    if (guessInfo.status == 1) {
      if (guessInfo.type == 1) {
        return bets.last;
      } else {
        var index = guessInfo.guessData.length - 1;
        return bets[index];
      }
    } else {
      if (guessInfo.type == 1) {
        //flex
        var winCount = getWinCount();
        var loseCount = guessInfo.guessData.length - winCount;
        var index = bets.length - 1 - loseCount;
        if (index >= 0) {
          return bets[index];
        }
      } else {
        //power
        var index = guessInfo.guessData.length - 1;
        return bets[index];
      }
    }
    return 0;
  }

  /// 获取flex赢的场数
  int getWinCount() {
    return guessInfo.guessData.where((e) => e.success).toList().length;
  }

  /// 获取赢的筹码数量
  double getWinCoin() {
    return getBetCount() * double.parse(picksDefineEntity.betCost);
  }
}
