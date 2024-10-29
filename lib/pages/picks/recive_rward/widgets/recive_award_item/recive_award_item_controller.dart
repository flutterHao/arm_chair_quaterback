import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/23/18:47

class ReciveAwardItemController extends GetxController {
  ReciveAwardItemController(this.data, this.newsDefineEntity);

  List<PicksPlayer> data;

  final NewsDefineEntity newsDefineEntity;

  int getWinCount() {
    return data[0]
        .reciveAwardInfo
        .guessData
        .where((e) => e.success)
        .toList()
        .length;
  }

  /// 获取总赔率
  String getBetCount() {
    List<double> bets = data[0].reciveAwardInfo.type == 1
        ? newsDefineEntity.toJson()["flexBet${data.length}"]
        : data[0].reciveAwardInfo.type == 2
            ? newsDefineEntity.powerBetWin
            : [];
    var winCount = getWinCount();
    if(data[0].reciveAwardInfo.type == 1) {
      var start = data.length - bets.length;
      var temps = List.generate(data.length, (index) => -1.0).toList();
      temps.replaceRange(start, winCount, bets);
      return temps[winCount - 1].toString();
    }else{
      return bets[winCount-2].toString();
    }
  }

  String getTypeString() {
    return data[0].reciveAwardInfo.type == 1
        ? "Flex play"
        : data[0].reciveAwardInfo.type == 2
            ? "Power play"
            : "";
  }

  ///  int STATUS_未结算 = 1;
  ///  int STATUS_已结算未领取奖励 = 2;
  ///  int STATUS_已结算已领取奖励 = 3;.
  int getStatus() {
    return data[0].reciveAwardInfo.status;
  }

  /// 获取消耗金币数
  String getCostCount() {
    int len = data.length;
    var costCount =
        double.parse((len * double.parse(newsDefineEntity.betCost)).toString())
            .toStringAsFixed(1);
    return costCount;
  }

  /// 获取总收益
  String? getAwardCoin() {
    double count = -1;
    for (int i = 0; i < data.length; i++) {
      var item = data[i];
      if (item.reciveAwardInfo.guessData[0].status > 1) {
        if (item.reciveAwardInfo.guessData[0].awards.isNotEmpty) {
          var award = item.reciveAwardInfo.guessData[0].awards[0];
          count += award.num;
        }
      }
    }
    return count == -1 ? null : count.toStringAsFixed(0);
  }

  String getTime() {
    var dateTime =
        MyDateUtils.getDateTimeByMs(data[0].reciveAwardInfo.createTime);
    return "${MyDateUtils.getWeekday(dateTime, short: true)},${MyDateUtils.getMonthEnName(dateTime, short: false)} ${dateTime.day},${dateTime.year}";
  }

  /// 获取奖励
  getGuessAward() {
    print('getGuessAward-------');
    PicksApi.getGuessAward(data[0].reciveAwardInfo.id).then((result) {
      List<PicksPlayer> tempData = [];
      for (int i = 0; i < data.length; i++) {
        var item = data[i];
        item.reciveAwardInfo.status = 3;
        tempData.add(item);
      }
      data = tempData;
      update([idReciveAwardItem]);
    });
  }

  String get idReciveAwardItem => "recive_award_item";
}
