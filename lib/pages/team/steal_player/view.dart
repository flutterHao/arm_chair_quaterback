import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/translation_page.dart';
import 'package:arm_chair_quaterback/pages/team/steal_player/controller.dart';
import 'package:arm_chair_quaterback/pages/team/steal_player/widgets/player_choose.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/matching.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// 偷球员
///@auther gejiahui
///created at 2025/3/14/17:50

class StealPlayer extends GetView<StealPlayerController> {
  const StealPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
        child: GetBuilder(
            init: StealPlayerController(),
            builder: (_) {
              return Container(
                color: AppColors.c000000,
                height: double.infinity,
                width: double.infinity,
                child: Builder(builder: (_) {
                  if (controller.ready) {
                    return PlayerChoose();
                  }
                  return Stack(
                    children: [
                      TranslationPage(
                          onEnd: () => controller.translationPageEnd()),
                      AnimatedOpacity(
                          opacity: controller.showMatch ? 1 : 0,
                          duration: Duration(milliseconds: 300),
                          child: Matching()),
                    ],
                  );
                }),
              );
            }));
  }
}
