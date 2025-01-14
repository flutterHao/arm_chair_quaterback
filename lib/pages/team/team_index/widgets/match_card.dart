/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-13 21:12:10
 * @LastEditTime: 2024-11-29 10:06:32
 */
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MatchCard extends GetView<TeamIndexController> {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 266.5.w,
      margin: EdgeInsets.only(top: 9.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.w), color: AppColors.cFFFFFF),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 25.w,
            left: 16.w,
            child: Text(
              "MATCH GAME",
              style: 30.w7(fontFamily: FontFamily.fOswaldBold, height: 0.75),
            ),
          ),
          Positioned(
            top: 72.w,
            right: 16.w,
            left: 16,
            bottom: 13.w,
            child: Image.asset(
              Assets.managerUiManagerMatchgameBg,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned(
            top: 60.w,
            child: Image.asset(
              width: 146.w,
              height: 135.w,
              Assets.managerUiManagerMatchgameImage,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 21.w,
            child: Row(
              children: [
                MtInkWell(
                    onTap: () {
                      Get.toNamed(RouteNames.seaonRankPage);
                    },
                    child: Container(
                      // color: Colors.red,
                      width: 81.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          12.hGap,
                          IconWidget(
                              iconWidth: 18.w,
                              icon: Assets.managerUiManagerIconCurrency04),
                          4.hGap,
                          Obx(() {
                            return Text("${controller.cup.value}",
                                style: 14.w7(color: AppColors.c000000));
                          }),
                          13.hGap,
                        ],
                      ),
                    )),

                ///比赛按钮
                MtInkWell(
                  vibrate: true,
                  minScale: 0.9,
                  onTap: () {
                    final teamCtrl = Get.find<TeamController>();
                    if (teamCtrl.myTeamEntity.salary >=
                        teamCtrl.myTeamEntity.salaryCap) {
                      BottomTipDialog.show(
                          context: context,
                          onTap: () {
                            Get.back();
                            Get.toNamed(RouteNames.teamMemberPage);
                          },
                          confirmStr: "LINE UP",
                          title: "SALARY CAP EXCEED",
                          desc:
                              "Salary cap over limit，please adjust the lineup  before the game can begin.");
                      return;
                    }
                    controller.matchBattle();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 181,
                        height: 41.w,
                        decoration: BoxDecoration(
                            color: AppColors.c000000,
                            borderRadius: BorderRadius.circular(9.w)),
                        alignment: Alignment.center,
                        child: Text(
                          "MATCH",
                          style: 19.w4(
                              color: AppColors.cFFFFFF,
                              fontFamily: FontFamily.fOswaldMedium),
                        ),
                      ),
                      Positioned(
                          right: 10.w,
                          child: IconWidget(
                            iconWidth: 15.w,
                            icon: Assets.playerUiIconTriangle03,
                            iconColor: AppColors.cFFFFFF,
                            rotateAngle: 90,
                          ))
                    ],
                  ),
                ),

                Container(
                  width: 81.w,
                  alignment: Alignment.centerLeft,
                  // child: MtInkwell(
                  //   minScale: 0.9,
                  //   onTap: () {
                  //     showDialog(
                  //         context: Get.context!,
                  //         builder: (context) {
                  //           return const RecoverDialog();
                  //         });
                  //   },
                  //   child: Container(
                  //     width: 60.w,
                  //     height: 41.w,
                  //     alignment: Alignment.center,
                  //     margin: EdgeInsets.only(left: 8.w),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(9.w),
                  //       border: Border.all(color: AppColors.c666666),
                  //     ),
                  //     child: Image.asset(
                  //       Assets.managerUiManagerIconRecover,
                  //       width: 30.w,
                  //     ),
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
