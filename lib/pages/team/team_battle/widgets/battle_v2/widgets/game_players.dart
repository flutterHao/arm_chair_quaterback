import 'package:arm_chair_quaterback/common/entities/pk_player_updated_entity.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/mark_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/12/17:43

class GamePlayersWidget extends GetView<TeamBattleV2Controller> {
  const GamePlayersWidget({this.needStartAnimation = false, super.key});

  final bool needStartAnimation;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamBattleV2Controller>(builder: (c) {
      return buildPlayersWidget();
    });
  }

  Widget buildPlayersWidget() {
    return GetBuilder<TeamBattleV2Controller>(
        id: TeamBattleV2Controller.idPlayers,
        builder: (_) {
          GameEvent? event;
          if (controller.getQuarterEvents().isNotEmpty) {
            event = controller.getQuarterEvents().last;
          }
          var homeTeamPlayerList = controller.getHomeTeamPlayerList();
          var awayTeamPlayerList = controller.getAwayTeamPlayerList();
          return TweenAnimationBuilder(
              tween: Tween<double>(begin: 1, end: 0), // 动画从 200 到 0
              duration: const Duration(milliseconds: 300), // 动画时长
              curve: Curves.easeInOut, // 动画曲线
              builder: (context, value, child) {
                var width = MediaQuery.of(context).size.width;
                return SizedBox(
                  height: 44.w,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        left:
                            (needStartAnimation ? (-width * value) : 0) + 16.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: buildPlayers(event, homeTeamPlayerList),
                        ),
                      ),
                      Positioned(
                        right:
                            (needStartAnimation ? (-width * value) : 0) + 16.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: buildPlayers(event, awayTeamPlayerList),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }

  List<Widget> buildPlayers(
      GameEvent? event, List<PkPlayerUpdatedPlayers> homeTeamPlayerList) {
    return List.generate(5, (index) {
      var list = homeTeamPlayerList;
      var item = list[index];
      var active = event != null &&
          event.isHomePlayer &&
          item.playerId == event.playerId;

      Widget content = Container(
          width: 28.w,
          height: 36.w,
          decoration: BoxDecoration(
            // color: active ? AppColors.cD60D20 : AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(4.w),
          ),
          margin: EdgeInsets.only(right: 4.w),
          child: ImageWidget(
            url: Utils.getPlayUrl(item.playerId),
            imageFailedPath: Assets.iconUiDefault04,
            borderRadius: BorderRadius.circular(4.w),
          ));
      if (active) {
        content = MarkAnimationWidget(
          height: 44.w,
          end: 8.w,
          duration: const Duration(milliseconds: 300),
          child: Center(child: content),
        );
      }
      return content;
    });
  }
}
