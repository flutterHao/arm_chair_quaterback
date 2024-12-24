import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/widgets/start_upgrade/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/widgets/start_upgrade/widgets/player_property_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/24/14:33

class AddSparringPlayersDialogWidget extends GetView<StartUpgradeController> {
  const AddSparringPlayersDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartUpgradeController>(
        id: StartUpgradeController.idAddSparringPlayers,
        builder: (logic) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))
            ),
            child: Column(
              children: [
                const DialogTopBtn(),
                20.vGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15.w),
                      child: Text(
                        "Add sparring players",
                        style: 19.w5(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                  ],
                ),
                8.vGap,
                Divider(
                  height: 1.w,
                  color: AppColors.cE3E3E3,
                ),
                Expanded(child: Builder(builder: (logic) {
                  if (controller.getSelectedPlayers().isEmpty) {
                    return const Center(
                      child: LoadStatusWidget(
                        loadDataStatus: LoadDataStatus.noData,
                      ),
                    );
                  }
                  return MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                        itemCount: controller.getSelectedPlayers().length,
                        itemBuilder: (context, index) {
                          UpgradePlayer item =
                              controller.getSelectedPlayers()[index];
                          var baseInfo =
                              Utils.getPlayBaseInfo(item.teamPlayer.playerId);
                          return Column(
                            children: [
                              Container(
                                height: 66.w,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        PlayerAvatarWidget(
                                          width: 36.w,
                                          playerId: item.teamPlayer.playerId,
                                          backgroundColor: AppColors.cFFFFFF,
                                          radius: 0,
                                        ),
                                        11.hGap,
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              baseInfo.ename,
                                              style: 12.w4(
                                                  height: 1,
                                                  fontFamily: FontFamily
                                                      .fOswaldRegular),
                                            ),
                                            5.vGap,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                OutlinedText(
                                                    text: baseInfo.grade,
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fRobotoBlack,
                                                        fontSize: 19.sp)),
                                                5.hGap,
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    IconWidget(
                                                        iconWidth: 16.w,
                                                        icon: Assets
                                                            .managerUiManagerPlayerstar),
                                                    Text(
                                                      "${item.teamPlayer.breakThroughGrade + 1}",
                                                      style: 10.w5(
                                                          color:
                                                              AppColors.cFFFFFF,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fRobotoMedium),
                                                    ),
                                                  ],
                                                ),
                                                5.hGap,
                                                Column(
                                                  children: [
                                                    Text(
                                                      "${baseInfo.playerScore}",
                                                      style: 12.w5(
                                                        fontFamily: FontFamily
                                                            .fOswaldMedium,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    Text(
                                                      "OVR",
                                                      style: 9.w5(
                                                        color:
                                                            AppColors.c000000,
                                                        fontFamily: FontFamily
                                                            .fRobotoRegular,
                                                        height: 1,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        23.hGap,
                                        Row(
                                          children: [
                                            PlayerPropertyWidget(
                                              title: "POW",
                                              value: item.teamPlayer.power
                                                  .format(),
                                            ),
                                            if (item.starUpDefine.starUpRange !=
                                                0)
                                              PlayerPropertyWidget(
                                                title: "ATTRIB",
                                                value:
                                                    "${item.starUpDefine.starUpRange}",
                                              ),
                                            PlayerPropertyWidget(
                                              title: "STATUS",
                                              value:
                                                  "+${item.teamPlayer.probability.format()}%",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    MtInkwell(
                                      onTap: () {
                                        item.select.value = false;
                                        controller.onDialogDelete();
                                      },
                                      child: Container(
                                        width: 28.w,
                                        height: 28.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: AppColors.cD60D20,
                                          borderRadius:
                                              BorderRadius.circular(7.w),
                                        ),
                                        child: IconWidget(
                                            iconWidth: 12.w,
                                            icon: Assets
                                                .commonUiCommonIconSystemDelete),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Divider(
                                    height: 1.w,
                                    color: AppColors.cE3E3E3,
                                  )),
                            ],
                          );
                        }),
                  );
                })),
                if (controller.getSelectedPlayers().length < 5)
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    height: 53.w,
                    width: double.infinity,
                    child: MtInkwell(
                      onTap: ()=> Get.back(),
                      child: Row(
                        children: [
                          Container(
                            width: 28.w,
                            height: 28.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.w),
                              border: Border.all(
                                color: AppColors.c666666,
                                width: 1.w,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: IconWidget(
                              iconWidth: 16.w,
                              icon: Assets.commonUiCommonIconSystemAdd,
                              iconColor: AppColors.cFF7954,
                            ),
                          ),
                          21.hGap,
                          Text(
                            "Add stake to Combo",
                            style: 14.w5(
                                color: AppColors.cB3B3B3,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium),
                          )
                        ],
                      ),
                    ),
                  ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildContainer(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Correct",
                                style: 12.w4(
                                    color: AppColors.c000000,
                                    fontFamily: FontFamily.fRobotoRegular,
                                    height: 1),
                              ),
                              7.5.vGap,
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text:
                                          "${controller.getSelectedPlayers().length}",
                                      style: TextStyle(fontSize: 18.sp)),
                                  TextSpan(
                                      text: "/5",
                                      style: TextStyle(fontSize: 14.sp))
                                ]),
                                style: 18.w5(
                                    color: AppColors.c000000,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldRegular),
                              )
                            ],
                          ),
                          width: 61.w),
                      buildContainer(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Amount",
                                style: 12.w4(
                                    color: AppColors.c000000,
                                    fontFamily: FontFamily.fRobotoRegular,
                                    height: 1),
                              ),
                              7.5.vGap,
                              Row(
                                children: [
                                  IconWidget(
                                      iconWidth: 20.w,
                                      icon: Assets.commonUiCommonProp05),
                                  5.hGap,
                                  Text(
                                    Utils.formatMoney(controller.getCost()),
                                    style: 18.w5(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fOswaldMedium),
                                  )
                                ],
                              )
                            ],
                          ),
                          width: 113.w),
                      buildContainer(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Attribute",
                                style: 12.w4(
                                    color: AppColors.c000000,
                                    fontFamily: FontFamily.fRobotoRegular,
                                    height: 1),
                              ),
                              7.5.vGap,
                              Text(
                                "+${controller.ppUpValue}",
                                style: 18.w5(
                                    color: AppColors.c000000,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium),
                              )
                            ],
                          ),
                          width: 71.w),
                      buildContainer(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Status",
                                style: 12.w4(
                                    color: AppColors.c000000,
                                    fontFamily: FontFamily.fRobotoRegular,
                                    height: 1),
                              ),
                              7.5.vGap,
                              Text(
                                "${controller.upSuccessRate}%",
                                style: 18.w5(
                                    color: AppColors.c000000,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium),
                              )
                            ],
                          ),
                          width: 71.w),
                    ],
                  ),
                ),
                14.vGap,
                MtInkwell(
                  onTap: ()=> onStartClick(),
                  child: Container(
                    width: 343.w,
                    height: 51.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      color: AppColors.c000000,
                    ),
                    child: Center(
                      child: Text(
                        "START",
                        style: 23.w5(
                            color: AppColors.cF2F2F2,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                  ),
                ),
                5.vGap,
                Text(
                  "Sparring players will be consumed",
                  style: 12.w4(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fRobotoRegular),
                ),
                19.vGap,
              ],
            ),
          );
        });
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

  onStartClick() {

  }
}
