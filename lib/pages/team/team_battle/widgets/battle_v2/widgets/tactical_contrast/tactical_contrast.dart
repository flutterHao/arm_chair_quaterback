import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/tactical_contrast/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/11/29/18:30

class TacticalContrast extends StatelessWidget {
  TacticalContrast({super.key});

  late TeamBattleController teamBattleController;

  late TacticalContrastController controller;

  @override
  Widget build(BuildContext context) {
    teamBattleController = Get.find();
    controller = Get.put(TacticalContrastController(context));
    return GetBuilder<TacticalContrastController>(
        init: controller,
        builder: (logic) {
          return Column(
            children: [
              Expanded(
                  child: InkWell(
                onTap: () => Navigator.pop(context),
              )),
              Container(
                width: double.infinity,
                height: Utils.getDialogHeight(),
                decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(9.w))),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    8.vGap,
                    Center(
                      child: Container(
                        width: 44.w,
                        height: 4.w,
                        decoration: BoxDecoration(
                            color: AppColors.c000000.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(2.w)),
                      ),
                    ),
                    25.vGap,
                    Text(
                      "TACTICAL CONTRAST",
                      style: 30.w7(
                          color: AppColors.c262626,
                          height: 1,
                          fontFamily: FontFamily.fOswaldBold),
                    ),
                    22.vGap,
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          //背景
                          Image.asset(
                            Assets.managerUiManagerTacticsBg,
                            fit: BoxFit.fitWidth,
                          ),
                          // 对手信息
                          Positioned(
                              top: 16.w, left: 0, right: 0, child: buildInfo()),
                          // 自己的头像
                          Positioned(
                            top: 95.w,
                            left: 0,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.w),
                              width: 60.w,
                              height: 58.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 36.w,
                                    height: 36.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18.w),
                                        border: Border.all(
                                            color: AppColors.cD60D20,
                                            width: 1.w)),
                                    child: ImageWidget(
                                      url: Utils.getTeamUrl(teamBattleController
                                          .battleEntity.homeTeam.teamLogo),
                                      width: 35.w,
                                      height: 35.w,
                                      imageFailedPath: Assets.teamUiHead03,
                                      borderRadius:
                                          BorderRadius.circular(17.5.w),
                                    ),
                                  ),
                                  4.vGap,
                                  Text(
                                    teamBattleController
                                        .battleEntity.homeTeam.teamName,
                                    style: 12.w4(
                                        color: AppColors.cFFFFFF,
                                        height: 1,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: FontFamily.fOswaldRegular),
                                  )
                                ],
                              ),
                            ),
                          ),
                          //自己的卡牌
                          ...List.generate(5, (index) {
                            var list = controller.getHomeTeamBuff();
                            TeamBuffer? item =
                                list.length - 1 >= index ? list[index] : null;
                            Widget child;
                            if (item == null) {
                              child = buildEmpty(AppColors.c333333,
                                  AppColors.cFFFFFF.withOpacity(0.15));
                            } else {
                              child = buildEmpty(
                                  AppColors.c333333, AppColors.cTransparent);
                            }
                            return Positioned(
                                top: 95.w,
                                left: 60.w + 16.w + 50.w * index,
                                child: child);
                          }),
                          // MY TACTICS
                          Positioned(
                              top: 232.w,
                              left: 0,
                              right: 0,
                              child: Column(
                                children: [
                                  Text(
                                    "MY TACTICS",
                                    style: 16.w5(
                                        color: AppColors.c262626,
                                        height: 1,
                                        fontFamily: FontFamily.fOswaldMedium),
                                  ),
                                  8.vGap,
                                  Divider(
                                    color: AppColors.cE6E6E,
                                    height: 1.w,
                                  ),
                                ],
                              )),

                          //背景
                          ...List.generate(5, (index) {
                            var d = MediaQuery.of(context).size.width -
                                (16.w * 2) -
                                (43.w * 5 + 12.w * 4);
                            var left = d / 2;
                            var list = controller.getHomeTeamBuff();
                            TeamBuffer? item =
                                list.length - 1 >= index ? list[index] : null;
                            List<Widget> sC = [];
                            sC.add(Positioned(
                              top: 6.w,
                              child: buildEmpty(
                                  AppColors.cF2F2F2, AppColors.ccccccc),
                            ));
                            if (item != null) {
                              List<Widget> abc = [];
                              for (int i = 0;
                                  i < item.takeEffectGameCount-1;
                                  i++) {
                                double top = 3.w-i * 3.w;
                                abc.add(Positioned(
                                  top: max(0,top),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.c000000
                                              .withOpacity(0.2),
                                          offset: const Offset(1, 1),
                                          blurRadius: 5,
                                        )
                                      ],
                                    ),
                                    child: TacticCard(
                                      num: item.face,
                                      color: item.color,
                                      width: 43.w,
                                      buff: TrainingInfoBuff(),
                                    ),
                                  ),
                                ));
                              }
                              sC.addAll(abc);
                            }
                            return Positioned(
                                top: 269.w,
                                left: left + (43.w + 12.w) * index,
                                child: SizedBox(
                                    height: 64.w,
                                    width: 55.w,
                                    child: Stack(
                                      children: sC,
                                    )));
                          }),

                          // 我的卡牌
                          ...List.generate(5, (index) {
                            var list = controller.getHomeTeamBuff();
                            TeamBuffer? item =
                                list.length - 1 >= index ? list[index] : null;
                            Widget child;
                            if (item == null) {
                              child = const SizedBox.shrink();
                            } else {
                              child = Obx(() {
                                Offset offset =
                                    controller.animationList[index].value.value;
                                print('offset:$offset');
                                return Positioned(
                                    top: offset.dy,
                                    left: offset.dx,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.c000000
                                                  .withOpacity(0.2),
                                              offset: const Offset(1, 1),
                                              blurRadius: 5,
                                            )
                                          ],
                                        ),
                                        child: TacticCard(
                                          num: item.face,
                                          color: item.color,
                                          width: 43.w,
                                          buff: TrainingInfoBuff(),
                                        )));
                              });
                            }
                            return child;
                          }),
                          // 卡牌数量
                          ...List.generate(5, (index) {
                            var d = MediaQuery.of(context).size.width -
                                (16.w * 2) -
                                (43.w * 5 + 12.w * 4);
                            var left = d / 2;
                            var list =controller.getHomeTeamBuff();
                            TeamBuffer? item =
                                list.length - 1 >= index ? list[index] : null;
                            Widget child;
                            if (item == null) {
                              child = const SizedBox.shrink();
                            } else {
                              child = Obx(() {
                                Offset offset =
                                    controller.animationList[index].value.value;
                                // dy:269.w -95.w
                                double progress =
                                    (offset.dy - 95.w) / (269.w - 95.w);
                                var count = item.takeEffectGameCount - 1;
                                return Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Text(
                                      "x$count",
                                      style: 10.w5(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily: FontFamily.fRobotoMedium),
                                    ),
                                    Positioned(
                                      top: 7.w * progress,
                                      right: 0,
                                      child: Text(
                                        "-1",
                                        style: 10.w5(
                                            color: AppColors.cD60D20
                                                .withOpacity(min(1,progress)),
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fRobotoMedium),
                                      ),
                                    )
                                  ],
                                );
                              });
                            }
                            return Positioned(
                                top: 332.w,
                                left: left + (43.w + 12.w) * index,
                                child: SizedBox(
                                  height: 17.w,
                                  width: 43.w,
                                  child: child,
                                ));
                          })
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ],
          );
        });
  }

  Row buildInfo() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          width: 60.w,
          height: 58.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.w),
                    border: Border.all(color: AppColors.cD60D20, width: 1.w)),
                child: ImageWidget(
                  url: Utils.getTeamUrl(
                      teamBattleController.battleEntity.awayTeam.teamLogo),
                  width: 35.w,
                  height: 35.w,
                  imageFailedPath: Assets.teamUiHead03,
                  borderRadius: BorderRadius.circular(17.5.w),
                ),
              ),
              4.vGap,
              Text(
                teamBattleController.battleEntity.awayTeam.teamName,
                style: 12.w4(
                    color: AppColors.cFFFFFF,
                    height: 1,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: FontFamily.fOswaldRegular),
              )
            ],
          ),
        ),
        Expanded(
            child: Row(
          children: List.generate(5, (index) {
            var list = controller.getAwayTeamBuff();
            TeamBuffer? item = list.length - 1 >= index ? list[index] : null;
            if (item == null) {
              return buildEmpty(
                  AppColors.c333333, AppColors.cFFFFFF.withOpacity(0.15));
            }
            return TacticCard(
              num: item.face,
              color: item.color,
              width: 43.w,
              buff: TrainingInfoBuff(),
            );
          }),
        )),
        16.hGap,
      ],
    );
  }

  Widget buildEmpty(Color bgColor, Color iconColor) {
    return Container(
      width: 43.w,
      height: 58.w,
      margin: EdgeInsets.only(right: 7.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        color: bgColor,
      ),
      child: IconWidget(
        iconWidth: 18.w,
        icon: Assets.managerUiManagerTacticsIconEmpty,
        iconColor: iconColor,
      ),
    );
  }
}
