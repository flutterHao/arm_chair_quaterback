import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/pk_event_updated_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/WidgetUtils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_leader/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_leader/widget/player_detail.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team%20new/widgets/player_item_widget.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/6/15:54

class GameLeaderWidget extends StatelessWidget {
  const GameLeaderWidget({super.key, required this.controller, this.title});

  final String? title;

  final GameLeaderController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameLeaderController>(builder: (logic) {
      return Container(
        margin: EdgeInsets.only(top: 9.w),
        decoration: BoxDecoration(
            color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
        child: Column(
          children: [
            25.vGap,
            Container(
              margin: EdgeInsets.only(left: 16.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title ?? "GAME LEADERS",
                    style: 30.w7(
                        color: AppColors.c000000,
                        fontFamily: FontFamily.fOswaldBold),
                  ),
                  // Container(
                  //   width: 24.w,
                  //   height: 24.w,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(4.w),
                  //       border:
                  //           Border.all(color: AppColors.c666666, width: 1)),
                  //   child: IconWidget(
                  //     iconWidth: 15.w,
                  //     icon: Assets.commonUiCommonIconSystemShare,
                  //     iconColor: AppColors.c000000,
                  //   ),
                  // )
                ],
              ),
            ),
            27.vGap,
            Container(
              height: 28.w,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              child: TLBuildWidget(
                  controller: controller.tabController,
                  builder: (int current, int next, double progress,
                      double totalProgress) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.tabTitles.map((e) {
                        int index = controller.tabTitles.indexOf(e);
                        Widget child = MtInkwell(
                          splashColor: AppColors.cTransparent,
                          vibrate: false,
                          onTap: () {
                            if (controller.tabController.index != index) {
                              controller.tabController.animateTo(index);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.w),
                                border: Border.all(
                                    color: AppColors.c666666, width: 1),
                                color: index == current
                                    ? Color.lerp(AppColors.c000000,
                                        AppColors.cFFFFFF, progress)
                                    : index == next
                                        ? Color.lerp(AppColors.cFFFFFF,
                                            AppColors.c000000, progress)
                                        : AppColors.cFFFFFF),
                            child: Text(e,
                                style: 16.w4(
                                  color: index == current
                                      ? Color.lerp(AppColors.cFFFFFF,
                                          AppColors.c000000, progress)!
                                      : index == next
                                          ? Color.lerp(AppColors.c000000,
                                              AppColors.cFFFFFF, progress)!
                                          : AppColors.c000000,
                                )),
                          ),
                        );
                        if (index == 0) {
                          child = Container(
                            margin: EdgeInsets.only(right: 2.5.w),
                            child: child,
                          );
                        } else if (index == 1) {
                          child = Container(
                            margin: EdgeInsets.only(left: 2.5.w, right: 2.5.w),
                            child: child,
                          );
                        } else {
                          child = Container(
                            margin: EdgeInsets.only(left: 2.5.w),
                            child: child,
                          );
                        }
                        return Expanded(child: child);
                      }).toList(),
                    );
                  }),
            ),
            10.vGap,
            const Divider(
              color: AppColors.cD1D1D1,
              height: 1,
            ),
            SizedBox(
              height: 314.w,
              child: ExtendedTabBarView(
                  controller: controller.tabController,
                  children: controller.tabTitles.map((e) {
                    var index = controller.tabTitles.indexOf(e);
                    String tab = index == 0
                        ? "pts"
                        : index == 1
                            ? "reb"
                            : "ast";
                    List<GameLeader> list = controller.getTwoMaxByTab(tab);
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          if (list.isEmpty)
                            SizedBox(
                              height: 132.w * 2,
                              child: const Center(
                                child: LoadStatusWidget(
                                  loadDataStatus: LoadDataStatus.noData,
                                ),
                              ),
                            )
                          else
                            ...List.generate(list.length, (i) {
                              var item = list[i];
                              var playBaseInfo = Utils.getPlayBaseInfo(
                                  item.playerInfo.playerId);
                              var teamInfo =
                                  Utils.getTeamInfo(playBaseInfo.teamId);
                              List<Widget> child;
                              List<Map<String, String>> values = [];
                              if (index == 0) {
                                values.addAll([
                                  {"PTS": "${item.playerInfo.pts}"},
                                  {
                                    "FG":
                                        "${item.playerInfo.fgm}/${item.playerInfo.fga}"
                                  },
                                  {
                                    "FT":
                                        "${item.playerInfo.ftm}/${item.playerInfo.fta}"
                                  }
                                ]);
                              } else if (index == 1) {
                                values.addAll([
                                  {"REB": "${item.playerInfo.reb}"},
                                  {"DERB": "${item.playerInfo.dreb}"},
                                  {"OREB": "${item.playerInfo.oreb}"}
                                ]);
                              } else {
                                values.addAll([
                                  {"AST": "${item.playerInfo.ast}"},
                                  {"TO": "${item.playerInfo.to}"},
                                  {"MIN": "${item.playerInfo.min}"}
                                ]);
                              }
                              return MtInkwell(
                                minScale: 1,
                                onTap: () {
                                  Get.toNamed(
                                    RouteNames.picksPlayerDetail,
                                    arguments: PlayerDetailPageArguments(
                                        item.playerInfo.playerId),
                                  );
                                },
                                child: Container(
                                  height: 132.w,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.cE6E6E,
                                              width: 1))),
                                  child: Row(
                                    children: [
                                      13.hGap,
                                      PlayerCard(
                                        width: 73.w,
                                        height: 93.w,
                                        playerId: item.playerInfo.playerId,
                                        grade: Utils.getPlayBaseInfo(
                                                item.playerInfo.playerId)
                                            .grade,
                                        level:
                                            controller.getMvpBreakThroughGrade(
                                                item.teamInfo.teamId,
                                                item.playerInfo.playerId),
                                      ),
                                      13.hGap,
                                      Expanded(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            playBaseInfo.ename,
                                            style: 21.w5(
                                                color: AppColors.c262626,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fOswaldMedium),
                                          ),
                                          7.vGap,
                                          Text(
                                            "${playBaseInfo.position} · ${teamInfo.shortEname}",
                                            style: 12.w4(
                                                color: AppColors.c000000,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fRobotoRegular),
                                          ),
                                          16.vGap,
                                          Row(
                                            children: values
                                                .map((e) => Container(
                                                      margin: EdgeInsets.only(
                                                          right: 25.w),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            e.values.first,
                                                            style: 14.w5(
                                                                color: AppColors
                                                                    .c000000,
                                                                height: 1,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .fRobotoMedium),
                                                          ),
                                                          5.vGap,
                                                          Text(
                                                            e.keys.first,
                                                            style: 10.w4(
                                                                color: AppColors
                                                                    .c4D4D4D,
                                                                height: 1,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .fRobotoRegular),
                                                          )
                                                        ],
                                                      ),
                                                    ))
                                                .toList(),
                                          )
                                        ],
                                      )),
                                      SizedBox(
                                        width: 30.w,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                                top: 23.w,
                                                child: Container(
                                                  width: 21.w,
                                                  height: 21.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.5.w),
                                                      border: Border.all(
                                                          width: 1.w,
                                                          color: item.color)),
                                                  child: ImageWidget(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.5.w),
                                                      url: Utils.getAvaterUrl(
                                                          controller
                                                              .getBattleTeam(
                                                                  item.teamInfo
                                                                      .teamId)
                                                              .teamLogo)),
                                                )),
                                            IconWidget(
                                              iconWidth: 8.w,
                                              icon: Assets
                                                  .commonUiCommonIconSystemJumpto,
                                              iconColor: AppColors.c000000,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          Expanded(
                            child: MtInkwell(
                              onTap: () {
                                if (controller.event == null) {
                                  return;
                                }
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    backgroundColor: AppColors.cTransparent,
                                    builder: (_) {
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            WidgetUtils.getDialogTransWidget(
                                                context),
                                            Container(
                                              height: Utils.getDialogHeight(),
                                              decoration: BoxDecoration(
                                                  color: AppColors.cFFFFFF,
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              9.w))),
                                              child: Column(
                                                children: [
                                                  8.vGap,
                                                  Container(
                                                    width: 44.w,
                                                    height: 4.w,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.c000000
                                                            .withOpacity(.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.w)),
                                                  ),
                                                  24.vGap,
                                                  Expanded(
                                                    child: PlayerDetail(
                                                        controller.event!),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "SEE ALL",
                                    style: 16.w7(
                                        color: AppColors.c262626,
                                        height: 1,
                                        fontFamily: FontFamily.fOswaldBold),
                                  ),
                                  6.hGap,
                                  IconWidget(
                                    iconWidth: 5.w,
                                    icon: Assets.commonUiCommonIconSystemJumpto,
                                    iconColor: AppColors.c000000,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList()),
            )
          ],
        ),
      );
    });
  }
}
