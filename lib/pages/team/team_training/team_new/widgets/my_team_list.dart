/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 21:19:02
 * @LastEditTime: 2024-12-28 19:52:53
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 21:19:02
 * @LastEditTime: 2024-09-29 16:03:41
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainPlayerList extends GetView<TeamController> {
  const MainPlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    var list = controller.myTeamEntity.teamPlayers
        .where((e) => e.position > 0)
        .toList();
    list.sort((a, b) => a.position.compareTo(b.position));
    return SizedBox(
      // width: 360.w,
      child: ListView.separated(
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
    );
  }
}

class SubPlayerList extends GetView<TeamController> {
  const SubPlayerList({super.key});

  // Widget _emptyPlayer(context) {
  //   return InkWell(
  //       onTap: () {
  //         if (controller.myBagList.where((e) => e.position == -1).isEmpty) {
  //           EasyLoading.showToast("No players in the stash");
  //           return;
  //         }
  //         controller.addPlay(context);
  //       },
  //       child: SizedBox(
  //         width: double.infinity,
  //         height: 121.w,
  //         child: Row(
  //           children: [
  //             _subPosition(),
  //             13.hGap,
  //             Container(
  //               width: 73.w,
  //               height: 93.w,
  //               alignment: Alignment.center,
  //               decoration: BoxDecoration(
  //                   color: AppColors.cF1F1F1,
  //                   borderRadius: BorderRadius.circular(9.w)),
  //               child: Image.asset(
  //                 Assets.managerUiManagerTacticsIconEmpty,
  //                 width: 35.w,
  //                 height: 35.w,
  //               ),
  //             ),
  //             11.hGap,
  //             Expanded(
  //               child: Text(
  //                 "EMPTY",
  //                 style: 21.w4(fontFamily: FontFamily.fOswaldMedium),
  //               ),
  //             ),
  //             MtInkwell(
  //               onTap: () async {
  //                 if (controller.myBagList
  //                     .where((e) => e.position == -1)
  //                     .isEmpty) {
  //                   EasyLoading.showToast("No players in the stash");
  //                   return;
  //                 }
  //                 controller.addPlay(context);
  //               },
  //               child: Container(
  //                 width: 36.w,
  //                 height: 36.w,
  //                 alignment: Alignment.center,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(9.w),
  //                     border: Border.all(color: AppColors.c666666, width: 1)),
  //                 child: IconWidget(
  //                   iconWidth: 18.w,
  //                   icon: Assets.commonUiCommonIconSystemExchange,
  //                   iconColor: AppColors.c000000,
  //                 ),
  //               ),
  //             ),
  //             16.hGap,
  //           ],
  //         ),
  //       ));
  // }

  Widget _lock() {
    return InkWell(
        onTap: () {},
        child: SizedBox(
          width: double.infinity,
          height: 121.w,
          child: Row(
            children: [
              _subPosition(),
              13.hGap,
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
                "${controller.getLockCup()} Trophies Unlocked",
                style: 21.w4(fontFamily: FontFamily.fOswaldMedium),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var list = controller.myTeamEntity.teamPlayers
        .where((e) => e.position == 0)
        .toList();
    // list.sort(controller.comparePlayers);
    return SizedBox(
      // width: 360.w,
      child: Column(
        children: [
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return index < list.length
                  ? PlayerItem(item: list[index])
                  : (index < controller.myTeamEntity.benchCount
                      ? EmptyPlayer()
                      : _lock());
            },
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1.w,
              color: AppColors.cE6E6E,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
            ),
            itemCount: controller.myTeamEntity.benchCount + 1,
          ),
        ],
      ),
    );
  }
}

///球员位置
Widget _subPosition() {
  return Container(
    height: 93.w,
    width: 16.w,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: AppColors.ccccccc,
        borderRadius: BorderRadius.horizontal(right: Radius.circular(9.w))),
    child: RotatedBox(
      quarterTurns: -1,
      child: Text(
        "SUB",
        style: 14.w4(
            color: AppColors.c000000,
            height: 1,
            fontFamily: FontFamily.fRobotoMedium),
      ),
    ),
  );
}

class EmptyPlayer extends StatelessWidget {
  const EmptyPlayer({super.key, this.showChangeButton = true});
  final bool showChangeButton;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TeamController>();
    return InkWell(
      onTap: () {
        if (controller.myBagList.where((e) => e.position == -1).isEmpty) {
          EasyLoading.showToast("No players in the stash");
          return;
        }
        controller.addPlay(context);
      },
      child: Container(
        width: double.infinity,
        height: 121.w,
        color: Colors.white,
        child: Row(
          children: [
            _subPosition(),
            13.hGap,
            Container(
              width: 73.w,
              height: 93.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.cF1F1F1,
                  borderRadius: BorderRadius.circular(9.w)),
              child: Image.asset(
                Assets.managerUiManagerTacticsIconEmpty,
                width: 35.w,
                height: 35.w,
              ),
            ),
            11.hGap,
            Expanded(
              child: Text(
                "EMPTY",
                style: 21.w4(fontFamily: FontFamily.fOswaldMedium),
              ),
            ),
            if (showChangeButton)
              MtInkwell(
                onTap: () async {
                  if (controller.myBagList
                      .where((e) => e.position == -1)
                      .isEmpty) {
                    EasyLoading.showToast("No players in the stash");
                    return;
                  }
                  controller.addPlay(context);
                },
                child: Container(
                  width: 36.w,
                  height: 36.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      border: Border.all(color: AppColors.c666666, width: 1)),
                  child: IconWidget(
                    iconWidth: 18.w,
                    icon: Assets.commonUiCommonIconSystemExchange,
                    iconColor: AppColors.c000000,
                  ),
                ),
              ),
            16.hGap,
          ],
        ),
      ),
    );
  }
}
