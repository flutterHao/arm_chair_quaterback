import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/all_team_players_by_up_star_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/my_team_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/star_upgrade_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/widgets/player_property_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/2/26/16:26

class StarUpgradeNew extends GetView<StarUpgradeNewController> {
  const StarUpgradeNew(this.playerUuid, {super.key});

  final String playerUuid;

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
      child: Container(
        color: AppColors.c1A1A1A,
        child: GetBuilder<StarUpgradeNewController>(
            init: StarUpgradeNewController(playerUuid),
            builder: (logic) {
              return Obx(() {
                if (controller.loadStatus.value != LoadDataStatus.success) {
                  return Center(
                    child: LoadStatusWidget(
                      loadDataStatus: controller.loadStatus.value,
                    ),
                  );
                }
                return Stack(
                  children: [
                    /// 背景
                    Positioned(
                      top: 0.w,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        Assets.managerUiManagerStar06,
                        width: 205.5.w,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),

                    /// sparring
                    Positioned(
                        top: -35.w,
                        bottom: 0,
                        child: OutlinedText(
                            text: "SPARRING",
                            strokeWidth: 1.w,
                            strokeColor: AppColors.c217FE0,
                            textStyle: 94.w7(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fOswaldBold,
                            ))),

                    /// player info
                    Positioned(
                        top: 60.5.w,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Stack(
                          children: [
                            Positioned(
                                left: 32.w,
                                child: ImageWidget(
                                  url: Utils.getPlayUrl(
                                      controller.player.playerId),
                                  width: 131.w,
                                  height: 100.w,
                                  imageFailedPath: Assets.iconUiDefault05,
                                )),
                            Positioned(
                                left: 28.w,
                                top: 21.w,
                                child: OutlinedText(
                                  text:
                                      "${controller.playerBaseInfo.playerScore}",
                                  strokeWidth: 1.5.w,
                                  strokeColor: AppColors.cFFFFFF,
                                  textStyle: 24.w7(
                                      color: AppColors.c262626,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldBold),
                                )),
                            Positioned(
                                left: 155.w,
                                top: 21.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 9.w),
                                      child: Text(
                                        controller.playerBaseInfo.ename,
                                        style: 19.w5(
                                          color: AppColors.cF2F2F2,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium,
                                        ),
                                      ),
                                    ),
                                    8.vGap,
                                    Transform.scale(
                                        scale: 25 / 18,
                                        alignment: Alignment.topLeft,
                                        child: PlayerStartWidget(
                                            grade: controller
                                                .player.breakThroughGrade))
                                  ],
                                ))
                          ],
                        )),

                    Positioned(
                        top: 152.w,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.cFFFFFF,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(9.w))),
                          child: Column(
                            children: [
                              DialogTopBtn(),
                              20.vGap,
                              Row(
                                children: [
                                  16.hGap,
                                  Text(
                                    "Add sparring players",
                                    style: 19.w5(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium,
                                    ),
                                  ),
                                ],
                              ),
                              18.vGap,
                              Row(
                                children: [
                                  MtInkWell(
                                    onTap: () {
                                      controller.gradeSort.value = -1;
                                      if (controller.starSort.value == -1) {
                                        controller.starSort.value = 0;
                                      } else if (controller.starSort.value ==
                                          0) {
                                        controller.starSort.value = 1;
                                      } else {
                                        controller.starSort.value = 0;
                                      }
                                      controller.sortList();
                                    },
                                    child: Obx(() {
                                      return SizedBox(
                                        width: 82.w,
                                        height: 28.w,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Text(
                                              LangKey.gameLittleNameStar.tr
                                                  .toUpperCase(),
                                              style: 14.w5(
                                                  color: controller
                                                              .starSort.value !=
                                                          -1
                                                      ? AppColors.cE34D4D
                                                      : AppColors.c000000,
                                                  height: 1,
                                                  fontFamily:
                                                      FontFamily.fRobotoMedium),
                                            ),
                                            Positioned(
                                              right: 13.w,
                                              child: Column(
                                                children: [
                                                  IconWidget(
                                                    iconWidth: 6.w,
                                                    icon:
                                                        Assets.iconUiIconShrink,
                                                    iconColor: controller
                                                                .starSort
                                                                .value ==
                                                            0
                                                        ? AppColors.cE34D4D
                                                        : AppColors.cDBDBDB,
                                                  ),
                                                  3.vGap,
                                                  IconWidget(
                                                    iconWidth: 6.w,
                                                    icon:
                                                        Assets.iconUiIconShrink,
                                                    iconColor: controller
                                                                .starSort
                                                                .value ==
                                                            1
                                                        ? AppColors.cE34D4D
                                                        : AppColors.cDBDBDB,
                                                    rotateAngle: 180,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                  5.hGap,
                                  MtInkWell(
                                    onTap: () {
                                      controller.starSort.value = -1;
                                      if (controller.gradeSort.value == -1) {
                                        controller.gradeSort.value = 0;
                                      } else if (controller.gradeSort.value ==
                                          0) {
                                        controller.gradeSort.value = 1;
                                      } else {
                                        controller.gradeSort.value = 0;
                                      }
                                      controller.sortList();
                                    },
                                    child: Obx(() {
                                      return SizedBox(
                                        width: 82.w,
                                        height: 28.w,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Text(
                                              LangKey.gameLittleNameGrade.tr
                                                  .toUpperCase(),
                                              style: 14.w5(
                                                  color: controller.gradeSort
                                                              .value !=
                                                          -1
                                                      ? AppColors.cE34D4D
                                                      : AppColors.c000000,
                                                  height: 1,
                                                  fontFamily:
                                                      FontFamily.fRobotoMedium),
                                            ),
                                            Positioned(
                                              right: 8.w,
                                              child: Column(
                                                children: [
                                                  IconWidget(
                                                    iconWidth: 6.w,
                                                    icon:
                                                        Assets.iconUiIconShrink,
                                                    iconColor: controller
                                                                .gradeSort
                                                                .value ==
                                                            0
                                                        ? AppColors.cE34D4D
                                                        : AppColors.cDBDBDB,
                                                  ),
                                                  3.vGap,
                                                  IconWidget(
                                                    iconWidth: 6.w,
                                                    icon:
                                                        Assets.iconUiIconShrink,
                                                    iconColor: controller
                                                                .gradeSort
                                                                .value ==
                                                            1
                                                        ? AppColors.cE34D4D
                                                        : AppColors.cDBDBDB,
                                                    rotateAngle: 180,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                                  )
                                ],
                              ),
                              8.vGap,
                              Divider(
                                color: AppColors.cD1D1D1,
                                height: 1.w,
                              ),
                              Expanded(child: Builder(builder: (context) {
                                if (controller.allTeamPlayers.isEmpty) {
                                  return Center(
                                    child: LoadStatusWidget(
                                      loadDataStatus: LoadDataStatus.noData,
                                    ),
                                  );
                                }
                                return MediaQuery.removePadding(
                                  removeTop: true,
                                  context: context,
                                  child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount:
                                          controller.allTeamPlayers.length,
                                      itemBuilder: (context, index) {
                                        return _buildListItem(index);
                                      }),
                                );
                              })),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 16.w, left: 16.w, right: 16.w),
                                decoration: BoxDecoration(
                                    color: AppColors.cFFFFFF,
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.c000000
                                              .withOpacity(0.1),
                                          offset: Offset(0, -1.w),
                                          blurRadius: 1.w)
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildContainer(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Correct",
                                              style: 12.w4(
                                                  color: AppColors.c000000,
                                                  fontFamily:
                                                      FontFamily.fRobotoRegular,
                                                  height: 1),
                                            ),
                                            7.5.vGap,
                                            Text.rich(
                                              TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "${controller.getSelectedPlayers().length}",
                                                    style: TextStyle(
                                                        fontSize: 18.sp)),
                                                TextSpan(
                                                    text:
                                                        "/${controller.selfStarUpDefine.starPlayerNum}",
                                                    style: TextStyle(
                                                        fontSize: 14.sp))
                                              ]),
                                              style: 18.w5(
                                                  color: AppColors.c000000,
                                                  height: 1,
                                                  fontFamily: FontFamily
                                                      .fOswaldRegular),
                                            )
                                          ],
                                        ),
                                        width: 61.w),
                                    buildContainer(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Amount",
                                              style: 12.w4(
                                                  color: AppColors.c000000,
                                                  fontFamily:
                                                      FontFamily.fRobotoRegular,
                                                  height: 1),
                                            ),
                                            7.5.vGap,
                                            Row(
                                              children: [
                                                IconWidget(
                                                    iconWidth: 20.w,
                                                    icon: Assets
                                                        .commonUiCommonProp05),
                                                5.hGap,
                                                Text(
                                                  Utils.formatMoney(
                                                      controller.getCost()),
                                                  style: 18.w5(
                                                      color: AppColors.c000000,
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fOswaldMedium),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        width: 113.w),
                                    buildContainer(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Attribute",
                                              style: 12.w4(
                                                  color: AppColors.c000000,
                                                  fontFamily:
                                                      FontFamily.fRobotoRegular,
                                                  height: 1),
                                            ),
                                            7.5.vGap,
                                            Text(
                                              "+${controller.ppUpValue.value.toStringAsFixed(3)}",
                                              style: 18.w5(
                                                  color: AppColors.c000000,
                                                  height: 1,
                                                  fontFamily:
                                                      FontFamily.fOswaldMedium),
                                            )
                                          ],
                                        ),
                                        width: 71.w),
                                    buildContainer(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Status",
                                              style: 12.w4(
                                                  color: AppColors.c000000,
                                                  fontFamily:
                                                      FontFamily.fRobotoRegular,
                                                  height: 1),
                                            ),
                                            7.5.vGap,
                                            Text(
                                              "${controller.upSuccessRate.value.formatToString()}%",
                                              style: 18.w5(
                                                  color: AppColors.c000000,
                                                  height: 1,
                                                  fontFamily:
                                                      FontFamily.fOswaldMedium),
                                            )
                                          ],
                                        ),
                                        width: 71.w),
                                  ],
                                ),
                              ),
                              14.vGap,
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      height: 51.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.c666666,
                                            width: 1.w,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(9.w)),
                                      child: MtInkWell(
                                        onTap: () => Get.back(),
                                        child: Center(
                                          child: Text(
                                            "BACK",
                                            style: 23.w5(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fOswaldMedium,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                    9.hGap,
                                    Expanded(
                                        child: Container(
                                      height: 51.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.c000000,
                                        borderRadius:
                                            BorderRadius.circular(9.w),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "START",
                                          style: 23.w5(
                                            color: AppColors.cF2F2F2,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fOswaldMedium,
                                          ),
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              5.vGap,
                              Text(
                                "Sparring players will be consumed",
                                style: 12.w4(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoRegular,
                                ),
                              ),
                              23.vGap,
                              Utils.getPaddingBottom().vGap,
                            ],
                          ),
                        ))
                  ],
                );
              });
            }),
      ),
    );
  }

  Container _buildListItem(int index) {
    UpgradePlayer upgradePlayer = controller.allTeamPlayers[index];
    AllTeamPlayersByUpStarEntity item = upgradePlayer.teamPlayer;
    var baseInfo = Utils.getPlayBaseInfo(item.playerId);
    bool lastIndex = controller.allTeamPlayers.length - 1 == index;
    return Container(
      height: 121.w,
      margin: EdgeInsets.only(
        left: 13.w,
        right: 13.w,
      ),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          border:
              Border(bottom: BorderSide(color: AppColors.cE6E6E6, width: 1.w))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 73.w,
            height: 110.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 73.w,
                  height: 93.w,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: AppColors.cF1F1F1,
                      borderRadius: BorderRadius.circular(9.w)),
                  child: Stack(
                    children: [
                      ImageWidget(
                        width: 73.w,
                        height: 93.w,
                        url: Utils.getPlayUrl(baseInfo.playerId),
                        imageFailedPath: Assets.iconUiDefault05,
                      ),
                      Positioned(
                          top: 5.w,
                          left: 5.w,
                          child: OutlinedText(
                              text: "${baseInfo.playerScore}",
                              strokeColor: AppColors.cFFFFFF,
                              strokeWidth: 1.5.w,
                              textStyle: 19.w7(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldBold,
                              )))
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                    child:  PlayerStartWidget(
                    grade: item.breakThroughGrade))
              ],
            ),
          ),
          11.hGap,
          Expanded(
            child: InkWell(
              onTap: () => _itemTap(upgradePlayer),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        baseInfo.ename,
                        style: 21.w5(
                            color: AppColors.c262626,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                      7.vGap,
                      Row(
                        children: [
                          Text(
                            "${Utils.getTeamInfo(baseInfo.teamId).shortEname} · ${baseInfo.position}",
                            style: 12.w4(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular),
                          ),
                          9.hGap,
                          if (baseInfo.injuries)
                            IconWidget(
                                iconWidth: 16.w,
                                icon: Assets.commonUiCommonIconInjury),
                        ],
                      ),
                      12.vGap,
                      Row(
                        children: [
                          PlayerPropertyWidget(
                            title: LangKey.gameNamePow.tr,
                            value: item.power.formatToString(),
                          ),
                          if (upgradePlayer.getPropertyAddValue() != 0)
                            PlayerPropertyWidget(
                              title: LangKey.gameNameAbility.tr,
                              value:
                                  "+${upgradePlayer.getPropertyAddValue().toStringAsFixed(3)}",
                            ),
                          PlayerPropertyWidget(
                            title: LangKey.gameNameSuccess.tr,
                            value: "+${item.probability.formatToString()}%",
                          ),
                        ],
                      )
                    ],
                  )),
                  MtInkWell(
                    onTap: () => _itemTap(upgradePlayer),
                    child: Obx(() {
                      return Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.w),
                            color: upgradePlayer.select.value
                                ? AppColors.c10A86A
                                : AppColors.cB3B3B3),
                        child: IconWidget(
                          iconWidth: 18.w,
                          icon: Assets.commonUiCommonStatusBarMission02,
                          iconColor: AppColors.cFFFFFF,
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _itemTap(UpgradePlayer upgradePlayer) {
    if (upgradePlayer.teamPlayer.position >= 0) {
      EasyLoading.showToast("please remove player from lineup");
      return;
    }
    if (controller.getSelectedPlayers().length ==
            controller.selfStarUpDefine.starPlayerNum &&
        !upgradePlayer.select.value) {
      EasyLoading.showToast("The maximum quantity limit has been reached");
      return;
    }
    upgradePlayer.select.value = !upgradePlayer.select.value;
    controller.onSelectTap();
  }

  Container buildContainer({required Widget child, required double width}) {
    return Container(
      height: 49.w,
      width: width,
      padding: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
        color: AppColors.cF2F2F2,
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: child,
    );
  }

  onStartClick(BuildContext context) async {
    if ((Get.find<HomeController>().userEntiry.teamLoginInfo?.getMoney() ?? 0) <
        controller.getCost()) {
      EasyLoading.showToast("not sufficient funds");
      return;
    }
    Get.back();
    // var result = await BottomTipDialog.showWithSound(
    //     isScrollControlled: true,
    //     enableDrag: false,
    //     backgroundColor: AppColors.cTransparent,
    //     context: context,
    //     builder: (context) {
    //       return SlotDialogWidget(controller.upSuccessRate.value / 100);
    //     });
    // onBack.call(result);
  }
}
