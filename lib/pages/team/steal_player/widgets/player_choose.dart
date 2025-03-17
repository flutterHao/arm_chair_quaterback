import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/steal_team_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:arm_chair_quaterback/pages/team/steal_player/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/big_player_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/my_team_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/3/14/18:12

class PlayerChoose extends GetView<StealPlayerController> {
  const PlayerChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StealPlayerController>(
      builder: (logic) {
        if (controller.loadStatus.value != LoadDataStatus.success) {
          return Obx(() {
            return Center(
              child: LoadStatusWidget(
                loadDataStatus: controller.loadStatus.value,
              ),
            );
          });
        }
        return Column(
          children: [buildHeader(), _buildContent()],
        );
      },
    );
  }

  Expanded _buildContent() {
    return Expanded(
      child: Container(
        color: AppColors.cFFFFFF,
        // child: _buildFailed(),
        child: AnimatedBuilder(
            animation: Listenable.merge([
              controller.animationController,
              controller.failedAnimationController
            ]),
            builder: (context, child) {
              return Stack(
                children: [
                  _buildPlayers(),
                  if (controller.failedAnimationStart) _buildFailed(),
                ],
              );
            }),
        // child: _buildSuccess(),
      ),
    );
  }

  Widget _buildFailed() {
    return Opacity(
      opacity: controller.flipAnimation.value,
      child: Column(
        children: [
          Opacity(
            opacity: controller.failedShowAnimation.value,
            child: Container(
              height: 90.w,
              width: double.infinity,
              color: AppColors.cFFFFFF,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 17.w),
              child: Text(
                "FAILED",
                style: 40.w5(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fOswaldMedium,
                ),
              ),
            ),
          ),
          52.vGap,
          Transform.scale(
            scale: controller.failedScaleAnimation.value,
            child: Container(
              width: 144.w,
              height: 144.w,
              decoration: BoxDecoration(
                color: AppColors.cFF9191.withOpacity(0.2),
                borderRadius: BorderRadius.circular(72.w),
              ),
              child: Center(
                child: Container(
                  width: 114.w,
                  height: 114.w,
                  decoration: BoxDecoration(
                    color: AppColors.cD60D20,
                    borderRadius: BorderRadius.circular(57.w),
                  ),
                  child: Center(
                    child: Container(
                      width: 44.w,
                      height: 44.w,
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(22.w),
                      ),
                      child: Center(
                        child: IconWidget(
                          iconWidth: 18.w,
                          icon: Assets.iconIconClose,
                          iconColor: AppColors.cD60D20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          24.vGap,
          Opacity(
            opacity: controller.failedShowAnimation.value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidget(
                  icon: Assets.commonUiCommonProp05,
                  iconWidth: 27.w,
                ),
                6.hGap,
                Text(
                  "+${Utils.formatMoney(controller.stealResponseEntity.awardData[0].num)}",
                  style: 19.w5(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  bottom: 35.w,
                  child: Opacity(
                    opacity: controller.failedShowAnimation.value,
                    child: Container(
                      height: 51.w,
                      width: 343.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.w),
                          border: Border.all(
                            color: AppColors.c000000,
                            width: 1.w,
                          )),
                      child: _buildContinue(),
                    ),
                  ))
            ],
          ))
        ],
      ),
    );
  }


  Widget _buildContinue() {
    return MtInkWell(
      onTap: () => Get.back(),
      child: Center(
        child: Text(
          "CONTINUE",
          style: 23.w5(
            color: AppColors.c000000,
            height: 1,
            fontFamily: FontFamily.fOswaldMedium,
          ),
        ),
      ),
    );
  }

  Widget _buildPlayers() {
    return Column(
      children: [
        Stack(
          children: [
            Opacity(
              opacity: controller.hiddenOldWidgetAnimation.value,
              child: Container(
                height: 90.w,
                width: double.infinity,
                color: AppColors.cFFFFFF,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 17.w),
                child: Text(
                  "PLAYER POACHING",
                  style: 34.w5(
                    color: AppColors.c010101,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium,
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: controller.showAnimation.value,
              child: Container(
                height: 90.w,
                width: double.infinity,
                color: AppColors.cFFFFFF,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 17.w),
                child: Transform.scale(
                  scale: controller.lastTextAnimation.value,
                  child: Text(
                    "SUCCESS",
                    style: 34.w5(
                      color: AppColors.c010101,
                      height: 1,
                      fontFamily: FontFamily.fOswaldMedium,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Opacity(
          opacity: controller.hiddenOldWidgetAnimation.value,
          child: Divider(
            color: AppColors.cD1D1D1,
            height: 1.w,
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: GridView.builder(
                    padding:
                        EdgeInsets.symmetric(vertical: 18.w, horizontal: 16.w),
                    itemCount: controller.stealTeamEntity.players.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 106 / 194,
                        mainAxisSpacing: 20.w,
                        crossAxisSpacing: 10.w,
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      StealTeamPlayers player =
                          controller.stealTeamEntity.players[index];
                      var playBaseInfo = Utils.getPlayBaseInfo(player.playerId);
                      // if (index != 1) {
                      //   return SizedBox.shrink();
                      // }
                      return _buildItem(playBaseInfo, player, index, context);
                    }),
              ),
              Positioned(
                  bottom: 35.w,
                  child: Opacity(
                    opacity: controller.showAnimation.value,
                    child: Container(
                      height: 51.w,
                      width: 343.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.w),
                          border: Border.all(
                            color: AppColors.c000000,
                            width: 1.w,
                          )),
                      child: _buildContinue(),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }

  /// 根据进度计算抖动偏移，保证 t=0 和 t=1 时偏移为 0
  double _calculateShakeOffset(double progress) {
    // 正弦函数产生多次震动，(1-progress) 实现衰减效果
    return 5 * sin(3 * 2 * pi * progress) * (1 - progress);
  }

  Widget _buildItem(NbaPlayerInfosPlayerBaseInfoList playBaseInfo,
      StealTeamPlayers player, int index, BuildContext context) {
    GlobalKey itemKey = GlobalKey();
    Widget normalWidget = Column(
      children: [
        MtInkWell(
          onTap: () => controller.onItemTap(
              player, playBaseInfo, index, itemKey, context),
          child: _buildCard(playBaseInfo, player),
        ),
        5.vGap,
        Opacity(
          opacity: controller.hiddenOldWidgetAnimation.value,
          child: Container(
            width: 76.w,
            height: 21.w,
            decoration: BoxDecoration(
              color: AppColors.cF2F2F2,
              borderRadius: BorderRadius.circular(4.w),
            ),
            alignment: Alignment.center,
            child: Text(
              controller.getTextByGrade(playBaseInfo.grade),
              style: 12.w5(
                color: controller.getColorByGrade(playBaseInfo.grade),
                height: 1,
                fontFamily: FontFamily.fOswaldMedium,
              ),
            ),
          ),
        )
      ],
    );
    if (controller.chooseIndex != index) {
      normalWidget = Opacity(
          opacity: controller.hiddenOldWidgetAnimation.value,
          child: normalWidget);
    } else {
      normalWidget = Transform(
        transform: Matrix4.rotationY(controller.flipAnimation.value * pi / 2),
        alignment: Alignment.center,
        child: Transform.translate(
          offset:
              Offset(_calculateShakeOffset(controller.shakeAnimation.value), 0),
          child: Transform.translate(
            offset: controller.translateAnimation.value,
            child: Transform.scale(
              // scale: 1.5,
              scale: controller.scaleAnimation.value,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  normalWidget,
                  Positioned(
                      bottom: 25.w,
                      right: 0.w,
                      child: Opacity(
                        opacity: controller.showAnimation.value,
                        child: Transform.scale(
                          scale: controller.lastTextAnimation.value,
                          alignment: Alignment.center,
                          child: Transform.translate(
                            offset: Offset(10.w, 0),
                            child: Container(
                              width: 32.w,
                              height: 32.w,
                              decoration: BoxDecoration(
                                  color: AppColors.c10A86A,
                                  borderRadius: BorderRadius.circular(16.w)),
                              child: IconWidget(
                                icon: Assets.iconUiIconRuidgt,
                                iconWidth: 16.w,
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      );
    }
    return Container(key: itemKey, child: normalWidget);
    return Transform.scale(
      scale: 148 / 108,
      alignment: Alignment.topCenter,
      child: Transform.translate(
        offset: Offset(0, 12),
        child: Stack(
          children: [
            normalWidget,
            Positioned(
                bottom: 25.w,
                right: 0.w,
                child: Transform.translate(
                  offset: Offset(10.w, 0),
                  child: Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                        color: AppColors.c10A86A,
                        borderRadius: BorderRadius.circular(16.w)),
                    child: IconWidget(
                      icon: Assets.iconUiIconRuidgt,
                      iconWidth: 16.w,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      NbaPlayerInfosPlayerBaseInfoList playBaseInfo, StealTeamPlayers player) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          height: 98.w,
          left: 0,
          right: 0,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: ImageWidget(
                url: Utils.getPlayUrl(player.playerId),
              )),
        ),
        Positioned(
            child: Container(
          width: 106.w,
          height: 164.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.w),
              image: DecorationImage(
                  image: AssetImage(getBigCardImage(playBaseInfo.grade)))),
        )),
        Positioned(
            top: 10.w,
            left: 10.w,
            child: Column(
              children: [
                OutlinedText(
                    text: "${playBaseInfo.playerScore}",
                    strokeWidth: 1.5.w,
                    strokeColor: AppColors.cFFFFFF,
                    textStyle: 16.w7(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldBold,
                    )),
                2.vGap,
                OutlinedText(
                    text: "OVR",
                    strokeWidth: 2.w,
                    strokeColor: AppColors.cFFFFFF,
                    textStyle: 10.w4(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fRobotoRegular,
                    )),
              ],
            )),
        Positioned(
            top: 101.w,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // PlayerStartWidget(
                //   grade: player.breakThroughGrade,
                //   height: 15,
                // ),
                2.vGap,
                Text(
                  playBaseInfo.ename,
                  style: 11.w7(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldBold,
                  ),
                ),
                4.vGap,
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ImageWidget(
                          url: Utils.getTeamUrl(playBaseInfo.teamId),
                          width: 11.w,
                          height: 11.w,
                        ),
                        Text(
                          "#${playBaseInfo.number}",
                          style: 10.w4(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                        ),
                        5.hGap,
                      ],
                    )),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        5.hGap,
                        Text(
                          playBaseInfo.position,
                          style: 10.w4(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                        )
                      ],
                    ))
                  ],
                )
              ],
            ))
      ],
    );
  }

  Container buildHeader() {
    return Container(
      height: 250.w,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.managerUiMangerNew25),
              fit: BoxFit.cover,
              alignment: Alignment.topRight)),
      child: Column(
        children: [
          53.vGap,
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.cFFFFFF,
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(45.w)),
            child: UserAvatarWidget(
              url: Utils.getAvatarUrl(controller.stealTeamEntity.teamLogo),
              width: 90.w,
              height: 90.w,
              radius: 45.w,
            ),
          ),
          20.vGap,
          Text(
            "${controller.stealTeamEntity.teamName}\nPLAYERS",
            textAlign: TextAlign.center,
            style: 29.w7(
              color: AppColors.cFFFFFF,
              fontFamily: Assets.fontsOswaldBold,
              height: 1,
            ),
          )
        ],
      ),
    );
  }

  String getBigCardImage(String grade) {
    grade = grade.replaceAll("-", "").replaceAll("+", "");
    switch (grade) {
      case "S":
        return Assets.managerUiManagerPlayercardBig03;
      case "A":
        return Assets.managerUiManagerPlayercardBig02;
      default:
        return Assets.managerUiManagerPlayercardBig01;
    }
  }
}
