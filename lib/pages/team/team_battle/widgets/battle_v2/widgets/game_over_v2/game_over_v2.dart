import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_over/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_over_v2/widgets/game_over_detail.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/quarter_score_v2/quarter_score_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/3/18/15:12

class GameOverV2 extends GetView<GameOverController> {
  GameOverV2({super.key});

  late TeamBattleV2Controller teamBattleV2Controller;

  @override
  Widget build(BuildContext context) {
    teamBattleV2Controller = Get.find();
    return GetBuilder<GameOverController>(
        init: GameOverController(context),
        builder: (logic) {
          return Container(
            color: AppColors.cF2F2F2,
            child: Container(
              margin: EdgeInsets.only(top: 9.w),
              color: AppColors.cFFFFFF,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Builder(builder: (context) {
                      if (controller.isLeftWin()) {
                        /// 有奖励
                        return MtInkWell(
                          onTap: () {
                            if (teamBattleV2Controller
                                    .pkResultUpdatedEntity?.eventType ==
                                2) {
                              Get.offNamed(RouteNames.stealPlayer);
                            } else {
                              controller.getNewsEventAward();
                            }
                          },
                          child: Opacity(
                            opacity:
                                controller.alreadyGetNewsEventAward ? 0.5 : 1.0,
                            child: SizedBox(
                              height: 118.w,
                              child: Row(
                                children: [
                                  Container(
                                    width: 105.w,
                                    height: 71.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(9.w),
                                        color: AppColors.c000000),
                                    clipBehavior: Clip.hardEdge,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        OutlinedText(
                                          text: "EVENT",
                                          textStyle: 42.w5(
                                              color: AppColors.c000000,
                                              fontFamily:
                                                  FontFamily.fOswaldMedium),
                                          strokeColor: AppColors.c4c4c4c,
                                          strokeWidth: 1.w,
                                        ),
                                        Positioned(
                                            top: 0,
                                            right: 0,
                                            child: IconWidget(
                                              icon: Assets.managerUiMangerNew22,
                                              iconWidth: 33.w,
                                            )),
                                        Positioned(
                                            bottom: 0,
                                            left: 0,
                                            child: IconWidget(
                                              icon: Assets.managerUiMangerNew21,
                                              iconWidth: 33.w,
                                            )),
                                        IconWidget(
                                          icon: teamBattleV2Controller
                                                      .pkResultUpdatedEntity
                                                      ?.eventType ==
                                                  1
                                              ? Assets.commonUiCommonProp05
                                              : Assets
                                                  .managerUiManagerFreegift01,
                                          iconWidth: 58.w,
                                        )
                                      ],
                                    ),
                                  ),
                                  12.hGap,
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "FEATURED UPCOMING EVENTS",
                                        style: 16.w5(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium,
                                        ),
                                      ),
                                      7.vGap,
                                      Text(
                                        "Click trigger",
                                        style: 14.w4(
                                          color: AppColors.c000000
                                              .withOpacity(0.5),
                                          height: 1,
                                          fontFamily: FontFamily.fRobotoRegular,
                                        ),
                                      )
                                    ],
                                  )),
                                  IconWidget(
                                    iconWidth: 8.w,
                                    icon: Assets.commonUiCommonIconSystemJumpto,
                                    iconColor: AppColors.c000000,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }

                      /// 无奖励
                      return SizedBox(
                        height: 118.w,
                        child: Row(
                          children: [
                            Container(
                              width: 105.w,
                              height: 71.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9.w),
                                  color: AppColors.c000000),
                              clipBehavior: Clip.hardEdge,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconWidget(
                                        icon: Assets.managerUiMangerNew22,
                                        iconWidth: 33.w,
                                        iconColor: AppColors.c5D5D5D,
                                      )),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: IconWidget(
                                        icon: Assets.managerUiMangerNew21,
                                        iconWidth: 33.w,
                                        iconColor: AppColors.c5D5D5D,
                                      )),
                                  IconWidget(
                                    icon:
                                        Assets.managerUiManagerPlayerinfoIcon01,
                                    iconWidth: 35.w,
                                    iconColor: AppColors.c5D5D5D,
                                  )
                                ],
                              ),
                            ),
                            12.hGap,
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "NO EVENTS",
                                  style: 16.w5(
                                    color: AppColors.c000000,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium,
                                  ),
                                ),
                                7.vGap,
                                Text(
                                  "you lose the game",
                                  style: 14.w4(
                                    color: AppColors.c000000.withOpacity(0.5),
                                    height: 1,
                                    fontFamily: FontFamily.fRobotoRegular,
                                  ),
                                )
                              ],
                            )),
                          ],
                        ),
                      );
                    }),
                    Divider(
                      color: AppColors.cD1D1D1,
                      height: 1.w,
                    ),
                    21.vGap,
                    Container(
                      width: 343.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.w),
                        color: AppColors.c000000,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          /// mvp
                          Container(
                            height: 115.w,
                            color: AppColors.c752D90,
                            child: Row(
                              children: [
                                Container(
                                  width: 60.w,
                                  color: AppColors.c3A1648,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 36.w,
                                        height: 36.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18.w),
                                            border: Border.all(
                                                color: controller.isLeftWin()
                                                    ? AppColors.c1F8FE5
                                                    : AppColors.cD60D20,
                                                width: 1.w)),
                                        clipBehavior: Clip.hardEdge,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18.w),
                                          child: UserAvatarWidget(
                                            url: Utils.getAvatarUrl(controller
                                                .getWinnerInfo()
                                                ?.teamLogo),
                                            width: 36.w,
                                            height: 36.w,
                                            radius: 18.w,
                                          ),
                                        ),
                                      ),
                                      7.vGap,
                                      Text(
                                        "MVP",
                                        style: 21.w5(
                                          color: AppColors.cFFFFFF,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Stack(
                                  children: [
                                    Positioned(
                                      top: 12.w,
                                      right: 7.w,
                                      child: Text(
                                        "#${Utils.getPlayBaseInfo(controller.getMvpInfo()!.playerId).number}",
                                        style: 62.w7(
                                          color: AppColors.cFFFFFF
                                              .withOpacity(0.3),
                                          fontFamily: FontFamily.fOswaldBold,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 12.w,
                                      left: 21.w,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              Utils.getPlayBaseInfo(controller
                                                      .getMvpInfo()!
                                                      .playerId)
                                                  .ename,
                                              maxLines: 2,
                                              softWrap: true,
                                              style: 35.w7(
                                                  color: AppColors.cFFFFFF,
                                                  height: 1.1,
                                                  fontFamily:
                                                      FontFamily.fOswaldBold),
                                            ),
                                          ),
                                          ImageWidget(
                                            url: Utils.getPlayUrl(controller
                                                .getMvpInfo()!
                                                .playerId),
                                            width: 131.w,
                                            height: 99.w,
                                            fit: BoxFit.fitWidth,
                                            alignment: Alignment.topCenter,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                          QuarterScoreWidgetV2(),
                        ],
                      ),
                    ),
                    24.vGap,
                    Text(
                      "${teamBattleV2Controller.pkResultUpdatedEntity?.newsTitle}",
                      style: 21.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium,
                      ),
                    ),
                    15.vGap,
                    Text(
                      "${teamBattleV2Controller.pkResultUpdatedEntity?.newsContent}",
                      maxLines: 5,
                      style: 14.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular,
                          overflow: TextOverflow.ellipsis),
                    ),
                    10.vGap,
                    MtInkWell(
                      onTap: () => showModalBottomSheet(
                          context: context,
                          backgroundColor: AppColors.cTransparent,
                          isScrollControlled: true,
                          builder: (context) {
                            return GameOverDetail();
                          }),
                      child: SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "SEE ALL",
                              style: 16.w7(
                                color: AppColors.c262626,
                                height: 1,
                                fontFamily: FontFamily.fOswaldBold,
                              ),
                            ),
                            6.hGap,
                            IconWidget(
                              icon: Assets.commonUiCommonIconSystemJumpto,
                              iconColor: AppColors.c000000,
                              iconWidth: 5.w,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
