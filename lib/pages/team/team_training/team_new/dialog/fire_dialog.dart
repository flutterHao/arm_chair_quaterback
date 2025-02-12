/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-05 17:46:56
 * @LastEditTime: 2024-12-14 18:55:20
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-05 17:46:56
 * @LastEditTime: 2024-12-09 19:11:08
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/top_toast_dialog.dart';

import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FireDialog extends StatefulWidget {
  const FireDialog({super.key, required this.item});
  final TeamPlayerInfoEntity item;

  @override
  State<FireDialog> createState() => _FireDialogState();
}

class _FireDialogState extends State<FireDialog>
    with SingleTickerProviderStateMixin {
  TeamController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    var cost = Utils.formatMoney(ctrl.getFireMoney(widget.item));
    return Container(
      width: double.infinity,
      height: 419.w,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
      child: Column(
        children: [
          12.vGap,
          Container(
            decoration: BoxDecoration(
                color: AppColors.ccccccc,
                borderRadius: BorderRadius.circular(2.w)),
            height: 4.w,
            width: 44.w,
          ),
          37.vGap,
          IconWidget(
            iconWidth: 61.5.w,
            icon: Assets.commonUiCommonIconSystemDanger,
            iconColor: AppColors.c000000,
          ),
          29.5.vGap,
          Text(
            "ARE YOU SURE",
            style: 27.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.75),
          ),
          11.5.vGap,
          Text(
            "Do you want to fire this player?",
            style: 14.w4(
                fontFamily: FontFamily.fRobotoRegular,
                color: AppColors.c000000),
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "COST:",
                style: 16.w4(fontFamily: FontFamily.fOswaldBold),
              ),
              10.hGap,
              Image.asset(
                Assets.commonUiCommonProp05,
                width: 24.w,
              ),
              3.hGap,
              Text(
                cost,
                style: 16.w4(fontFamily: FontFamily.fOswaldBold),
              ),
            ],
          ),
          7.5.vGap,
          MtInkWell(
            onTap: () async {
              Navigator.pop(context);
              await ctrl.dismissPlayer(context, widget.item.uuid);
              await Future.delayed(const Duration(milliseconds: 500));
              await showTopToastDialog(
                  child: FireSuccessDialog(item: widget.item));
              // await showDialog(
              //     barrierColor: Colors.transparent,
              //     context: Get.context!,
              //     useSafeArea: false,
              //     builder: (context) {
              //       return TopToastDialog(
              //           child: FireSuccessDialog(item: widget.item));
              //     });
              HomeController.to.updateMoney();
              // await Future.delayed(Duration(milliseconds: 2000));
            },
            child: Container(
              height: 51.w,
              width: 343.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.cD60D20,
                  borderRadius: BorderRadius.circular(9.w)),
              child: Text(
                "FIRE",
                style: 23.w5(
                    color: AppColors.cFFFFFF,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium),
              ),
            ),
          ),
          9.vGap,
          MtInkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 51.w,
              width: 343.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: AppColors.c666666),
                  borderRadius: BorderRadius.circular(9.w)),
              child: Text(
                "CANCEL",
                style: 23.w5(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium),
              ),
            ),
          ),
          41.vGap,
        ],
      ),
    );
  }
}

class FireSuccessDialog extends GetView<TeamController> {
  const FireSuccessDialog({super.key, required this.item});
  final TeamPlayerInfoEntity item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: 57.w,
              height: 64.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.w),
                  color: AppColors.c262626),
              child: ImageWidget(
                  width: 57.w,
                  height: 64.w,
                  borderRadius: BorderRadius.circular(6.w),
                  url: Utils.getPlayUrl(item.playerId)),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: IconWidget(
                    iconWidth: 20.w, icon: Assets.commonUiCommonIconLayoff))
          ],
        ),
        SizedBox(width: 14.5.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Succeed in firing".toUpperCase(),
              style: 19.w4(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fOswaldRegular),
            ),
            10.vGap,
            Text(
              "You've burned through ${Utils.formatMoney(controller.getFireMoney(item))} of money",
              style: 12.w4(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoRegular),
            )
          ],
        )
      ],
    );
  }
}
