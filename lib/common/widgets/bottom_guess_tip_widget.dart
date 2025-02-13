import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/picks_guess_confirm_dialog_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
/// 竞猜选择结果底部弹框
///@auther gejiahui
///created at 2024/11/26/17:51

class BottomGuessTipWidget extends StatelessWidget {
  const BottomGuessTipWidget(
      {super.key,
      this.bottomValue,
      this.needCheckHomeTab = true,
      this.widgetReady = true});

  final double? bottomValue;
  final bool needCheckHomeTab;
  final bool widgetReady;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var tabIndex = Get.find<HomeController>().tabIndex.value;
      if (![1, 3].contains(tabIndex) && needCheckHomeTab) {
        return const SizedBox.shrink();
      }
      var picksIndexController = Get.find<PicksIndexController>();
      var leagueController = Get.find<LeagueController>();
      var value = picksIndexController.choiceSize.value;
      value += leagueController.choiceSize.value;
      return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: 0,
          right: 0,
          bottom: !widgetReady
              ? -75.w
              : value <= 0
                  ? -75.w
                  : bottomValue ??
                      75.w + 7.w + MediaQuery.of(context).padding.bottom,
          child: Center(
            child: MtInkWell(
              scaleX: true,
              minScale: 0.95,
              onTap: () async {
                await BottomTipDialog.showWithSound(
                    isScrollControlled: true,
                    backgroundColor: AppColors.cTransparent,
                    context: Get.context!,
                    builder: (context) {
                      return const PicksGuessConfirmDialogV2();
                    });
                picksIndexController.batchDeleteOpen.value = false;
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.c000000,
                      borderRadius: BorderRadius.circular(16.w),
                      border: Border.all(color: AppColors.cFF7954, width: 2.w)),
                  width: 360.w,
                  height: 66.w,
                  padding: EdgeInsets.only(left: 17.w, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LangKey.pickTabLineUp.tr,
                        style: 16.w5(
                            color: AppColors.cFFFFFF,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                      9.vGap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: List.generate(6, (index) {
                              Color color = AppColors.c4D4D4D;
                              if (index + 1 <= value) {
                                color = AppColors.cFF7954;
                              }
                              return IconWidget(
                                iconWidth: 19.w,
                                icon: Assets.commonUiCommonIconPick,
                                iconColor: color,
                              );
                            }),
                          ),
                          Container(
                            height: 24.w,
                            padding: EdgeInsets.symmetric(horizontal: 13.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.cFF7954,
                                borderRadius: BorderRadius.circular(12.w)),
                            child: Text(
                              "${value > 0 ? picksIndexController.picksDefine.powerBetWin[value - 1] : "0"}x",
                              style: 16.w5(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ));
    });
  }
}
