import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
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

  List<ReciveAwardEntity> data;

  final NewsDefineEntity newsDefineEntity;

  /// 获取总赔率
  String getBetCount() {
    int len = data.length;
    var value = len == 0
        ? "0"
        : len == 1
            ? newsDefineEntity!.betOdds
            : (pow(double.parse(newsDefineEntity!.betOdds), len) *
                    double.parse(newsDefineEntity!.betMutOdds))
                .toStringAsFixed(1);
    return value;
  }

  /// 获取总收益
  String? getAwardCoin() {
    double count = -1;
    for (int i = 0; i < data.length; i++) {
      var item = data[i];
      if (item.guessData[0].status > 1) {
        var award = item.guessData[0].awards[0];
        count += award.num;
      }
    }
    return count == -1 ? null : count.toStringAsFixed(0);
  }

  String getTime() {
    return MyDateUtils.formatDate(
        MyDateUtils.getDateTimeByMs(data[0].createTime),
        format: DateFormats.H_M);
  }

  /// 获取奖励
  getGuessAward(){
    PicksApi.getGuessAward(data[0].scId).then((result){
      data = [];
      for (int i = 0; i < data.length; i++) {
        var item = data[i];
        item.guessData[0].status = 3;
        data.add(item);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

}
