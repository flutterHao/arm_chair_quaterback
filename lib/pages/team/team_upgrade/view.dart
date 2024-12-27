import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/share_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/slot_dialog/slot_dialog_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/widgets/upgrade_header_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamUpgradePage extends GetView<TeamUpgradeController> {
  const TeamUpgradePage({required this.player, super.key});

  final TeamPlayerInfoEntity player;

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: GetBuilder<TeamUpgradeController>(
        init: TeamUpgradeController(player),
        builder: (_) {
          return BlackAppWidget(
            const UserInfoBar(
              showPop: true,
            ),
            bodyWidget: Expanded(
              child: Obx(() {
                if (controller.loadStatus.value != LoadDataStatus.success) {
                  return Center(
                    child: LoadStatusWidget(
                      loadDataStatus: controller.loadStatus.value,
                    ),
                  );
                }
                return Column(
                  children: [
                    const UpgradeHeaderWidget(),
                    Expanded(
                      child: _buildBaseInfo(context),
                    )
                  ],
                );
              }),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBaseInfo(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          9.vGap,
          Stack(
            children: [
              RepaintBoundary(
                key: controller.globalKey,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius: BorderRadius.circular(12.w)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      20.vGap,
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16.w),
                            child: Text(
                              "ABILITY",
                              style: 30.w7(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldBold),
                            ),
                          ),
                        ],
                      ),
                      26.vGap,
                      ...List.generate(
                          controller.upgradePlayerAbilityList.length, (index) {
                        var ability =
                            controller.upgradePlayerAbilityList[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 17.w),
                          child: Row(
                            children: [
                              29.hGap,
                              Expanded(
                                child: Text(
                                  ability.name,
                                  style: 16.w4(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldRegular),
                                ),
                              ),
                              SizedBox(
                                height: 12.w,
                                width: 235.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6.w),
                                  child: Builder(builder: (context) {
                                    double value = ability.maxValue;
                                    double total = value + 2000;
                                    double baseValue = ability.baseValue;
                                    double beforeUpgradeValue =
                                        ability.beforeValue;
                                    double afterUpgradeValue =
                                        ability.afterValue;
                                    double maxProgress = value / total;
                                    double baseProgress = baseValue / total;
                                    double beforeProgress =
                                        beforeUpgradeValue / total;
                                    double afterProgress =
                                        afterUpgradeValue / total;

                                    return Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        /// 边框
                                        Container(
                                          height: 12.w,
                                          width: 235.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6.w),
                                              border: Border.all(
                                                  color: AppColors.cD1D1D1,
                                                  width: 1.w)),
                                        ),
                                        AnimatedPositioned(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            left: -(235.w * (1 - maxProgress)),
                                            child: Container(
                                              width: 235.w,
                                              height: 10.w,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      right: BorderSide(
                                                          color:
                                                              AppColors.c000000,
                                                          width: 2.w))),
                                            )),

                                        /// 升级后
                                        AnimatedPositioned(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            left:
                                                -(235.w * (1 - afterProgress)),
                                            child: Container(
                                              height: 12.w,
                                              width: 235.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors.cFFD133,
                                                  borderRadius:
                                                      BorderRadius.horizontal(
                                                          left: Radius.circular(
                                                              6.w))),
                                            )),

                                        /// 升级前
                                        AnimatedPositioned(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            left:
                                                -(235.w * (1 - beforeProgress)),
                                            child: Container(
                                              height: 12.w,
                                              width: 235.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors.cFF7954,
                                                  borderRadius:
                                                      BorderRadius.horizontal(
                                                          left: Radius.circular(
                                                              6.w))),
                                            )),

                                        /// 基础
                                        AnimatedPositioned(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            left: -(235.w * (1 - baseProgress)),
                                            child: Container(
                                              height: 12.w,
                                              width: 235.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors.c000000,
                                                  borderRadius:
                                                      BorderRadius.horizontal(
                                                          left: Radius.circular(
                                                              6.w))),
                                            )),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                              9.hGap,
                              Expanded(
                                child: Text(
                                  ability.maxValue.format(),
                                  style: 16.w4(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldRegular),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      16.vGap,
                      if (controller.player.breakThroughGrade < 10)
                        MtInkwell(
                          onTap: () async {
                            if (controller.teamPlayerUpStarVoEntity.starUpDTO !=
                                null) {
                              var result = await showModalBottomSheet(
                                  isScrollControlled: true,
                                  enableDrag: false,
                                  backgroundColor: AppColors.cTransparent,
                                  context: context,
                                  builder: (context) {
                                    return const SlotDialogWidget();
                                  });
                              onResult(result);
                            } else {
                              var result = await Get.toNamed(
                                  RouteNames.teamStartUpGrade,
                                  arguments: {"player": controller.player});
                              onResult(result);
                            }
                          },
                          child: Container(
                            height: 51.w,
                            width: 343.w,
                            decoration: BoxDecoration(
                                color: AppColors.c000000,
                                borderRadius: BorderRadius.circular(9.w)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  "UPGRADE",
                                  style: 23.w5(
                                      color: AppColors.cFFFFFF,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                                Positioned(
                                    right: 13.w,
                                    child: IconWidget(
                                        iconWidth: 11.w,
                                        icon: Assets
                                            .commonUiCommonIconSystemJumpto))
                              ],
                            ),
                          ),
                        ),
                      21.vGap,
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 10.w,
                  top: 10.w,
                  child: ShareWidget(globalKey: controller.globalKey))
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 9.w),
            decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Column(
              children: [
                20.vGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16.w),
                      child: Text(
                        "OFFENSIVE",
                        style: 24.w7(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                    ),
                  ],
                ),
                22.vGap,
                Container(
                  margin: EdgeInsets.only(left: 29.w, right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(controller.getOffensive().length,
                        (index) {
                      var offensive = controller.getOffensive()[index];
                      double progress = offensive.progress;

                      var borderSweepAngle = 190.0;

                      var progressSweepAngle = progress * borderSweepAngle;

                      progress = progress * 100;
                      return Container(
                        height: 99.w,
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 52.w,
                          width: 90.w,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              AnimationArcWidget(
                                45.w,
                                borderColor: AppColors.cE1E1E1,
                                progressColor: AppColors.cFF7954,
                                progressWidth: 7.w,
                                progressSweepAngle: progressSweepAngle,
                                borderWidth: 7.w,
                                startAngle: 170,
                                borderSweepAngle: borderSweepAngle,
                              ),
                              Positioned(
                                bottom: 0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${progress.format()}%",
                                      style: 20.w7(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldBold),
                                    ),
                                    7.vGap,
                                    Text(
                                      offensive.name,
                                      style: 10.w4(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily:
                                              FontFamily.fRobotoRegular),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16.w),
                      child: Text(
                        "ADDITIONAL",
                        style: 24.w7(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                    ),
                  ],
                ),
                16.vGap,
                Divider(
                  color: AppColors.cD1D1D1,
                  height: 1.w,
                ),
                SizedBox(
                  height: 110.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          var additional = controller.getAdditional()[index];
                          return SizedBox(
                            width: 125.w,
                            height: 28.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    additional.name,
                                    style: 12.w4(
                                        color: AppColors.c000000,
                                        height: 1,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: FontFamily.fRobotoRegular),
                                  ),
                                ),
                                15.hGap,
                                Text(
                                  additional.value.format(),
                                  style: 12.w4(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                      56.hGap,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          var additional =
                              controller.getAdditional()[index + 3];
                          return SizedBox(
                            width: 125.w,
                            height: 28.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    additional.name,
                                    style: 12.w4(
                                        color: AppColors.c000000,
                                        height: 1,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: FontFamily.fRobotoRegular),
                                  ),
                                ),
                                15.hGap,
                                Text(
                                  additional.value.format(),
                                  style: 12.w4(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Divider(
                      color: AppColors.cD1D1D1,
                      height: 1.w,
                    )),
                21.vGap,
              ],
            ),
          ),
          9.vGap,
        ],
      ),
    );
  }

  void onResult(result) {
    if (kDebugMode) {
      print('isSuccess-upgrade:$result');
    }
    controller.initData();
    if (result != null && result is bool && result) {
      controller.refreshPlayerAbilityUI();
    }
  }
}
