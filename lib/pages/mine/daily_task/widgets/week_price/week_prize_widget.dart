import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/controller.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/week_price/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/1/13/20:12

class WeekPrizeWidget extends GetView<WeekPrizeController> {
  WeekPrizeWidget({super.key});

  late DailyTaskController dailyTaskController;

  @override
  Widget build(BuildContext context) {
    dailyTaskController = Get.find();
    return GetBuilder<WeekPrizeController>(
        init: WeekPrizeController(),
        builder: (logic) {
          return Column(
            children: [
              Expanded(
                child: InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      width: double.infinity,
                    )),
              ),
              Container(
                height: 534.w,
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(9.w),
                  ),
                ),
                child: Column(
                  children: [
                    const DialogTopBtn(),
                    17.vGap,
                    Container(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Week Prize",
                            style: 19.w5(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fOswaldMedium,
                            ),
                          ),
                          Row(
                            children: [
                              IconWidget(
                                  iconWidth: 16.w,
                                  icon: Assets.commonUiCommonCountdown02),
                              Obx(() {
                                return Container(
                                  width: 93.w,
                                  margin: EdgeInsets.only(left: 6.w),
                                  child: Text(
                                    controller.formatDuration(
                                        controller.lastDuration.value),
                                    style: 16.w4(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldRegular,
                                    ),
                                  ),
                                );
                              })
                            ],
                          )
                        ],
                      ),
                    ),
                    9.vGap,
                    Divider(
                      color: AppColors.cD1D1D1,
                      height: 1.w,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 46.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            15.vGap,
                            SizedBox(
                              width: 29.w,
                              height: 29.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconWidget(
                                      iconWidth: 24.w,
                                      icon: Assets.commonUiCommonIconTask),
                                ],
                              ),
                            ),
                            3.vGap,
                            ...List.generate(
                                dailyTaskController.weekMissionList.length,
                                (index) {
                              bool isFirst = index == 0;
                              bool isLast = index ==
                                  dailyTaskController.weekMissionList.length -
                                      1;
                              int level = dailyTaskController
                                      .getWeekFinishMission()
                                      .length -
                                  1;
                              var item =
                                  dailyTaskController.weekMissionList[index];
                              return Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    child: Container(
                                      width: 29.w,
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 9.w,
                                        decoration: BoxDecoration(
                                          color: index > level
                                              ? AppColors.cFFFFFF
                                              : AppColors.c000000,
                                          borderRadius: isFirst
                                              ? BorderRadius.vertical(
                                                  top: Radius.circular(4.5.w))
                                              : isLast
                                                  ? BorderRadius.vertical(
                                                      bottom: Radius.circular(
                                                          4.5.w))
                                                  : null,
                                          border: Border(
                                              left: BorderSide(
                                                color: AppColors.cD1D1D1,
                                                width: 1.w,
                                              ),
                                              right: BorderSide(
                                                color: AppColors.cD1D1D1,
                                                width: 1.w,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 64.w,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: 29.w,
                                              height: 29.w,
                                              decoration: BoxDecoration(
                                                color: index > level
                                                    ? AppColors.cTransparent
                                                    : AppColors.cFFFFFF,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        14.5.w),
                                              ),
                                            ),
                                            Container(
                                              width: 23.w,
                                              height: 23.w,
                                              decoration: BoxDecoration(
                                                color: index > level
                                                    ? AppColors.cFFFFFF
                                                    : AppColors.c000000,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        11.5.w),
                                                border: index > level
                                                    ? Border.all(
                                                        color:
                                                            AppColors.cD1D1D1,
                                                        width: 1.w,
                                                      )
                                                    : null,
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "${index + 1}",
                                                style: 14.w5(
                                                  color: index > level
                                                      ? AppColors.c000000
                                                      : AppColors.cFFFFFF,
                                                  height: 1,
                                                  fontFamily:
                                                      FontFamily.fOswaldMedium,
                                                ),
                                              )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 236.w,
                                        height: 64.w,
                                        margin: EdgeInsets.only(
                                            top: isFirst ? 5.w : 19.w),
                                        padding: EdgeInsets.only(
                                            left: 23.w, right: 18.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.cFFFFFF,
                                          borderRadius:
                                              BorderRadius.circular(9.w),
                                          border: Border.all(
                                            color: AppColors.c10A86A,
                                            width: 1.w,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Builder(builder: (context) {
                                              var list = dailyTaskController
                                                  .getAwardList(item
                                                      .missionDefineEntity
                                                      .awardData);
                                              return Row(
                                                children: List.generate(
                                                    list.length, (index) {
                                                  var awardItem = list[index];
                                                  return Row(
                                                    children: [
                                                      IconWidget(
                                                          iconWidth: 43.w,
                                                          icon: dailyTaskController
                                                              .getImageByAward(
                                                                  awardItem)),
                                                      14.hGap,
                                                      Text(
                                                        dailyTaskController
                                                            .getPropNum(
                                                                awardItem),
                                                        style: 14.w4(
                                                          color:
                                                              AppColors.c000000,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fRobotoRegular,
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                }),
                                              );
                                            }),
                                            Builder(builder: (context) {
                                              if (item.teamMissionEntity
                                                      .status ==
                                                  1) {
                                                return const SizedBox.shrink();
                                              }
                                              if (item.teamMissionEntity
                                                      .status ==
                                                  2) {
                                                return MtInkWell(
                                                  onTap: () {
                                                    dailyTaskController
                                                        .getTeamMissionAward(item
                                                            .teamMissionEntity
                                                            .missionDefineId);
                                                  },
                                                  child: Container(
                                                    width: 55.w,
                                                    height: 29.w,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.c000000,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7.w),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "GET",
                                                        style: 14.w5(
                                                          color:
                                                              AppColors.cFFFFFF,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fOswaldMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              return IconWidget(
                                                iconWidth: 21.w,
                                                icon: Assets
                                                    .commonUiCommonStatusBarMission02,
                                                iconColor: AppColors.c10A86A,
                                              );
                                            })
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              );
                            }),
                            9.vGap,
                            SizedBox(
                              height: MediaQuery.of(context).padding.bottom,
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              )
            ],
          );
        });
  }
}
