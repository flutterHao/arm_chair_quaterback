import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/controller.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/week_price/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/award_bottomsheet.dart';
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
                            LangKey.dailyTaksMeanWeekReward.tr,
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
                      child: Column(
                        children: [
                          20.vGap,
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.w),
                                border: Border.all(
                                  color: AppColors.c000000,
                                  width: 1.w,
                                )),
                            height: 92.w,
                            width: 343.w,
                            clipBehavior: Clip.hardEdge,
                            child: Row(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: 55.w,
                                      color: Colors.black,
                                      child: Column(
                                        children: [
                                          Spacer(),
                                          IconWidget(iconWidth: 24.h, icon: Assets.inboxUiInboxIconAward),
                                          SizedBox(height: 6.h),
                                          Text(
                                            'AWARD',
                                            style: 12.w5(color: Colors.white, fontFamily: FontFamily.fOswaldRegular),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        right: -7.w,
                                        top: 40.h,
                                        child: CustomPaint(
                                          size: Size(8.w, 12.h), // 设置三角形的大小
                                          painter: TrianglePainter(color: Colors.black),
                                        )),
                                    Positioned(
                                        right: -3.w,
                                        top: 41.h,
                                        child: CustomPaint(
                                          size: Size(6.w, 10.h), // 设置三角形的大小
                                          painter: TrianglePainter(color: AppColors.cFF7954),
                                        ))
                                  ],
                                ),
                                Expanded(child: Builder(builder: (context) {
                                  var list = dailyTaskController.getAwardList(
                                      dailyTaskController.weekMissionList.last
                                          .missionDefineEntity.awardData);
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children:
                                        List.generate(list.length, (index) {
                                      var awardItem = list[index];
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconWidget(
                                              iconWidth: 43.w,
                                              icon: dailyTaskController
                                                  .getImageByAward(awardItem)),
                                          12.vGap,
                                          Text(
                                            dailyTaskController
                                                .getPropNum(awardItem),
                                            style: 14.w4(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fRobotoRegular,
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                                  );
                                }))
                              ],
                            ),
                          ),
                          15.vGap,
                          Divider(
                            color: AppColors.cD1D1D1,
                            height: 1.w,
                          ),
                          19.vGap,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 46.w),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...List.generate(
                                    dailyTaskController.weekMissionList.length -
                                        1, (i) {
                                  int index = dailyTaskController
                                          .weekMissionList.length -
                                      2 -
                                      i;
                                  bool isFirst = index ==
                                      dailyTaskController
                                              .weekMissionList.length -
                                          2;
                                  bool isLast = index == 0;
                                  var item = dailyTaskController
                                      .weekMissionList[index];
                                  bool isActive = dailyTaskController
                                          .getCostLuckyCoinNum() <
                                      item.missionDefineEntity.targetNum;
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
                                              color: isActive
                                                  ? AppColors.cFFFFFF
                                                  : AppColors.c000000,
                                              borderRadius: isFirst
                                                  ? BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          4.5.w))
                                                  : isLast
                                                      ? BorderRadius.vertical(
                                                          bottom:
                                                              Radius.circular(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
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
                                                    color: isActive
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
                                                    color: isActive
                                                        ? AppColors.cFFFFFF
                                                        : AppColors.c000000,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            11.5.w),
                                                    border: isActive
                                                        ? Border.all(
                                                            color: AppColors
                                                                .cD1D1D1,
                                                            width: 1.w,
                                                          )
                                                        : null,
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    "${item.missionDefineEntity.targetNum}",
                                                    style: 14.w5(
                                                      color: isActive
                                                          ? AppColors.c000000
                                                          : AppColors.cFFFFFF,
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fOswaldMedium,
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
                                                top: isFirst ? 0 : 10.w,
                                                bottom: isLast ? 0 : 10.w),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Builder(builder: (context) {
                                                  var list = dailyTaskController
                                                      .getAwardList(item
                                                          .missionDefineEntity
                                                          .awardData);
                                                  return Row(
                                                    children: List.generate(
                                                        list.length, (index) {
                                                      var awardItem =
                                                          list[index];
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
                                                              color: AppColors
                                                                  .c000000,
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
                                                    return const SizedBox
                                                        .shrink();
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              AppColors.c000000,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      7.w),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            LangKey
                                                                .dailyTaksButtonGet
                                                                .tr,
                                                            style: 14.w5(
                                                              color: AppColors
                                                                  .cFFFFFF,
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
                                                    iconColor:
                                                        AppColors.c10A86A,
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
                                  height: Utils.getPaddingBottom(),
                                ),
                              ],
                            ),
                          ),
                          20.vGap,
                        ],
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
