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

  /// 获取总赔率
  String getBetCount() {
    int len = data.length;
    //todo 未实现功能，需要完成
    // var value = len == 0
    //     ? "0"
    //     : len == 1
    //         ? newsDefineEntity.betOdds
    //         : (pow(double.parse(newsDefineEntity.betOdds), len) *
    //                 double.parse(newsDefineEntity.betMutOdds))
    //             .toStringAsFixed(1);
    // return value;
    return "2";
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
    return MyDateUtils.formatDate(
        MyDateUtils.getDateTimeByMs(data[0].reciveAwardInfo.createTime),
        format: DateFormats.H_M);
  }

  /// 获取奖励
  getGuessAward() {
    print('getGuessAward-------');
    PicksApi.getGuessAward(data.length==1?data[0].reciveAwardInfo.id:data[0].reciveAwardInfo.scId).then((result) {
      List<PicksPlayer> tempData = [];
      for (int i = 0; i < data.length; i++) {
        var item = data[i];
        item.reciveAwardInfo.guessData[0].status = 3;
        tempData.add(item);
      }
      data = tempData;
      update([idReciveAwardItem]);
    });
  }

  String get idReciveAwardItem => "recive_award_item";
}
