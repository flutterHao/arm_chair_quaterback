/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-29 16:06:50
 * @LastEditTime: 2024-12-30 17:16:26
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_paint.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/dialog/rocover_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';

class RecoverDialog extends GetView<TeamController> {
  const RecoverDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamController>(builder: (_) {
      var mainList = controller.myTeamEntity.teamPlayers
          .where((e) => e.position > 0)
          .toList();
      var sublist = controller.myTeamEntity.teamPlayers
          .where((e) => e.position == 0)
          .toList();
      int cost = controller.getRecoverCost();

      return VerticalDragBackWidget(
        child: Container(
          height: 700.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9.w),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.5.w, bottom: 17.5.w),
                width: 44.w,
                height: 4.w,
                decoration: BoxDecoration(
                    color: AppColors.c000000.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(2.w)),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 105.w,
                        color: AppColors.cF2F2F2,
                        child: Row(
                          children: [
                            29.5.hGap,
                            CircularPowerWidet(),
                            12.hGap,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "TEAM Morale".toUpperCase(),
                                  style: 21.w4(
                                      fontFamily: FontFamily.fOswaldMedium,
                                      height: 0.8),
                                ),
                                11.5.vGap,
                                Row(
                                  children: [
                                    Text(
                                      "auto recover".toUpperCase(),
                                      style: 12.w4(
                                          fontFamily: FontFamily.fRobotoRegular,
                                          height: 0.8),
                                    ),
                                    7.hGap,
                                    if (controller.myTeamEntity.powerP < 100)
                                      Obx(() {
                                        return Text(
                                          controller.remainString.value,
                                          style: 12.w4(
                                              fontFamily:
                                                  FontFamily.fRobotoMedium,
                                              height: 0.8,
                                              color: AppColors.c10A86A),
                                        );
                                      })
                                  ],
                                ),
                              ],
                            ),
                            const Expanded(child: SizedBox.shrink()),
                            RecoverButtom(
                              money: cost,
                              onTap: () {
                                controller.recoverPower(cost: cost, type: 2);
                              },
                            ),
                            16.hGap,
                          ],
                        ),
                      ),
                      25.vGap,
                      Container(
                        margin: EdgeInsets.only(left: 29.5.w),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Main",
                          style: 24.w4(
                              color: AppColors.c262626,
                              height: 1,
                              fontFamily: FontFamily.fOswaldBold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.w),
                        width: double.infinity,
                        height: 1.w,
                        color: AppColors.cD1D1D1,
                      ),
                      ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 10.w),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return RecoverItem(item: mainList[index]);
                        },
                        separatorBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: 1.w,
                          color: AppColors.cE6E6E,
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                        ),
                        itemCount: mainList.length,
                      ),
                      20.vGap,
                      Container(
                        margin: EdgeInsets.only(left: 29.5.w),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Substitute",
                          style: 24.w4(
                              color: AppColors.c262626,
                              height: 1,
                              fontFamily: FontFamily.fOswaldBold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.w),
                        width: double.infinity,
                        height: 1.w,
                        color: AppColors.cD1D1D1,
                      ),
                      ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 10.w),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return RecoverItem(item: sublist[index]);
                        },
                        separatorBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: 1.w,
                          color: AppColors.cE6E6E,
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                        ),
                        itemCount: sublist.length,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class RecoverButtom extends StatelessWidget {
  const RecoverButtom({super.key, required this.money, required this.onTap});
  final int money;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              IconWidget(iconWidth: 16.w, icon: Assets.commonUiCommonProp05),
              2.5.hGap,
              AnimatedNum(
                number: money,
                isMoney: true,
                textStyle: 12.w4(fontFamily: FontFamily.fOswaldRegular),
              ),
            ],
          ),
          5.5.vGap,
          MtInkwell(
            onTap: () => onTap(),
            child: Container(
              width: 59.w,
              height: 40.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.c666666),
                borderRadius: BorderRadius.circular(9.w),
              ),
              child: IconWidget(
                  iconWidth: 22.w, icon: Assets.managerUiManagerIconRecover01),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularPowerWidet extends GetView<TeamController> {
  const CircularPowerWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleProgressView(
        progress: controller.myTeamEntity.powerP * 1.0,
        width: 55.w,
        height: 55.w,
        progressWidth: 4.5.w,
        progressColor: Utils.getProgressColor(controller.myTeamEntity.powerP),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWidget(
              iconWidth: 13.w,
              icon: Assets.managerUiManagerIconRecover,
            ),
            3.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedNum(
                  number: controller.myTeamEntity.powerP,
                  textStyle: 10.w4(),
                ),
                Text(
                  "%",
                  style: 10.w4(),
                )
              ],
            )
          ],
        ));
  }
}
