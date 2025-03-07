import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/game_result_info_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/small_player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryMvpWidget extends GetView<TeamHistortyController> {
  const HistoryMvpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      GameResultInfoPlayerResults pkResultUpdatedPlayer = controller.getMvpInfo();
      int breakThroughGrade =
          controller.getMvpBreakThroughGrade(pkResultUpdatedPlayer.teamId, pkResultUpdatedPlayer.playerId);
      Widget parent({required Widget child}) {
        return InkWell(
          onTap: () {
            if (pkResultUpdatedPlayer.teamId == Get.find<HomeController>().userEntiry.teamLoginInfo?.team?.teamId) {
              Get.toNamed(RouteNames.teamTeamUpgrade, arguments: {
                "playerUuid": controller
                    .getTeamPlayerInfoEntityByPlayerId(pkResultUpdatedPlayer.teamId, pkResultUpdatedPlayer.playerId)
                    .uuid
              });
            } else {
              Get.toNamed(RouteNames.picksPlayerDetail,
                  arguments: PlayerDetailPageArguments(pkResultUpdatedPlayer.playerId));
            }
          },
          child: Container(
            height: 165.w,
            margin: EdgeInsets.only(bottom: 9.w),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.w), color: AppColors.cFFFFFF),
            child: child,
          ),
        );
      }

      if (controller.isLeftWin()) {
        return parent(
          child: Stack(
            children: [
              Positioned(
                  top: 23.w,
                  right: 21.w,
                  child: IconWidget(
                    iconWidth: 14.w,
                    icon: Assets.commonUiCommonIconSystemInfo,
                    iconColor: AppColors.c000000,
                  )),
              Positioned(
                bottom: -12.w,
                right: -8.w,
                child: Text(
                  "MVP",
                  style: 100.w7(color: AppColors.cF2F2F2, height: 1, fontFamily: FontFamily.fOswaldBold),
                ),
              ),
              Row(
                children: [
                  17.hGap,
                  SmallPlayerCard(playerId: pkResultUpdatedPlayer.playerId, breakThroughGrade: breakThroughGrade),
                  15.hGap,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "MVP",
                              style: 40.w7(color: AppColors.cFF7954, height: 1, fontFamily: FontFamily.fOswaldBold),
                            ),
                            10.hGap,
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: controller.isLeftWin() ? AppColors.c1F8FE5 : AppColors.cD60D20,
                                    width: 1.w,
                                  ),
                                  borderRadius: BorderRadius.circular(12.w)),
                              child: ImageWidget(
                                url: Utils.getAvatarUrl(controller.gameResultInfoEntity.homeTeamResult.teamLogo),
                                width: 21.w,
                                height: 21.w,
                                imageFailedPath: Assets.teamUiHead01,
                                borderRadius: BorderRadius.circular(11.w),
                              ),
                            )
                          ],
                        ),
                        20.vGap,
                        Text(
                          Utils.getPlayBaseInfo(pkResultUpdatedPlayer.playerId).ename,
                          style: 27.w7(color: AppColors.c262626, fontFamily: FontFamily.fOswaldBold, height: 1),
                        ),
                        9.vGap,
                        Row(
                          children: [
                            Column(
                              children: [
                                Text("${pkResultUpdatedPlayer.pts}",
                                    style: 14
                                        .w5(color: AppColors.c000000, height: 1, fontFamily: FontFamily.fRobotoMedium)),
                                4.vGap,
                                Text(
                                  "PTS",
                                  style:
                                      10.w4(color: AppColors.c4D4D4D, height: 1, fontFamily: FontFamily.fRobotoRegular),
                                )
                              ],
                            ),
                            22.hGap,
                            Column(
                              children: [
                                Text("${pkResultUpdatedPlayer.reb}",
                                    style: 14
                                        .w5(color: AppColors.c000000, height: 1, fontFamily: FontFamily.fRobotoMedium)),
                                4.vGap,
                                Text(
                                  "REB",
                                  style:
                                      10.w4(color: AppColors.c4D4D4D, height: 1, fontFamily: FontFamily.fRobotoRegular),
                                )
                              ],
                            ),
                            22.hGap,
                            Column(
                              children: [
                                Text("${pkResultUpdatedPlayer.ast}",
                                    style: 14
                                        .w5(color: AppColors.c000000, height: 1, fontFamily: FontFamily.fRobotoMedium)),
                                4.vGap,
                                Text(
                                  "AST",
                                  style:
                                      10.w4(color: AppColors.c4D4D4D, height: 1, fontFamily: FontFamily.fRobotoRegular),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }
      return parent(
        child: Stack(
          children: [
            Positioned(
                top: 23.w,
                left: 21.w,
                child: IconWidget(
                  iconWidth: 14.w,
                  icon: Assets.commonUiCommonIconSystemInfo,
                  iconColor: AppColors.c000000,
                )),
            Positioned(
              bottom: -12.w,
              left: -20.w,
              child: Text(
                "MVP",
                style: 100.w7(color: AppColors.cF2F2F2, height: 1, fontFamily: FontFamily.fOswaldBold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: controller.isLeftWin() ? AppColors.c1F8FE5 : AppColors.cD60D20,
                                  width: 1.w,
                                ),
                                borderRadius: BorderRadius.circular(12.w)),
                            child: ImageWidget(
                              url: Utils.getAvatarUrl(controller.gameResultInfoEntity.awayTeamResult.teamLogo),
                              width: 21.w,
                              height: 21.w,
                              imageFailedPath: Assets.teamUiHead01,
                              borderRadius: BorderRadius.circular(11.w),
                            ),
                          ),
                          10.hGap,
                          Text(
                            "MVP",
                            style: 40.w7(color: AppColors.cFF7954, height: 1, fontFamily: FontFamily.fOswaldBold),
                          ),
                        ],
                      ),
                      15.vGap,
                      Text(
                        Utils.getPlayBaseInfo(pkResultUpdatedPlayer.playerId).ename,
                        textAlign: TextAlign.end,
                        style: 27.w7(color: AppColors.c262626, fontFamily: FontFamily.fOswaldBold, height: 1),
                      ),
                      13.vGap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text("${pkResultUpdatedPlayer.pts}",
                                  style:
                                      14.w5(color: AppColors.c000000, height: 1, fontFamily: FontFamily.fRobotoMedium)),
                              4.vGap,
                              Text(
                                "PTS",
                                style:
                                    10.w4(color: AppColors.c4D4D4D, height: 1, fontFamily: FontFamily.fRobotoRegular),
                              )
                            ],
                          ),
                          22.hGap,
                          Column(
                            children: [
                              Text("${pkResultUpdatedPlayer.reb}",
                                  style:
                                      14.w5(color: AppColors.c000000, height: 1, fontFamily: FontFamily.fRobotoMedium)),
                              4.vGap,
                              Text(
                                "REB",
                                style:
                                    10.w4(color: AppColors.c4D4D4D, height: 1, fontFamily: FontFamily.fRobotoRegular),
                              )
                            ],
                          ),
                          22.hGap,
                          Column(
                            children: [
                              Text("${pkResultUpdatedPlayer.ast}",
                                  style:
                                      14.w5(color: AppColors.c000000, height: 1, fontFamily: FontFamily.fRobotoMedium)),
                              4.vGap,
                              Text(
                                "AST",
                                style:
                                    10.w4(color: AppColors.c4D4D4D, height: 1, fontFamily: FontFamily.fRobotoRegular),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                15.hGap,
                SmallPlayerCard(playerId: pkResultUpdatedPlayer.playerId, breakThroughGrade: breakThroughGrade),
                17.hGap,
              ],
            ),
          ],
        ),
      );
    });
  }
}
