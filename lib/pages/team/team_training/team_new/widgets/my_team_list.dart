/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 21:19:02
 * @LastEditTime: 2025-01-23 17:28:21
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 21:19:02
 * @LastEditTime: 2024-09-29 16:03:41
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
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

  @override
  Widget build(BuildContext context) {
    // var list = controller.myTeamEntity.teamPlayers
    //     .where((e) => e.position == 0)
    //     .toList();
    // list.sort(controller.comparePlayers);
    var list = controller.subList;
    return SizedBox(
      // width: 360.w,
      child: Stack(
        children: [
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return index < list.length
                  ? Container(
                      color: Colors.white,
                      height: 121.w,
                      width: double.infinity,
                    )
                  : (index < controller.myTeamEntity.benchCount
                      ? const EmptyPlayer()
                      : lock());
            },
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1.w,
              color: AppColors.cE6E6E,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
            ),
            itemCount: controller.myTeamEntity.benchCount + 1,
          ),
          AnimatedList(
            key: controller.listKey,
            padding: EdgeInsets.symmetric(vertical: 10.w),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index, animation) {
              return animatedSubItem(index, animation);
            },
            initialItemCount: controller.subList.length,
          ),
        ],
      ),
    );
  }
}

Widget animatedSubItem(index, animation) {
  final controller = Get.find<TeamController>();
  return Column(
    children: [
      SizeTransition(
        sizeFactor: animation,
        child: index < controller.subList.length
            ? PlayerItem(item: controller.subList[index])
            : (index < controller.myTeamEntity.benchCount
                ? Container()
                : Container()),
      ),
      if (index < controller.subList.length - 1)
        Container(
          width: double.infinity,
          height: 1.w,
          color: AppColors.cE6E6E,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
        )
    ],
  );
}

Widget lock() {
  final controller = Get.find<TeamController>();
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
            Row(
              children: [
                IconWidget(
                    iconWidth: 20.w,
                    icon: Assets.managerUiManagerIconCurrency04),
                4.hGap,
                Text(
                  "${controller.getLockCup()}  ${LangKey.teamButtonUnlocked.tr}",
                  style: 21.w4(fontFamily: FontFamily.fOswaldMedium),
                )
              ],
            )
          ],
        ),
      ));
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
        LangKey.teamNameSubstitiute.tr,
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
                LangKey.teamTipsAddPlayer.tr,
                style: 21.w4(fontFamily: FontFamily.fOswaldMedium),
              ),
            ),
            if (showChangeButton)
              MtInkWell(
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
                  width: 59.w,
                  height: 40.w,
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
