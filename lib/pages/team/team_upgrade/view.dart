import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
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
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamUpgradePage extends GetView<TeamUpgradeController> {
  const TeamUpgradePage({required this.playerUuid, super.key});

  final String playerUuid;

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
      child: GetBuilder<TeamUpgradeController>(
        init: TeamUpgradeController(playerUuid),
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
                // key: controller.globalKey,
                child: _buildAbilityWidget(context),
              ),
              Positioned(
                  right: 10.w,
                  top: 10.w,
                  child: ShareWidget(globalKey: controller.globalKey)),
              Positioned(
                  top: 0,
                  child: Transform.scale(
                    scale: 0.000001,
                    child: RepaintBoundary(
                      key: controller.globalKey,
                      child: Container(
                        color: AppColors.cF2F2F2,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            const UpgradeHeaderWidget(),
                            9.vGap,
                            _buildAbilityWidget(context),
                          ],
                        ),
                      ),
                    ),
                  ))
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
                        LangKey.gameMeanOffensive.tr,
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
                                      "${progress.formatToString()}%",
                                      style: 20.w7(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldBold),
                                    ),
                                    7.vGap,
                                    Text(
                                      offensive.name.tr,
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
                        LangKey.gameMeanAdditional.tr,
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
                                    additional.name.tr,
                                    style: 12.w4(
                                        color: AppColors.c000000,
                                        height: 1,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: FontFamily.fRobotoRegular),
                                  ),
                                ),
                                15.hGap,
                                Text(
                                  additional.value.toStringAsFixed(0),
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
                                    additional.name.tr,
                                    style: 12.w4(
                                        color: AppColors.c000000,
                                        height: 1,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: FontFamily.fRobotoRegular),
                                  ),
                                ),
                                15.hGap,
                                Text(
                                  additional.value.toStringAsFixed(0),
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

  Container _buildAbilityWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(12.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          20.vGap,
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 16.w),
                child: Text(
                  LangKey.gameNameAbility.tr,
                  style: 30.w7(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fOswaldBold),
                ),
              ),
            ],
          ),
          26.vGap,
          ...List.generate(controller.upgradePlayerAbilityList.length, (index) {
            var ability = controller.upgradePlayerAbilityList[index];
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
                        double value = ability.sGradeLevel1PlayerMaxValue;
                        double total = ability.totalValue;
                        double baseValue = ability.baseValue;
                        double beforeUpgradeValue = ability.beforeValue;
                        double afterUpgradeValue = ability.afterValue;
                        double maxProgress = ability.selfLevel10Value / total;
                        double baseProgress = baseValue / value;
                        // baseProgress = baseProgress *
                        //     ability.selfLevel10Value /
                        //     total;

                        double beforeProgress = baseProgress +
                            ((ability.beforeValue - ability.baseValue) /
                                    (ability.beforeMaxValue -
                                        ability.baseValue) *
                                    (controller.teamPlayerUpStarVoEntity
                                            .breakThroughGrade *
                                        maxProgress /
                                        10))
                                .handlerNaNInfinity();

                        double afterProgress = baseProgress +
                            ((ability.afterValue - ability.baseValue) /
                                    (ability.afterMaxValue -
                                        ability.baseValue) *
                                    ((controller.starUpDoneEntity?.teamPlayerVO
                                                .breakThroughGrade ??
                                            0) *
                                        maxProgress /
                                        10))
                                .handlerNaNInfinity();

                        return Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            /// 边框
                            Container(
                              height: 12.w,
                              width: 235.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.w),
                                  border: Border.all(
                                      color: AppColors.cD1D1D1, width: 1.w)),
                            ),
                            AnimatedPositioned(
                                duration: const Duration(milliseconds: 300),
                                left: -(235.w * (1 - maxProgress)),
                                child: Container(
                                  width: 235.w,
                                  height: 10.w,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: AppColors.c000000,
                                              width: 2.w))),
                                )),

                            /// 升级后
                            AnimatedPositioned(
                                duration: const Duration(milliseconds: 300),
                                left: -(235.w * (1 - afterProgress)),
                                child: Container(
                                  height: 12.w,
                                  width: 235.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.cFFD133,
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(6.w))),
                                )),

                            /// 升级前
                            AnimatedPositioned(
                                duration: const Duration(milliseconds: 300),
                                left: -(235.w * (1 - beforeProgress)),
                                child: Container(
                                  height: 12.w,
                                  width: 235.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.cFF7954,
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(6.w))),
                                )),

                            /// 基础
                            AnimatedPositioned(
                                duration: const Duration(milliseconds: 300),
                                left: -(235.w * (1 - baseProgress)),
                                child: Container(
                                  height: 12.w,
                                  width: 235.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.c000000,
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(6.w))),
                                )),
                          ],
                        );
                      }),
                    ),
                  ),
                  9.hGap,
                  Expanded(
                    child: Text(
                      ability.afterValue != 0
                          ? ability.afterValue.toStringAsFixed(0)
                          : ability.beforeValue.toStringAsFixed(0),
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
          MtInkWell(
            onTap: () async {
              if (controller.getPlayer().breakThroughGrade >= 10) {
                EasyLoading.showToast(
                    "The player's star level is already  max");
                return;
              }
              if (controller.teamPlayerUpStarVoEntity.starUpDTO != null) {
                var result = await BottomTipDialog.showWithSound(
                    isScrollControlled: true,
                    enableDrag: false,
                    backgroundColor: AppColors.cTransparent,
                    context: context,
                    builder: (context) {
                      return const SlotDialogWidget(0);
                    });
                onResult(result);
              } else {
                var result = await Get.toNamed(RouteNames.teamStartUpGrade,
                    arguments: {"player": controller.getPlayer()});
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
                    LangKey.gameButtonStarUp.tr,
                    style: 23.w5(
                        color: AppColors.cFFFFFF,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                  Positioned(
                      right: 13.w,
                      child: IconWidget(
                          iconWidth: 11.w,
                          icon: Assets.commonUiCommonIconSystemJumpto))
                ],
              ),
            ),
          ),
          21.vGap,
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
