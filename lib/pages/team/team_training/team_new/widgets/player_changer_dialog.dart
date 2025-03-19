/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-06 10:37:49
 * @LastEditTime: 2025-03-19 14:51:45
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/my_team_list.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/player_bag_tab.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/player_item_widget.dart';
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
    TeamPlayerInfoEntity? samePlayer;
    if (item.position < 0) {
      samePlayer = controller.myTeamEntity.teamPlayers
          .firstWhereOrNull((e) => e.playerId == item.playerId);
    }
    var list = controller.myTeamEntity.teamPlayers
        .where((e) => e.position > 0)
        .where((e) {
      if (samePlayer != null && e.playerId != samePlayer!.playerId) {
        return false;
      }
      return Utils.getPlayBaseInfo(item.playerId)
          .position
          .contains(Utils.getPosition(e.position));
    }).toList();
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
    TeamPlayerInfoEntity? samePlayer;
    String p = item.position > 0
        ? Utils.getPosition(item.position)
        : Utils.getPlayBaseInfo(item.playerId).position;
    var subList = controller.myTeamEntity.teamPlayers
        .where((e) => e.position == 0)
        .toList();

    if (item.position > 0) {
      subList = subList
          .where((e) => Utils.getPlayBaseInfo(e.playerId).position.contains(p))
          .toList();
    } else {
      samePlayer = controller.myTeamEntity.teamPlayers
          .firstWhereOrNull((e) => e.playerId == item.playerId);
      if (samePlayer != null) {
        subList =
            subList.where((e) => e.playerId == samePlayer!.playerId).toList();
      }
    }
    if (subList.isEmpty && item.position > 0) {
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
                  if (subList.length >= controller.myTeamEntity.benchCount) {
                    return PlayerItem(item: subList[index]);
                  }
                  return index < subList.length
                      ? PlayerItem(item: subList[index])
                      : InkWell(
                          onTap: () {
                            controller.isAdd = true;
                            controller.changeTeamPlayer();
                          },
                          child: EmptyPlayer());
                },
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1.w,
                  color: AppColors.cE6E6E,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                ),
                itemCount:
                    subList.length < controller.myTeamEntity.benchCount &&
                            samePlayer == null
                        ? subList.length + 1
                        : subList.length,
              )
            : ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PlayerItem(item: subList[index]);
                },
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1.w,
                  color: AppColors.cE6E6E,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                ),
                itemCount: subList.length,
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
      //队伍不包含这个球员
      list = list
          .where((e) => controller.myTeamEntity.teamPlayers
              .where((a) => a.playerId == e.playerId)
              .isEmpty)
          .toList();

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
                // StarSort(),
                // 5.hGap,
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
