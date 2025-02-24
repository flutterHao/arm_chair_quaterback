import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuyGoBottomsheet extends StatelessWidget {
  BuyGoBottomsheet({super.key});
  final TrainingController controller = Get.find<TrainingController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 466.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration:
          BoxDecoration(color: AppColors.cFFFFFF, borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
      child: Column(
        children: [
          const DialogTopBtn(),
          20.vGap,
          Text(
            'BUY FREQUENCY',
            style: 27.w5(fontFamily: FontFamily.fOswaldMedium),
          ),
          Text(
            'Do you want to buy ${controller.trainDefine.coinBuySlot} frequency for  ${controller.trainDefine.trainCoinNum[controller.trainingInfo.training.todayBuyCount]}K coins?',
            style: 14.w5(fontFamily: FontFamily.fRobotoRegular),
          ),
          28.vGap,
          Container(
            height: 144.w,
            width: 144.w,
            decoration: BoxDecoration(color: AppColors.cF2F2F2, shape: BoxShape.circle),
            child: Column(
              children: [
                Spacer(),
                IconWidget(iconWidth: 76.w, icon: Assets.commonUiCommonProp04),
                Text(
                  '+ ${controller.trainDefine.ballMaxNum}',
                  style: 20.w4(fontFamily: FontFamily.fOswaldBold),
                ),
                22.vGap
              ],
            ),
          ),
          28.vGap,
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "COST:",
                style: 16.w4(height: .8, fontFamily: FontFamily.fOswaldMedium),
              ),
              10.hGap,
              Image.asset(
                Assets.commonUiCommonIconCurrency02,
                width: 20.w,
              ),
              5.hGap,
              Text(
                "${controller.trainDefine.trainCoinNum[controller.trainingInfo.training.todayBuyCount]}",
                style: 16.w4(height: .5, fontFamily: FontFamily.fOswaldMedium),
              ),
            ],
          )),
          7.5.vGap,
          Container(
            height: 51.w,
            constraints: BoxConstraints(maxWidth: 343.w),
            decoration: BoxDecoration(color: AppColors.c000000, borderRadius: BorderRadius.circular(9.w)),
            child: MtInkWell(
              splashColor: Colors.transparent,
              onTap: () {
                TrainingController controller = Get.find<TrainingController>();
                Get.back();
                controller.buyTrainingBall(controller.trainDefine.coinBuySlot);
                controller.startSlot();
                Utils.saveNotTip("ball");
              },
              child: Center(
                child: Text(
                  'BUY',
                  style: 23.w5(color: AppColors.cF2F2F2, height: 1, fontFamily: FontFamily.fOswaldMedium),
                ),
              ),
            ),
          ),
          9.vGap,
          Container(
            height: 51.w,
            constraints: BoxConstraints(maxWidth: 343.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.w), border: Border.all(color: AppColors.c000000, width: 1.w)),
            child: MtInkWell(
              onTap: () => Get.back(),
              child: Center(
                child: Text(
                  LangKey.gameButtonCancel.tr,
                  style: 23.w5(color: AppColors.c000000, height: 1, fontFamily: FontFamily.fOswaldMedium),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
