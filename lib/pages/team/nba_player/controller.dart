import 'package:arm_chair_quaterback/common/entities/player_strength_rank_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:get/get.dart';

class NbaPlayerController extends GetxController {
  NbaPlayerController();
  RxList<PlayerStrengthRankEntity> allPlayerStrengthRank = RxList();
  RxList<PlayerStrengthRankEntity> nbaPlayerList = RxList();
  List<String> ordinalNumbers = ['st', 'nd', 'rd', 'th'];
  // ovr详情tab切换
  RxInt currentIndex = 0.obs;

  initData() async {
    allPlayerStrengthRank.clear();
    allPlayerStrengthRank.value = await PicksApi.getPlayerStrengthRank(end: -1);

    ///涨跌幅都是0，取前四个,否则取前两个和最后两个展示
    if (allPlayerStrengthRank[0].trendList[0].playerScore - allPlayerStrengthRank[0].trendList[1].playerScore > 0) {
      nbaPlayerList.addAll(allPlayerStrengthRank.sublist(0, 2));
      nbaPlayerList
          .addAll(allPlayerStrengthRank.sublist(allPlayerStrengthRank.length - 2, allPlayerStrengthRank.length - 1));
    } else {
      nbaPlayerList.addAll(allPlayerStrengthRank.sublist(0, 4));
    }
  }

  @override
  void onInit() {
    super.onInit();
    // initData();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  ///球员排行榜详情页
  void goOvrStandingDetail() {
    Get.toNamed(RouteNames.ovrStandingDetailPage);
  }

  ///球员信息详情页
  void goPlayerDetail(int playerId) {
    Get.toNamed(RouteNames.picksPlayerDetail, arguments: PlayerDetailPageArguments(playerId));
  }

  void currentIndexChange(int tabIndex) {
    if (currentIndex.value != 2 * tabIndex) {
      currentIndex.value = 2 * tabIndex;
    } else {
      currentIndex.value = (2 * tabIndex) + 1;
    }
  }
}
