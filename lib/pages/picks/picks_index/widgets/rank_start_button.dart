/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-24 21:29:09
 * @LastEditTime: 2024-11-04 16:19:29
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/picks_guess_confirm_dialog_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/13/11:09

class RankStartButton extends StatelessWidget {
  const RankStartButton(
    this.size, {
    super.key,
  });

  final int size;

  @override
  Widget build(BuildContext context) {
    minLimit() {
      var length =
          Get.find<PicksIndexController>().getChoiceGuessPlayers().length;
      if (length < 2) {
        EasyLoading.showToast("Select at least 2");
        return true;
      }
      return false;
    }

    return InkWell(
      onTap: () async {
        print('InkWellds');
        if (minLimit()) {
          return;
        }
        await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: AppColors.cTransparent,
            context: Get.context!,
            builder: (context) {
              return const PicksGuessConfirmDialogV2();
            });
        Get.find<PicksIndexController>().batchDeleteOpen.value = false;
      },
      child: BtnBackground(
        child: SizedBox(
          width: double.infinity,
          height: 43.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                child: Center(
                  child: Container(
                    height: 35.w,
                    width: 35.w,
                    margin: EdgeInsets.only(left: 3.w),
                    decoration: BoxDecoration(
                        color: AppColors.cFF7954,
                        borderRadius: BorderRadius.circular(18.w)),
                    alignment: Alignment.center,
                    child: AnimatedNumber(number: size),
                    // child: Text.rich(
                    //     textAlign: TextAlign.end,
                    //     TextSpan(children: [
                    //       TextSpan(
                    //           text: "$size",
                    //           style: TextStyle(
                    //               fontSize: 14.sp,
                    //               fontWeight: FontWeight.bold)),
                    //     ])),
                  ),
                ),
              ),
              Text("SUBMIT", style: 16.w7(color: AppColors.cFFFFFF)),
            ],
          ),
        ),
      ),
    );
  }
}
