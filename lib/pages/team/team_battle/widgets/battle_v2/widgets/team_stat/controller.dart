import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail/widgets/league_detail_play/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/6/16:55

class TeamStatsController extends GetxController {
  GameEvent? event;

  final isExpanded = false.obs;


  setEvent(GameEvent e){
    event = e;
    update();
  }
  List<TeamStats> getTeamStatsData() {
    List<TeamStats> list = [];
    if (event == null) {
      return [];
    }
    var homeDetail = event?.pkEventUpdatedEntity.homeInfo;
    var awayDetail = event?.pkEventUpdatedEntity.awayInfo;

    list.add(TeamStats("Points", homeDetail?.pts ?? 0, awayDetail?.pts ?? 0));
    list.add(TeamStats(
        "3 Points Make", homeDetail?.threePm ?? 0, awayDetail?.threePm ?? 0));
    list.add(TeamStats("Rebound", homeDetail?.reb ?? 0, awayDetail?.reb ?? 0));
    list.add(TeamStats("Assist", homeDetail?.ast ?? 0, awayDetail?.ast ?? 0));
    list.add(TeamStats("Steals", homeDetail?.stl ?? 0, awayDetail?.stl ?? 0));
    list.add(
        TeamStats("Block Shot ", homeDetail?.blk ?? 0, awayDetail?.blk ?? 0));
    list.add(TeamStats(
        "Free Throw Make", homeDetail?.ftm ?? 0, awayDetail?.ftm ?? 0));
    list.add(TeamStats("Turn over", homeDetail?.to ?? 0, awayDetail?.to ?? 0));
    list.add(TeamStats("Foul", homeDetail?.pf ?? 0, awayDetail?.pf ?? 0));

    list.add(TeamStats(
        "Field Goal",
        ((homeDetail?.fgm ?? 0) / (homeDetail?.fga ?? 0)).handlerNaNInfinity(),
        ((awayDetail?.fgm ?? 0) / (awayDetail?.fga ?? 0)).handlerNaNInfinity(),
        valueIsPercent: true));
    list.add(TeamStats(
        "Free Throw %",
        ((homeDetail?.ftm ?? 0) / (homeDetail?.fta ?? 0)).handlerNaNInfinity(),
        ((awayDetail?.ftm ?? 0) / (awayDetail?.fta ?? 0)).handlerNaNInfinity(),
        valueIsPercent: true));
    list.add(TeamStats(
        "3 Point %",
        ((homeDetail?.threePm ?? 0) / (homeDetail?.threePa ?? 0))
            .handlerNaNInfinity(),
        ((awayDetail?.threePm ?? 0) / (awayDetail?.threePa ?? 0))
            .handlerNaNInfinity(),
        valueIsPercent: true));
    return list;
  }
}
