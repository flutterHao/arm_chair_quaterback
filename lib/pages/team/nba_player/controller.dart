import 'package:arm_chair_quaterback/common/entities/player_strength_rank_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:get/get.dart';

class NbaPlayerController extends GetxController {
  NbaPlayerController();
  RxList<PlayerStrengthRankEntity> allPlayerStrengthRank = RxList();
  RxList<PlayerStrengthRankEntity> nbaPlayerList = RxList();
  List<String> ordinalNumbers = ['st', 'nd', 'rd', 'th'];
  initData() async {
    allPlayerStrengthRank.clear();
    allPlayerStrengthRank.value = await PicksApi.getPlayerStrengthRank(end: -1);

    ///涨跌幅都是0，取前四个,否则取前两个和最后两个展示
    if (allPlayerStrengthRank[0].trendList[0].playerScore -
            allPlayerStrengthRank[0].trendList[1].playerScore >
        0) {
      nbaPlayerList.addAll(allPlayerStrengthRank.sublist(0, 2));
      nbaPlayerList.addAll(allPlayerStrengthRank.sublist(
          allPlayerStrengthRank.length - 2, allPlayerStrengthRank.length - 1));
    } else {
      nbaPlayerList.addAll(allPlayerStrengthRank.sublist(0, 4));
    }
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
