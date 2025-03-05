/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-10 09:53:30
 * @LastEditTime: 2025-03-04 15:47:18
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/player_collect_entity.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/custom_swith.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/controller.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/widgets/filter_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/box_card_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IllustrationList extends GetView<IllustratiionsController> {
  const IllustrationList({super.key});

  @override
  Widget build(BuildContext context) {
    controller.updateCollect();
    return GetBuilder<IllustratiionsController>(
      id: "list",
      builder: (ctrl) {
        var list = ctrl.onfilter();
        var activeList = list.where((e) => e.isActive == 0).toList();
        // activeList.sort((a, b) => b.isLight.compareTo(a.isLight));
        var notActiveList = list.where((e) => e.isActive == 1).toList();
        // notActiveList.sort((a, b) => b.isLight.compareTo(a.isLight));
        int length = list.where((e) => e.isLight == 1).length;
        if (ctrl.isCollect.value) {
          activeList =
              activeList.where((element) => element.isLight == 1).toList();
          notActiveList =
              notActiveList.where((element) => element.isLight == 1).toList();
        }
        return Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16.w),
              width: double.infinity,
              height: 37.w,
              color: AppColors.c4D4D4D,
              child: Row(
                children: [
                  IconWidget(
                    iconWidth: 19.w,
                    icon: Assets.managerUiManagerArchiveAtlas,
                  ),
                  8.5.hGap,
                  Expanded(
                    child: Text(
                      "$length/${list.length}",
                      style: 14.w4(
                        color: AppColors.cFFFFFF,
                        fontFamily: FontFamily.fRobotoRegular,
                      ),
                    ),
                  ),
                  Text(
                    "Collected".toUpperCase(),
                    style: 12.w4(
                      fontFamily: FontFamily.fRobotoRegular,
                      color: AppColors.cFFFFFF,
                    ),
                  ),
                  10.hGap,
                  SizedBox(
                    width: 42.5.w,
                    height: 20.w,
                    child: Obx(
                      () {
                        return CustomSwitch(
                          activeColor: AppColors.cFF7954,
                          value: ctrl.isCollect.value,
                          onChanged: (v) {
                            ctrl.isCollect.value = v;
                            ctrl.update(["list"]);
                          },
                          trackColor: AppColors.c373737,
                        );
                      },
                    ),
                  ),
                  MtInkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      BottomTipDialog.showWithSound(
                        isScrollControlled: true,
                        context: Get.context!,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return const FilterDialog();
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 4.w,
                      ),
                      child: IconWidget(
                        iconWidth: 17.w,
                        icon: Assets.commonUiCommonIconSift,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                controller: ctrl.scrollController,
                slivers: [
                  ctrl.isCollect.value
                      ? SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 21.w, vertical: 25.w),
                          sliver: SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 109 / 160,
                              crossAxisSpacing: 8.w,
                              mainAxisSpacing: 15.5.w,
                              crossAxisCount: 3,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return _Item(item: activeList[index]);
                              },
                              childCount: activeList.length,
                            ),
                          ),
                        )
                      : SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 21.w, vertical: 25.w),
                          sliver: SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 64 / 90,
                              crossAxisSpacing: 6.w,
                              mainAxisSpacing: 15.5.w,
                              crossAxisCount: 5,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return _ItemSmall(
                                  item: activeList[index],
                                  index: index,
                                );
                              },
                              childCount: activeList.length,
                            ),
                          ),
                        ),
                  if (!ctrl.isCollect.value)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Text(
                          LangKey.gameTabFreeAgency.tr,
                          style: 24.w4(
                            fontFamily: FontFamily.fOswaldBold,
                            height: 0.9,
                          ),
                        ),
                      ),
                    ),
                  if (!ctrl.isCollect.value)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.w),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: AppColors.cD1D1D1,
                        ),
                      ),
                    ),
                  //自由球员
                  if (!ctrl.isCollect.value)
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 21.w, vertical: 16.w),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 64 / 90,
                          crossAxisSpacing: 6.w,
                          mainAxisSpacing: 15.5.w,
                          crossAxisCount: 5,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return _ItemSmall(
                              item: notActiveList[index],
                              index: index,
                            );
                          },
                          childCount: notActiveList.length,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Item extends GetView<IllustratiionsController> {
  const _Item({super.key, required this.item});
  final PlayerCollectCollects item;

  @override
  Widget build(BuildContext context) {
    var player = Utils.getPlayBaseInfo(item.playerId);
    return MtInkWell(
      minScale: 0.9,
      onTap: () async {
        await Get.toNamed(
          RouteNames.illustrationDetail,
          arguments: item,
        );
        // if (controller.hasNewPlayer.value == true) controller.updateCollect();
      },
      child: Center(
        child: Container(
          width: 109.w,
          height: 160.w,
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                // top: 19.w,
                // top: 5.5.w,
                // top: 13.w,
                bottom: 61.5.w,
                child: ImageWidget(
                  url: Utils.getPlayUrl(player.playerId),
                  alignment: Alignment.bottomCenter,
                  // width: 125.w,
                  // width: 147.w,
                  // height: 96.5.w,
                  width: 109.w,
                  fit: BoxFit.fitWidth,
                ),
              ),
              //球员名字
              Positioned(
                  // top: 109.w,
                  bottom: 41.5.w,
                  child: Text(
                    player.ename.toUpperCase(),
                    style: 11.5.w4(
                      height: 0.8,
                      fontFamily: FontFamily.fOswaldBold,
                    ),
                  )),
              Positioned(
                bottom: 18.w,
                right: 0.w,
                left: 0.w,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ImageWidget(
                            url: Utils.getTeamUrl(player.teamId),
                            height: 18.w,
                            width: 18.w,
                            fit: BoxFit.fitHeight,
                          ),
                          1.hGap,
                          Text(
                            '#${player.number}',
                            style: 10.w4(
                                fontFamily: FontFamily.fRobotoRegular,
                                height: 1),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 0.5.w,
                      height: 7.5.w,
                      color: AppColors.c000000,
                      margin: EdgeInsets.symmetric(horizontal: 5.5.w),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        player.position,
                        style: 10.w4(
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Positioned(
              //     bottom: 24.w,
              //     child: Container(
              //       width: 0.5.w,
              //       height: 7.5.w,
              //       color: AppColors.c000000,
              //     )),
              // Positioned(
              //   bottom: 21.w,
              //   left: 60.w,
              //   child: Text(
              //     player.position,
              //     style: 10.w4(
              //       height: 1,
              //       fontFamily: FontFamily.fRobotoRegular,
              //     ),
              //   ),
              // ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  height: 15.5.w,
                  width: (109.w) * item.fragmentNum / item.needNum,
                  alignment: Alignment.center,
                  color: AppColors.c10A86A,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                    height: 15.5.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(width: 1, color: AppColors.ce5e5e5),
                    )),
                    child: Text(
                      "${item.fragmentNum}/${item.needNum}",
                      style: (10).w4(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fRobotoMedium,
                      ),
                    )),
              ),
              // Positioned(
              //   left: 10.w,
              //   bottom: 2.5.w,
              //   child: IconWidget(
              //     iconWidth: 19.w,
              //     // iconHeight: 12.8.w,
              //     icon: Assets.managerUiManagerArchiveDebris,
              //     iconColor: AppColors.cFFFFFF,
              //   ),
              // ),

              Positioned(
                top: 5.5.w,
                left: 5.w,
                child: OutlinedText(
                  text: Utils.getPlayBaseInfo(item.playerId)
                      .playerScore
                      .toString(),
                  textStyle: TextStyle(
                      fontSize: 19.w,
                      fontFamily: FontFamily.fOswaldBold,
                      height: 0.8),
                ),
              ),

              Positioned(
                bottom: 59.w,
                child: Image.asset(
                    width: 98.5.w,
                    fit: BoxFit.fitWidth,
                    getBigCardImageNew(player.grade)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemSmall extends StatelessWidget {
  const _ItemSmall({super.key, required this.item, required this.index});
  final PlayerCollectCollects item;
  final int index;

  @override
  Widget build(BuildContext context) {
    var player = Utils.getPlayBaseInfo(item.playerId);
    // item.isLight = 1;
    return MtInkWell(
      onTap: () async {
        await Get.toNamed(
          RouteNames.illustrationDetail,
          arguments: item,
        );
      },
      child: Obx(() {
        return item.isLightRx.value == 1
            ? Container(
                width: 64.w,
                height: 90.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(9.w),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: ImageWidget(
                        url: Utils.getPlayUrl(item.playerId),
                        width: 68.w,
                        height: 75.w,
                        // height: 140.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (item.isLightRx.value == 1)
                      Positioned(
                        top: 5.w,
                        left: 5.5.w,
                        child: Text(
                          Utils.getPlayBaseInfo(item.playerId)
                              .playerScore
                              .toString(),
                          style: TextStyle(
                              fontSize: 14.w,
                              fontFamily: FontFamily.fOswaldMedium,
                              height: 0.8),
                        ),
                      ),
                  ],
                ),
              )
            : Container(
                width: 64.w,
                height: 90.w,
                decoration: BoxDecoration(
                  color: AppColors.cE6E6E6,
                  borderRadius: BorderRadius.circular(9.w),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 5.w,
                      child: Opacity(
                        opacity: 0.35,
                        child: ImageWidget(
                          width: 50.w,
                          height: 50.w,
                          url: Utils.getTeamUrl(player.teamId),
                          color: AppColors.cE6E6E6,
                          colorBlendMode: BlendMode.saturation,
                          // color: Colors.grey,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 52.w,
                      child: Text(
                        "#${Utils.getPlayBaseInfo(item.playerId).number}",
                        style: 10.w4(color: AppColors.cB3B3B3, height: 0.8),
                      ),
                    ),
                    Positioned(
                      bottom: 9.w,
                      child: CustomLinearProgressBar(
                        width: 54.w,
                        height: 5.w,
                        progressColor: AppColors.c43BF8F,
                        backgroundColor: AppColors.cD4D4D4,
                        progress: item.fragmentNum / item.needNum,
                      ),
                    )
                  ],
                ),
              );
      }),
    );
  }
}
