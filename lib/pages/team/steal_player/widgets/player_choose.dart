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
        child: _buildPlayers(),
        // child: _buildSuccess(),
      ),
    );
  }

  Widget _buildFailed() {
    return Column(
      children: [
        Container(
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
        52.vGap,
        Stack(
          children: [
            Container(
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
            )
          ],
        ),
        24.vGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWidget(
              icon: Assets.commonUiCommonProp05,
              iconWidth: 27.w,
            ),
            6.hGap,
            Text(
              "+${Utils.formatMoney(5)}",
              style: 19.w5(
                color: AppColors.c000000,
                height: 1,
                fontFamily: FontFamily.fOswaldMedium,
              ),
            )
          ],
        ),
        Expanded(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                bottom: 35.w,
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
                ))
          ],
        ))
      ],
    );
  }

  Widget _buildSuccess() {
    return Column(
      children: [
        Container(
          height: 90.w,
          width: double.infinity,
          color: AppColors.cFFFFFF,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 17.w),
          child: Text(
            "SUCCESS",
            style: 40.w5(
              color: AppColors.c000000,
              height: 1,
              fontFamily: FontFamily.fOswaldMedium,
            ),
          ),
        ),
        21.vGap,

        /// todo 球员卡和球员交易折线图
        Expanded(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                bottom: 35.w,
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
                ))
          ],
        ))
      ],
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
        Container(
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
        Divider(
          color: AppColors.cD1D1D1,
          height: 1.w,
        ),
        Expanded(
          child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 18.w, horizontal: 16.w),
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
                return _buildItem(
                  playBaseInfo,
                  player,
                );
              }),
        )
      ],
    );
  }

  Column _buildItem(
      NbaPlayerInfosPlayerBaseInfoList playBaseInfo, StealTeamPlayers player) {
    return Column(
      children: [
        MtInkWell(
          onTap: () => controller.onItemTap(player, playBaseInfo),
          child: _buildCard(playBaseInfo, player),
        ),
        10.vGap,
        Container(
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
        )
      ],
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
                PlayerStartWidget(
                  grade: player.breakThroughGrade,
                  height: 15,
                ),
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
