/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-06 10:37:49
 * @LastEditTime: 2024-12-16 11:36:10
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team%20new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team%20new/widgets/my_team_list.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team%20new/widgets/player_bag_tab.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team%20new/widgets/player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PlayerChangerDialog extends StatefulWidget {
  PlayerChangerDialog({super.key, required this.item});
  TeamPlayerInfoEntity? item;

  @override
  State<PlayerChangerDialog> createState() => _PlayerChangerDialogState();
}

class _PlayerChangerDialogState extends State<PlayerChangerDialog>
    with SingleTickerProviderStateMixin {
  TeamController ctrl = Get.find();
  RxDouble offsetY = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    // ctrl.animationCtrl.reset();
    // ctrl.animationCtrl.forward();
    return SizedBox(
      width: 375.w,
      height: 812.h,
      child: AnimatedBuilder(
          animation: ctrl.pageAnimation,
          builder: (context, child) {
            return SizedBox(
              child: Column(
                children: [
                  Obx(() {
                    return Container(
                      height: 121.w,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            top: -121.w * (1 - ctrl.pageAnimation.value) -
                                offsetY.value * 0.5,
                            left: 0,
                            right: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(9.w),
                              child: widget.item != null
                                  ? PlayerItem(
                                      isBag: widget.item!.position < 0,
                                      item: widget.item!,
                                      isSelect: true,
                                    )
                                  : const EmptyPlayer(showChangeButton: false),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  Center(
                    child: InkWell(
                      onTap: () {
                        ctrl.animationCtrl.reverse().then(
                          (value) {
                            // Navigator.pop(context);
                            Get.back();
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80.h,
                        alignment: Alignment.center,
                        child: Obx(() {
                          return Transform.rotate(
                            angle: pi / 2 * (offsetY / 650.h),
                            child: IconWidget(
                              iconWidth: 20.w,
                              icon: Assets.commonUiCommonIconSystemExchange,
                              rotateAngle: 90,
                              iconColor: AppColors.cFF7954,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Expanded(
                      child: VerticalDragBackWidget(
                    onChange: (v) {
                      offsetY.value = v;
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                          top: 650.h * (1 - ctrl.pageAnimation.value),
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: double.infinity,
                            // height: 566.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(9.w)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 44.w,
                                  height: 4.w,
                                  margin:
                                      EdgeInsets.only(top: 8.w, bottom: 18.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.c000000.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(2.w)),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    // physics: const BouncingScrollPhysics(),
                                    child: widget.item != null
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (widget.item!.position <= 0)
                                                _LineUp(widget.item!),
                                              if (widget.item!.position != 0)
                                                _Substitute(widget.item!),
                                              if (widget.item!.position >= 0)
                                                _Stash(widget.item!),
                                            ],
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _Stash(widget.item),
                                            ],
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            );
          }),
    );
  }
}

class _LineUp extends GetView<TeamController> {
  const _LineUp(this.item);
  final TeamPlayerInfoEntity item;

  @override
  Widget build(BuildContext context) {
    // String p = Utils.getPosition(item.position);
    var list = controller.myTeamEntity.teamPlayers
        .where((e) => e.position > 0)
        .toList();
    list = list
        .where((e) => Utils.getPlayBaseInfo(item.playerId)
            .position
            .contains(Utils.getPosition(e.position)))
        .toList();
    list.sort((a, b) => a.position.compareTo(b.position));
    if (list.isEmpty) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16.w),
          child: Text(
            "Main",
            style: 19.w4(
                color: AppColors.c000000,
                fontFamily: FontFamily.fOswaldMedium,
                height: 1),
          ),
        ),
        6.vGap,
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.cD1D1D1,
        ),
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return PlayerItem(item: list[index]);
          },
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            height: 1.w,
            color: AppColors.cE6E6E,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
          ),
          itemCount: list.length,
        ),
      ],
    );
  }
}

class _Substitute extends GetView<TeamController> {
  const _Substitute(this.item);
  final TeamPlayerInfoEntity item;

  @override
  Widget build(BuildContext context) {
    String p = item.position > 0
        ? Utils.getPosition(item.position)
        : Utils.getPlayBaseInfo(item.playerId).position;
    var list = controller.myTeamEntity.teamPlayers
        .where((e) => e.position == 0)
        .toList();
    if (item.position > 0) {
      list = list
          .where((e) => Utils.getPlayBaseInfo(e.playerId).position.contains(p))
          .toList();
    }
    if (list.isEmpty && item.position > 0) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16.w),
          child: Text(
            "Substitutes",
            style: 19.w4(
                color: AppColors.c000000,
                fontFamily: FontFamily.fOswaldMedium,
                height: 1),
          ),
        ),
        6.vGap,
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.cD1D1D1,
        ),
        item.position < 0
            ? ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return index < list.length
                      ? PlayerItem(item: list[index])
                      : InkWell(
                          onTap: () {
                            controller.isAdd = true;
                            controller.changeTeamPlayer(context);
                          },
                          child: EmptyPlayer());
                },
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1.w,
                  color: AppColors.cE6E6E,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                ),
                itemCount: list.length + 1,
              )
            : ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PlayerItem(item: list[index]);
                },
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1.w,
                  color: AppColors.cE6E6E,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                ),
                itemCount: list.length,
              ),
      ],
    );
  }
}

class _Stash extends GetView<TeamController> {
  const _Stash(this.item);
  final TeamPlayerInfoEntity? item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamController>(builder: (context) {
      var list = controller.playerSort();
      list = list.where((e) => e.position < 0).toList();
      if (item != null) {
        String p = item!.position > 0
            ? Utils.getPosition(item!.position)
            : Utils.getPlayBaseInfo(item!.playerId).position;
        if (item!.position > 0) {
          list = list
              .where(
                  (e) => Utils.getPlayBaseInfo(e.playerId).position.contains(p))
              .toList();
        }
      }

      if (list.isEmpty) {
        return Container();
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Stash",
                    style: 19.w4(
                        color: AppColors.c000000,
                        fontFamily: FontFamily.fOswaldMedium,
                        height: 1),
                  ),
                ),
                StarSort(),
                5.hGap,
                // ignore: prefer_const_constructors
                GradeSort(),
              ],
            ),
          ),
          6.vGap,
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.cD1D1D1,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 0.w),
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
          )
        ],
      );
    });
  }
}
