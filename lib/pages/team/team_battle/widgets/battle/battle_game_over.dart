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

  List<String> tabs = ["Statistic", "Player"];

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
                constraints: BoxConstraints(maxWidth: 400.w),
                height: 34.w,
                margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.w),
                decoration: BoxDecoration(
                    color: AppColors.cEFEFEF,
                    borderRadius: BorderRadius.circular(17.w),
                  border: Border.all(color: AppColors.cB3B3B3,width: 1)
                ),
                child: LayoutBuilder(builder: (context, constraints) {
                  var itemWidth =
                      (constraints.maxWidth - 8.w) / tabController.length;
                  return TLBuildWidget(
                      controller: tabController,
                      builder: (current, next, progress, totalProgress) {
                        return Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Positioned(
                              left: totalProgress * itemWidth,
                              child: Container(
                                margin: EdgeInsets.only(left: 4.w),
                                height: 26.w,
                                width: itemWidth,
                                decoration: BoxDecoration(
                                    color: AppColors.c262626,
                                    borderRadius: BorderRadius.circular(26.w)),
                              ),
                            ),
                            Row(
                              children: List.generate(
                                  tabs.length,
                                  (index) => Expanded(
                                        child: InkWell(
                                            onTap: () =>
                                                tabController.animateTo(index),
                                            child: Center(
                                                child: Text(tabs[index],
                                                    style: 13.w4(
                                                      color: current == index
                                                          ? Color.lerp(
                                                              AppColors.cF2F2F2,
                                                              AppColors.c666666,
                                                              progress)!
                                                          : next == index
                                                              ? Color.lerp(
                                                                  AppColors
                                                                      .c666666,
                                                                  AppColors
                                                                      .cF2F2F2,
                                                                  progress)!
                                                              : AppColors
                                                                  .c666666,
                                                    )))),
                                      )),
                            )
                          ],
                        );
                      });
                }),
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
