/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-21 20:11:25
 * @LastEditTime: 2025-03-07 17:11:47
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/training_new_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/card_rule_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PreparationTip extends StatelessWidget {
  const PreparationTip({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleBottomDialog(
        height: 473.w,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                height: 43.w,
                alignment: Alignment.bottomCenter,
                color: AppColors.cFFFFFF,
                width: double.infinity,
                child: TabBar(
                    isScrollable: false,
                    labelColor: AppColors.c000000,
                    labelPadding: EdgeInsets.zero,
                    // indicatorPadding: EdgeInsets.only(top: 5.w),
                    labelStyle: 16.w4(fontFamily: FontFamily.fOswaldMedium),
                    unselectedLabelStyle:
                        16.w4(fontFamily: FontFamily.fOswaldRegular),
                    unselectedLabelColor: AppColors.cB3B3B3,
                    dividerHeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(color: AppColors.cFF7954, width: 3.w)),
                    indicatorWeight: 3.w,
                    tabs: ["PREPARATION", "TACTICS GRADE"]
                        .map((e) => Tab(text: e))
                        .toList()),
              ),
              Expanded(
                  child: TabBarView(children: [
                PreparationTipTab(),
                CardRuleDialog(),
              ]))
            ],
          ),
        ));
  }
}

class PreparationTipTab extends StatefulWidget {
  const PreparationTipTab({super.key});

  @override
  State<PreparationTipTab> createState() => _PreparationTipTabState();
}

class _PreparationTipTabState extends State<PreparationTipTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final List<int> statusList = [105, 104, 103, 102, 101];
    return GetBuilder<TrainingController>(builder: (ctrl) {
      return Column(
        children: [
          43.vGap,
          Text(
            "${(ctrl.trainingInfo.playerReadiness * 100).toStringAsFixed(1)}%",
            style: 39.w4(
              fontFamily: FontFamily.fOswaldBold,
              height: 0.8,
            ),
          ),
          17.5.vGap,
          // PreparationWidget(playerReadiness: ctrl.trainingInfo.playerReadiness),
          34.vGap,
          Container(
            width: 323.w,
            height: 74.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                color: AppColors.cF2F2F2,
                borderRadius: BorderRadius.circular(8.w)),
            child: Row(
              children: [
                Text(
                  "Tactics",
                  style: 19.w4(fontFamily: FontFamily.fOswaldMedium),
                ),
                14.5.hGap,
                Expanded(
                    child: SizedBox(
                  height: 49.w,
                  child: Row(
                    children: [
                      ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return SmallTacticCard(
                              color: ctrl.trainingInfo.buff[index].color,
                              num: ctrl.trainingInfo.buff[index].face,
                              width: 35.5.w,
                            );
                          },
                          separatorBuilder: (context, index) => 3.hGap,
                          itemCount: ctrl.trainingInfo.buff.length),
                      9.5.hGap,
                      SizedBox(
                        height: 41.5.w,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                width: 30.5.w,
                                height: 41.5.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    color: AppColors.cDDDDDD),
                                child: Image.asset(
                                  Assets.managerUiManagerTacticsIconEmpty,
                                  color: AppColors.cB2B2B2,
                                  width: 16.w,
                                  height: 16.w,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => 3.hGap,
                            itemCount: 5 - ctrl.trainingInfo.buff.length),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          10.vGap,
          Container(
            width: 323.w,
            height: 74.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                color: AppColors.cF2F2F2,
                borderRadius: BorderRadius.circular(8.w)),
            child: Row(
              children: [
                Text(
                  "Status",
                  style: 19.w4(fontFamily: FontFamily.fOswaldMedium),
                ),
                24.5.hGap,
                Expanded(
                  child: GetBuilder<TeamController>(
                      // init: TeamController(),
                      builder: (teamCtrl) {
                    return ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          int count = teamCtrl.myTeamEntity.teamPlayers
                              .where((e) => e.playerStatus == statusList[index])
                              .length;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconWidget(
                                  iconWidth: 25.w,
                                  icon: Utils.getStatusUrl(statusList[index])),
                              2.vGap,
                              Text(
                                "$count",
                                style: 17.w4(
                                    height: 1,
                                    fontFamily: FontFamily.fRobotoMedium,
                                    color: AppColors.c000000),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => 13.hGap,
                        itemCount: statusList.length);
                  }),
                ),
              ],
            ),
          ),
          Container(
            width: 323.w,
            margin: EdgeInsets.symmetric(horizontal: 33.w, vertical: 31.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TIPS:",
                  style: 14.w4(
                      fontFamily: FontFamily.fOswaldMedium,
                      color: AppColors.cB3B3B3,
                      height: 1),
                ),
                15.5.vGap,
                Text(
                  "1.We can prepare better for the upcoming match.",
                  style: 12.w4(
                      fontFamily: FontFamily.fRobotoMedium,
                      color: AppColors.cB3B3B3,
                      height: 1),
                ),
              ],
            ),
          )
        ],
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
