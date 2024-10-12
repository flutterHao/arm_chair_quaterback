import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/player.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/score_panel.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/statistic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/30/17:31

class BattleGameOver extends StatefulWidget {
  const BattleGameOver({super.key});

  @override
  State<BattleGameOver> createState() => _BattleGameOverState();
}

class _BattleGameOverState extends State<BattleGameOver>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  List<String> tabTitles = ["Statistic", "Player"];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.ce5e5e5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 250.h,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 34.h,
                constraints: BoxConstraints(maxWidth: 349.w),
                margin: EdgeInsets.only(bottom: 16.h),
                padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.h),
                    border: Border.all(color: AppColors.c808080, width: 1.w)),
                child: Stack(
                  alignment: FractionalOffset.centerLeft,
                  children: [
                    LayoutBuilder(builder: (context, constraints) {
                      return TLBuildWidget(
                          controller: tabController,
                          builder: (current, next, progress, totalProgress) {
                            return Container(
                              height: 26.h,
                              width: constraints.maxWidth / tabTitles.length,
                              margin: EdgeInsets.only(
                                  left:
                                      totalProgress * constraints.maxWidth / 2),
                              decoration: BoxDecoration(
                                  color: AppColors.c262626,
                                  borderRadius: BorderRadius.circular(17.w)),
                            );
                          });
                    }),
                    Row(
                      children: tabTitles.map((e) {
                        int index = tabTitles.indexOf(e);
                        return Flexible(
                            child: TLBuildWidget(
                                controller: tabController,
                                builder: (current, next, progress, _) {
                                  return InkWell(
                                    onTap: () => tabController.animateTo(index),
                                    child: Center(
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                            color: current == index
                                                ? Color.lerp(AppColors.cF2F2F2,
                                                    AppColors.c262626, progress)
                                                : next == index
                                                    ? Color.lerp(
                                                        AppColors.c262626,
                                                        AppColors.cF2F2F2,
                                                        progress)
                                                    : AppColors.c262626,
                                            fontSize: 13.sp),
                                      ),
                                    ),
                                  );
                                }));
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 300.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: TabBarView(
                controller: tabController,
                children: const [Statistic(), Player()]),
          ),
          Positioned(
              bottom: 36.h,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: SizedBox(
                  width: 203.w,
                  child: BtnBackground(
                      child: Center(
                          child: Text(
                    "GO BACK",
                    style: 18.w7(color: AppColors.cF2F2F2),
                  ))),
                ),
              ))
        ],
      ),
    );
  }
}
