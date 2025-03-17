/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-28 20:22:47
 * @LastEditTime: 2025-03-17 14:41:32
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/transitions/slide_transition_x.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/dialog/fire_dialog.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:common_utils/common_utils.dart';

class PlayerItem extends GetView<TeamController> {
  const PlayerItem({
    super.key,
    required this.item,
    this.isBag = false,
    this.isSelect = false,
    this.onDownCallBack,
  });

  // final bool isMain;
  final TeamPlayerInfoEntity item;
  final bool isBag;
  final bool isSelect;
  final Function? onDownCallBack;

  ///下阵容回调

  // String get position => Utils.getPosition(item.position);

  ///球员位置
  Widget _playerPosition() {
    if (isBag) {
      return SizedBox(
        height: 93.w,
        width: 16.w,
      );
    }
    return Container(
      height: 93.w,
      width: 16.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: item.position > 0 ? AppColors.c000000 : AppColors.ccccccc,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(9.w))),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          Utils.getPosition(item.position, getKey: false).tr,
          style: 14.w4(
              color: item.position > 0 ? AppColors.cFFFFFF : AppColors.c000000,
              height: 1,
              fontFamily: FontFamily.fRobotoMedium),
        ),
      ),
    );
  }

  ///球员操作
  Widget _playerInfo() {
    NbaPlayerInfosPlayerBaseInfoList palyer =
        Utils.getPlayBaseInfo(item.playerId);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150.w,
            child: Text(
              palyer.ename,
              style: 21.w7(
                  height: 1,
                  color: AppColors.c262626,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          10.5.vGap,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${Utils.getTeamInfo(palyer.teamId).shortEname} · ${palyer.position}",
                style: 12.w4(
                  height: 1,
                  fontFamily: FontFamily.fRobotoRegular,
                ),
              ),
              9.hGap,
              // if (CacheApi.playerStatusMap[item.playerStatus]?.statsId != null)
              //   IconWidget(
              //     iconWidth: 20.w,
              //     iconHeight: 20.w,
              //     icon: Utils.getStatusUrl(
              //         CacheApi.playerStatusMap[item.playerStatus]?.statsId),
              //   ),
              // 4.hGap,
              Visibility(
                visible: Utils.getPlayBaseInfo(item.playerId).injuries,
                child: IconWidget(
                  iconWidth: 16.w,
                  iconHeight: 16.w,
                  icon: Assets.commonUiCommonIconInjury,
                ),
              )
            ],
          ),
          // 14.5.vGap,
          // Row(
          //   children: [
          //     Container(
          //       width: 45.w,
          //       height: 29.w,
          //       padding: EdgeInsets.only(left: 5.w),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(4.w),
          //         border: Border.all(width: 1.w, color: AppColors.cE6E6E),
          //       ),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             LangKey.gameNamePow.tr,
          //             style: 8.w4(
          //                 height: 0.8, fontFamily: FontFamily.fRobotoRegular),
          //           ),
          //           3.5.vGap,
          //           Text(
          //             "${palyer.playerStrength}",
          //             style: 12.w4(
          //                 height: 0.8, fontFamily: FontFamily.fOswaldMedium),
          //           ),
          //         ],
          //       ),
          //     ),
          //     // 4.hGap,
          //     // Container(
          //     //   width: 45.w,
          //     //   height: 29.w,
          //     //   padding: EdgeInsets.only(left: 5.w),
          //     //   decoration: BoxDecoration(
          //     //     borderRadius: BorderRadius.circular(4.w),
          //     //     border: Border.all(width: 1.w, color: AppColors.cE6E6E),
          //     //   ),
          //     //   child: Column(
          //     //     mainAxisAlignment: MainAxisAlignment.center,
          //     //     crossAxisAlignment: CrossAxisAlignment.start,
          //     //     children: [
          //     //       Text(
          //     //         LangKey.playerNameSalary.tr,
          //     //         style: 8.w4(
          //     //             height: 0.8, fontFamily: FontFamily.fRobotoRegular),
          //     //       ),
          //     //       3.5.vGap,
          //     //       Text(
          //     //         Utils.formatMoney(palyer.salary),
          //     //         style: 12.w4(
          //     //             height: 0.8, fontFamily: FontFamily.fOswaldMedium),
          //     //       ),
          //     //     ],
          //     //   ),
          //     // ),
          //     // 4.hGap,
          //     // MtInkWell(
          //     //   showScale: showArrow,
          //     //   // minScale: showArrow ? 0.9 : 1,
          //     //   onTap: () {
          //     //     // controller.recoverPower(type: 1, uuid: item.uuid);
          //     //     if (!showArrow) return;
          //     //     controller.recove();
          //     //   },
          //     //   child: Container(
          //     //     // width: 73.w,
          //     //     height: 29.w,
          //     //     alignment: Alignment.center,
          //     //     padding: EdgeInsets.only(left: 5.5.w, right: 8.5.w),
          //     //     decoration: BoxDecoration(
          //     //       borderRadius: BorderRadius.circular(4.w),
          //     //       border: Border.all(width: 1.w, color: AppColors.cE6E6E),
          //     //     ),
          //     //     child: Row(
          //     //       mainAxisAlignment: MainAxisAlignment.center,
          //     //       children: [
          //     //         IconWidget(
          //     //           icon: Assets.managerUiManagerIconRecover,
          //     //           iconWidth: 12.5.w,
          //     //         ),
          //     //         3.5.hGap,
          //     //         AnimatedNum(
          //     //           number: item.power * 100 ~/ 100,
          //     //           textStyle: 16.w4(
          //     //               color: AppColors.c000000,
          //     //               height: 1,
          //     //               fontFamily: FontFamily.fOswaldMedium),
          //     //         ),
          //     //         Text(
          //     //           "%",
          //     //           style: 16.w4(
          //     //               color: AppColors.c000000,
          //     //               height: 1,
          //     //               fontFamily: FontFamily.fOswaldMedium),
          //     //         ),
          //     //         if (showArrow) 3.hGap,
          //     //         if (showArrow)
          //     //           IconWidget(
          //     //             icon: Assets.commonUiCommonIconSystemJumpto,
          //     //             iconWidth: 5.w,
          //     //             iconColor: AppColors.c000000,
          //     //           ),
          //     //       ],
          //     //     ),
          //     //   ),
          //     // ),
          //   ],
          // )
        ],
      ),
    );
  }

  Widget _centerInfo(BuildContext context) {
    return Row(
      key: ValueKey(item.uuid),
      children: [
        13.hGap,
        PlayerCard(
          playerId: item.playerId,
          player: item,
          width: 73.w,
          height: 93.w,
          isMyPlayer: true,
          grade: Utils.formatGrade(Utils.getPlayBaseInfo(item.playerId).grade),
          level: item.breakThroughGrade,
        ),
        11.hGap,
        _playerInfo(),
        9.hGap,
        if (!isSelect)
          controller.isFire && isBag
              ? MtInkWell(
                  onTap: () {
                    //解雇
                    BottomTipDialog.showWithSound(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return FireDialog(item: item);
                        });
                  },
                  child: IconWidget(
                    iconWidth: 12.w,
                    backgroudWitdh: 28.w,
                    backgroudheight: 28.w,
                    borderRadius: BorderRadius.circular(9.w),
                    backgroudColor: AppColors.cD60D20,
                    icon: Assets.iconUiIconDelete02,
                    iconColor: AppColors.cFFFFFF,
                  ),
                )
              : MtInkWell(
                  onTap: () {
                    //换人
                    if (item.position > 0) {
                      String p = item.position > 0
                          ? Utils.getPosition(item.position)
                          : Utils.getPlayBaseInfo(item.playerId).position;
                      int bagCount = controller.myBagList
                          .where((e) =>
                              Utils.getPlayBaseInfo(e.playerId)
                                  .position
                                  .contains(p) &&
                              e.position < 0)
                          .length;
                      int count = 0;
                      if (item.position < 0) {
                        count = controller.myTeamEntity.teamPlayers
                            .where((e) => Utils.getPlayBaseInfo(e.playerId)
                                .position
                                .contains(p))
                            .length;
                      } else if (item.position > 0) {
                        int teamCount = controller.myTeamEntity.teamPlayers
                            .where((e) =>
                                Utils.getPlayBaseInfo(e.playerId)
                                    .position
                                    .contains(p) &&
                                e.position == 0)
                            .length;
                        count = teamCount + bagCount;
                      } else if (item.position == 0) {
                        int teamCount = controller.myTeamEntity.teamPlayers
                            .where((e) =>
                                Utils.getPlayBaseInfo(e.playerId)
                                    .position
                                    .contains(p) &&
                                e.position > 0)
                            .length;
                        count = teamCount + bagCount;
                      }

                      if (count == 0) {
                        EasyLoading.showToast(
                            "No players in the same position");
                        return;
                      }
                    }
                    // if (controller.isShowDialog.value) {
                    //   controller.item2 = item;
                    //   controller.item2.isChange.value = true;
                    // }
                    controller.playerChangeTap(context, isBag, item);
                  },
                  child: Container(
                    width: 59.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.c666666),
                        borderRadius: BorderRadius.circular(9.w)),
                    child: IconWidget(
                      iconWidth: 17.w,
                      borderRadius: BorderRadius.circular(9.w),
                      icon: Assets.iconUiIconSwitch02,
                      iconColor: AppColors.c000000,
                    ),
                  ),
                ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 121.w,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Row(
            children: [
              // _playerPosition(),

              SizedBox(
                width: item.position >= 0 ? 16.w : 3.w,
              ),

              Expanded(
                // child: _centerInfo(context),
                child: item.position < 0
                    ? _centerInfo(context)
                    : AnimatedSwitcher(
                        duration: controller.changeDuration.milliseconds,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          //  var tween = Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
                          return SlideTransitionX(
                            direction: AxisDirection.left,
                            position: animation,
                            showReverse: controller.showReserve,
                            child: child,
                          );
                        },
                        child: _centerInfo(context)),
              ),
              if (item.position == 0 &&
                  controller.isShowDialog.value &&
                  isSelect)
                MtInkWell(
                  onTap: () async {
                    //下阵容
                    controller.item1.isChange.value = false;
                    controller.item2.isChange.value = false;
                    controller.isAdd = false;
                    await controller.changeTeamPlayer(isDown: true);
                    if (onDownCallBack != null) {
                      onDownCallBack!();
                    }
                  },
                  child: Container(
                    width: 59.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.c666666),
                        borderRadius: BorderRadius.circular(9.w)),
                    child: IconWidget(
                        iconWidth: 18.w,
                        icon: Assets.managerUiManagerLineupUnload),
                  ),
                ),
              16.hGap,
            ],
          ),
          Positioned(
            left: 0,
            child: _playerPosition(),
          )
        ],
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    this.grade,
    required this.width,
    required this.height,
    required this.playerId,
    this.player,
    this.radius,
    this.fontSize = 14,
    this.fontColor = AppColors.c000000,
    // this.playerId = 0,
    this.getXRouteId,
    this.tabStr,
    this.level,
    this.canTap = true,
    this.isMyPlayer = false,
  });

  final double width;
  final double height;
  final int playerId;
  final TeamPlayerInfoEntity? player;
  final String? grade;
  final int? level;
  final double? radius;
  final double fontSize;
  final Color fontColor;
  // final bool showGrade;

  final int? getXRouteId;
  final String? tabStr;
  final bool canTap;
  final bool isMyPlayer;

  @override
  Widget build(BuildContext context) {
    Widget child = Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.cF1F1F1,
            borderRadius: BorderRadius.circular(9.w),
          ),
          child: ImageWidget(
            url: Utils.getPlayUrl(playerId),
            imageFailedPath: Assets.iconUiDefault04,
            borderRadius: BorderRadius.circular(9.w),
            width: width,
            height: height,
          ),
        ),
        //球员等级
        if (ObjectUtil.isNotEmpty(grade))
          Positioned(
            top: 5.5.w,
            left: 5.w,
            child: Text(
              // text: Utils.formatGrade(grade ?? 'S'),
              "${Utils.getPlayBaseInfo(playerId).playerScore}",
              style: 16.w4(height: 0.75, fontFamily: FontFamily.fOswaldBold),
            ),
          ),

        ///升星等级
        // if (ObjectUtil.isNotEmpty(level))
        //   Positioned(
        //     bottom: -2.w,
        //     left: 0.w,
        //     child: Stack(
        //       alignment: Alignment.center,
        //       children: [
        //         IconWidget(
        //           iconWidth: 22.5.w,
        //           icon: Assets.managerUiManagerPlayerstar,
        //         ),
        //         Positioned(
        //           // top: 7.w,
        //           child: Text(
        //             "$level",
        //             style: 12.w4(
        //                 color: AppColors.cFFFFFF,
        //                 height: 0.75,
        //                 fontFamily: FontFamily.fRobotoMedium),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),

        Positioned(
            right: 4.w,
            top: 4.w,
            child: Container(
              width: 16.w,
              height: 16.w,
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(4.w),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                Assets.iconUiIconRead,
                width: 9.w,
                color: AppColors.c000000,
              ),
            )),
        // Positioned(
        //     bottom: 0,
        //     right: 0,
        //     child: Container(
        //       width: 41.w,
        //       height: 18.w,
        //       alignment: Alignment.center,
        //       decoration: BoxDecoration(
        //         color: AppColors.c000000,
        //         borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(9.w),
        //             bottomRight: Radius.circular(9.w)),
        //       ),
        //       child: RichText(
        //           text: TextSpan(children: [
        //         TextSpan(
        //           text: "OVR",
        //           style: 9.w4(
        //               color: AppColors.cFFFFFF,
        //               height: 1,
        //               fontFamily: FontFamily.fRobotoRegular),
        //         ),
        //         TextSpan(
        //           text: " ${Utils.getPlayBaseInfo(playerId).playerScore}",
        //           style: 12.w4(
        //               color: AppColors.cFFFFFF,
        //               height: 1,
        //               fontFamily: FontFamily.fOswaldBold),
        //         )
        //       ])),

        //       // child: Row(
        //       //   mainAxisAlignment: MainAxisAlignment.center,
        //       //   crossAxisAlignment: CrossAxisAlignment.center,
        //       //   children: [
        //       //     Container(
        //       //       color: Colors.red,
        //       //       alignment: Alignment.center,
        //       //       // height: 7.w,
        //       //       child: Text(
        //       //         "OVR",
        //       //         style: 9.w4(
        //       //             color: AppColors.cFFFFFF,
        //       //             // height: 0.75,
        //       //             fontFamily: FontFamily.fRobotoRegular),
        //       //       ),
        //       //     ),
        //       //     2.hGap,
        //       //     Container(
        //       //       alignment: Alignment.center,
        //       //       color: Colors.red,
        //       //       // height: 10.5.w,
        //       //       child: Text(
        //       //         "${Utils.getPlayBaseInfo(playerId).playerScore}",
        //       //         style: 12.w4(
        //       //             color: AppColors.cFFFFFF,
        //       //             // height: 0.75,
        //       //             fontFamily: FontFamily.fOswaldBold),
        //       //       ),
        //       //     )
        //       //   ],
        //       // ),
        //     ))
      ],
    );
    if (canTap && player != null) {
      child = InkWell(
        onTap: () {
          if (canTap && player != null) {
            Get.toNamed(RouteNames.picksPlayerDetail,
                arguments: PlayerDetailPageArguments(playerId));
          }
        },
        child: child,
      );
    }
    return child;
  }
}
