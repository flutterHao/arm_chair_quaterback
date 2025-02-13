/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 20:08:22
 * @LastEditTime: 2024-12-16 11:37:37
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayerBagTab extends StatefulWidget {
  const PlayerBagTab({super.key});

  @override
  State<PlayerBagTab> createState() => _PlayerBagTabState();
}

class _PlayerBagTabState extends State<PlayerBagTab>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<TeamController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<TeamController>(builder: (_) {
      controller.myBagList.sort(controller.comparePlayers);
      var list = controller.myBagList.where((e) => e.position == -1).toList();
      return Container(
        color: AppColors.cF2F2F2,
        child: Stack(
          children: [
            Obx(() {
              return AnimatedPositioned(
                duration: 300.milliseconds,
                top: controller.hideSort.value ? -63.w : 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 63.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: const Border(
                              bottom: BorderSide(color: AppColors.cD1D1D1)),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 9.w),
                                blurRadius: 9,
                                color: AppColors.c000000.withOpacity(0.05))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ignore: prefer_const_constructors
                          16.hGap, StarSort(),

                          5.hGap,
                          // ignore: prefer_const_constructors
                          GradeSort(),
                          const Expanded(child: SizedBox.shrink()),
                          MtInkWell(
                            onTap: () {
                              controller.isFire = !controller.isFire;
                              controller.sortType = controller.isFire ? -1 : 1;
                              controller.update();
                            },
                            child: Container(
                              width: 53.w,
                              alignment: Alignment.center,
                              child: Text(
                                controller.isFire
                                    ? LangKey.pickButtonDone.tr
                                    : LangKey.gameButtonDelete.tr,
                                style: TextStyle(
                                    fontSize: 16.h,
                                    decorationColor: controller.isFire
                                        ? AppColors.c000000
                                        : AppColors.cD60D20,
                                    decoration: TextDecoration.underline,
                                    color: controller.isFire
                                        ? AppColors.c000000
                                        : AppColors.cD60D20,
                                    fontFamily: FontFamily.fOswaldMedium),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: list.isEmpty
                          ? const Center(
                              child: LoadStatusWidget(
                                text: "No players",
                              ),
                            )
                          : ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              controller: controller.scrollController,
                              padding: EdgeInsets.only(bottom: 9.w),
                              itemBuilder: (context, index) {
                                return PlayerItem(
                                  item: list[index],
                                  isBag: true,
                                );
                              },
                              separatorBuilder: (context, index) => Container(
                                width: double.infinity,
                                height: 1,
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                color: AppColors.cE6E6E,
                              ),
                              itemCount: list.length,
                            ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      );
    });
  }

  Widget _backLock() {
    return InkWell(
        onTap: () {},
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: 121.w,
          child: Row(
            children: [
              27.hGap,
              Container(
                width: 73.w,
                height: 93.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.cF1F1F1,
                    borderRadius: BorderRadius.circular(9.w)),
                child: Image.asset(
                  Assets.iconUiIconLock,
                  width: 30.w,
                  color: AppColors.cB2B2B2,
                ),
              ),
              11.hGap,
              Text(
                "ADD STASH NUMBER",
                style: 21.w4(fontFamily: FontFamily.fOswaldMedium),
              )
            ],
          ),
        ));
  }

  @override
  bool get wantKeepAlive => false;
}

class StarSort extends GetView<TeamController> {
  const StarSort({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // if (controller.sortType != 1 && controller.sortType != -1) {
        //   controller.sortType = 1;
        // } else if (controller.sortType == 1) {
        //   controller.sortType = -1;
        // } else if (controller.sortType == -1) {
        //   controller.sortType = 0;
        // }
        controller.sortType = controller.sortType == 1 ? -1 : 1;
        controller.update();
      },
      child: Container(
        height: 28.w,
        width: 82.w,
        decoration: BoxDecoration(
            color: AppColors.cEEEEEE,
            borderRadius: BorderRadius.circular(14.w)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox.shrink(),
            Text(LangKey.gameLittleNameStar.tr,
                style: 16.w4(
                    fontFamily: controller.sortType.abs() == 1
                        ? FontFamily.fOswaldMedium
                        : FontFamily.fOswaldRegular)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidget(
                  iconWidth: 8.w,
                  icon: Assets.iconUiIconShrink,
                  iconColor: controller.sortType == -1
                      ? AppColors.c000000
                      : AppColors.cB3B3B3,
                ),
                3.vGap,
                IconWidget(
                  iconWidth: 8.w,
                  icon: Assets.iconUiIconUnfold,
                  iconColor: controller.sortType == 1
                      ? AppColors.c000000
                      : AppColors.cB3B3B3,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GradeSort extends GetView<TeamController> {
  const GradeSort({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // if (controller.sortType != 2 && controller.sortType != -2) {
        //   controller.sortType = 2;
        // } else if (controller.sortType == 2) {
        //   controller.sortType = -2;
        // } else if (controller.sortType == -2) {
        //   controller.sortType = 0;
        // }
        controller.sortType = controller.sortType == 2 ? -2 : 2;
        controller.update();
      },
      child: Container(
        height: 28.w,
        width: 82.w,
        decoration: BoxDecoration(
            color: AppColors.cEEEEEE,
            borderRadius: BorderRadius.circular(14.w)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox.shrink(),
            Text(LangKey.gameLittleNameGrade.tr,
                style: 16.w4(
                    fontFamily: controller.sortType.abs() == 2
                        ? FontFamily.fOswaldMedium
                        : FontFamily.fOswaldRegular)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidget(
                  iconWidth: 8.w,
                  icon: Assets.iconUiIconShrink,
                  iconColor: controller.sortType == -2
                      ? AppColors.c000000
                      : AppColors.cB3B3B3,
                ),
                3.vGap,
                IconWidget(
                  iconWidth: 8.w,
                  icon: Assets.iconUiIconUnfold,
                  iconColor: controller.sortType == 2
                      ? AppColors.c000000
                      : AppColors.cB3B3B3,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
