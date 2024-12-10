import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_leader/game_leader_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_over/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/quarter_score/quarter_score_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/10/14:18

class GameOverWidget extends StatefulWidget {
  const GameOverWidget({super.key});

  @override
  State<GameOverWidget> createState() => _GameOverWidgetState();
}

class _GameOverWidgetState extends State<GameOverWidget> {
  late GameOverController controller;

  late TeamBattleV2Controller teamBattleV2Controller;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      controller.startObs.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    teamBattleV2Controller = Get.find();
    return GetBuilder<GameOverController>(
        init: controller = GameOverController(),
        builder: (logic) {
          /// todo 测试代码 需删除
          // controller.startObs.value = false;
          // controller.giftObs.value = false;
          // controller.opacityObs.value = false;
          return Container(
            color: AppColors.c000000.withOpacity(0.6),
            child: Column(
              children: [
                Container(
                  height: 219.w,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Obx(() {
                        return AnimatedPositioned(
                            top: controller.startObs.value ? -10.w : -208.w,
                            left: 19.w,
                            duration: const Duration(milliseconds: 300),
                            onEnd: () {
                              print('AnimatedPositioned---onEnd----');
                              controller.giftObs.value =
                              !controller.giftObs.value;
                            },
                            child: IconWidget(
                              iconHeight: 208.w,
                              fit: BoxFit.fitHeight,
                              icon: Assets.managerUiManagerFlag,
                              iconWidth: 131.w,
                            ));
                      }),
                      Positioned(
                        top: 15.w,
                        left: 19.w,
                        child: Container(
                          width: 131.w,
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Text(
                                "WINNER",
                                style: 30.w7(
                                    color: AppColors.cFFFFFF,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldBold),
                              ),
                              10.vGap,
                              Container(
                                width: 15.w,
                                height: 2.w,
                                color: AppColors.cFF7954,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: 36.w,
                          child: Obx(() {
                            return AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity: controller.opacityObs.value ? 1 : 0,
                              child: Container(
                                width: 96.w,
                                height: 31.w,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 17.w),
                                decoration: BoxDecoration(
                                    color: AppColors.c000000,
                                    border: Border.all(
                                        color: AppColors.c333333, width: 1.w),
                                    borderRadius: BorderRadius.circular(6.w)),
                                child: Text("CHEST",style: 14.w5(
                                  color: AppColors.cFFFFFF,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium
                                ),),
                              ),
                            );
                          })),
                      Obx(() {
                        return AnimatedPositioned(
                            left: controller.giftObs.value ? 43.w : 155.w,
                            duration: const Duration(milliseconds: 300),
                            onEnd: (){
                              print('giftObs===onEnd---');
                              controller.opacityObs.value = !controller.opacityObs.value;
                            },
                            child: InkWell(
                              onTap: () {
                                // controller.startObs.value = !controller.startObs.value;
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: controller.giftObs.value ? 24.w : 63.w,
                                child: Center(
                                  child: IconWidget(
                                      iconWidth: 63.w,
                                      icon: Assets.managerUiManagerGift03),
                                ),
                              ),
                            ));
                      })
                    ],
                  ),
                ),
                //底部
                Expanded(
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(9.w)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.cF2F2F2,
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(9.w))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              GetBuilder<TeamBattleV2Controller>(
                                  id: TeamBattleV2Controller.idQuarterScore,
                                  builder: (_) {
                                    return QuarterScoreWidget(
                                      hasTopMargin: false,
                                    );
                                  }),
                              GameLeaderWidget(
                                controller: teamBattleV2Controller.gameLeaderController,
                              ),
                              9.vGap
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
