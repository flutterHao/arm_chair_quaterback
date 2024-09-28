import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/28/19:06

class DataBattleBeforeGame extends StatefulWidget {
  const DataBattleBeforeGame({super.key});

  @override
  State<DataBattleBeforeGame> createState() => _DataBattleBeforeGameState();
}

class _DataBattleBeforeGameState extends State<DataBattleBeforeGame>
    with SingleTickerProviderStateMixin {
  late TeamBattleController controller;

  late AnimationController animationController;

  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animation.addListener(() {
      setState(() {});
    });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    return Transform.scale(
      scale: animation.value,
      child: Opacity(
        opacity: animation.value,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.cE6E6E6,
              image: DecorationImage(
                  image: AssetImage(Assets.uiBgBattleJpg),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter)),
          child: Stack(
            children: [
              _buildHeader(),
              Positioned(
                  bottom: 40.w,
                  left: 15.w,
                  right: 15.w,
                  child: Container(
                    width: double.infinity,
                    height: 331.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 46.w),
                    decoration: BoxDecoration(
                        color: AppColors.c262626,
                        borderRadius: BorderRadius.circular(20.w)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        return Row(
                          children: [
                            Text(
                              "75%",
                              style: 14.w7(color: AppColors.c3B93FF),
                            ),
                            13.hGap,
                            Expanded(
                              child: SizedBox(
                                height: 8.w,
                                child: LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(4.w),
                                  value: .75,
                                  color: AppColors.c3B93FF,
                                  backgroundColor: AppColors.c666666,
                                ),
                              ),
                            ),
                            SizedBox(
                                width: 40.w,
                                child: Center(
                                    child: Text(
                                  "POINT",
                                  style: 10.w4(color: AppColors.c666666),
                                ))),
                            Expanded(
                              child: SizedBox(
                                height: 8.w,
                                child: LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(4.w),
                                  value: .3,
                                  color: AppColors.cB2B2B2,
                                  backgroundColor: AppColors.c666666,
                                ),
                              ),
                            ),
                            13.hGap,
                            Text(
                              "30%",
                              style: 14.w7(color: AppColors.cFF7954),
                            ),
                          ],
                        );
                      }),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      height: 119.w,
      padding: EdgeInsets.only(top: 32.w, left: 20.w, right: 20.w),
      decoration: BoxDecoration(
          color: AppColors.c262626,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32.w),
              bottomRight: Radius.circular(32.w))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "ME",
                        style: 10.w4(color: AppColors.c3B93FF, height: 1),
                      ),
                      Text(
                        "USERNAME",
                        style: 14.w7(color: AppColors.cF2F2F2, height: 1),
                      )
                    ],
                  ),
                  10.hGap,
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.w),
                      child: IconWidget(
                          iconWidth: 36.w, icon: controller.meAvatar)),
                ],
              ),
              Container(
                width: 57.w,
                alignment: Alignment.center,
                child: Text(
                  "VS",
                  style: 24.w7(color: AppColors.c8A8A8A),
                ),
              ),
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.w),
                      child: IconWidget(
                          iconWidth: 36.w, icon: controller.opponentAvatar)),
                  10.hGap,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ME",
                        style: 10.w4(color: AppColors.cFF7954, height: 1),
                      ),
                      Text(
                        "USERNAME",
                        style: 14.w7(color: AppColors.cF2F2F2, height: 1),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          5.vGap,
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 20.w,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                      color: AppColors.c666666,
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "OVR",
                        style: 14.w4(color: AppColors.cF2F2F2, height: 1),
                      ),
                      Text(
                        "75%",
                        style: 14.w4(color: AppColors.cF2F2F2, height: 1),
                      )
                    ],
                  ),
                ),
              ),
              51.hGap,
              Expanded(
                child: Container(
                  height: 20.w,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                      color: AppColors.c666666,
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "75%",
                        style: 14.w4(color: AppColors.cF2F2F2, height: 1),
                      ),
                      Text(
                        "OVR",
                        style: 14.w4(color: AppColors.cF2F2F2, height: 1),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
