import 'package:arm_chair_quaterback/common/entities/player_strength_rank_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/net/apis/user.dart';
import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:get/get.dart';

class NbaPlayerController extends GetxController {
  NbaPlayerController();
  RxList<PlayerStrengthRankEntity> allPlayerStrengthRank = RxList();
  RxList<PlayerStrengthRankEntity> nbaPlayerList = RxList();
  List<String> ordinalNumbers = ['st', 'nd', 'rd', 'th'];
  // ovr详情tab切换
  RxInt currentIndex = (-1).obs;

  RxList<int> likePlayersList = RxList();

  initData() async {
    allPlayerStrengthRank.clear();
    allPlayerStrengthRank.value = await TeamApi.getPlayerStrengthRank();

    ///涨跌幅都是0，取前四个,否则取前两个和最后两个展示
    if (allPlayerStrengthRank[0].trendList[0].playerScore - allPlayerStrengthRank[0].trendList[1].playerScore > 0) {
      nbaPlayerList.addAll(allPlayerStrengthRank.sublist(0, 2));
      nbaPlayerList
          .addAll(allPlayerStrengthRank.sublist(allPlayerStrengthRank.length - 2, allPlayerStrengthRank.length - 1));
    } else {
      nbaPlayerList.addAll(allPlayerStrengthRank.sublist(0, 4));
    }

    var teamLoginInfo = await UserApi.getTeamLoginInfo();
    likePlayersList.value = teamLoginInfo.team!.teamPreference!.likePlayers!;
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

  /// 切换ovr排行榜tab
  void currentIndexChange(int tabIndex) {
    if (currentIndex.value != 2 * tabIndex) {
      currentIndex.value = 2 * tabIndex;
    } else {
      currentIndex.value = (2 * tabIndex) + 1;
    }
    switch (currentIndex.value) {
      case 0:
        {
          allPlayerStrengthRank.sort((a, b) => a.rank.compareTo(b.rank));
        }
      case 1:
        {
          allPlayerStrengthRank.sort((a, b) => b.rank.compareTo(a.rank));
        }
      case 2:
        {
          allPlayerStrengthRank.sort((a, b) => a.strength.compareTo(b.strength));
        }
      case 3:
        {
          allPlayerStrengthRank.sort((a, b) => b.strength.compareTo(a.strength));
        }
      case 4:
        {
          allPlayerStrengthRank.sort((a, b) {
            if (likePlayersList.contains(a.playerId) == likePlayersList.contains(b.playerId)) {
              return a.rank.compareTo(b.rank);
            }
            return likePlayersList.contains(b.playerId) ? 1 : -1;
          });
        }
      case 5:
        {
          allPlayerStrengthRank.sort((a, b) {
            if (likePlayersList.contains(a.playerId) == likePlayersList.contains(b.playerId)) {
              return a.rank.compareTo(b.rank);
            }
            return likePlayersList.contains(b.playerId) ? -1 : 1;
          });
        }
      default:
        {
          allPlayerStrengthRank.sort((a, b) => a.rank.compareTo(b.rank));
        }
    }
  }

  void changeLikePlayer(int index) async {
    if (likePlayersList.contains(allPlayerStrengthRank[index].playerId)) {
      var res = await UserApi.cancelLikingPlayer('${allPlayerStrengthRank[index].playerId}');
      likePlayersList.value = res.teamPreference!.likePlayers!;
    } else {
      var res = await UserApi.likePlayer('${allPlayerStrengthRank[index].playerId}');
      likePlayersList.value = res.teamPreference!.likePlayers!;
    }
  }
}
