import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/easy_animation_controller.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/1/14/11:41

class SuccessWidget extends StatefulWidget {
  const SuccessWidget({super.key});

  @override
  State<SuccessWidget> createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<SuccessWidget>
    with SingleTickerProviderStateMixin {
  late EasyAnimationController animationController;
  late DailyTaskController controller;

  @override
  void initState() {
    super.initState();
    animationController = EasyAnimationController(
        vsync: this,
        begin: 0.0,
        end: 1.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.elasticOut);
    animationController.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            animationController.forward(from: 0.0);
          }
        });
      }
    });
    Future.delayed(const Duration(milliseconds: 350), () {
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  back() {
    /// 退出弹框
    Get.back();

    /// 退出页面
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    var girlReward = controller.getGirlReward();
    var successTurnRewardList = controller.getSuccessTurnRewardList();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (pop, result) {
        if (!pop) {
          back();
        }
      },
      child: Column(
        children: [
          Expanded(
              child: InkWell(
                  onTap: () => back(),
                  child: Container(
                    width: double.infinity,
                  ))),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.vertical(top: Radius.circular(9.w)),
            ),
            child: Column(
              children: [
                DialogTopBtn(
                  onTap: () => back(),
                ),
                28.vGap,
                Container(
                  height: 144.w,
                  width: 144.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(72.w),
                      color: AppColors.c53CF8A.withOpacity(0.19)),
                  child: Center(
                    child: Obx(() {
                      return Transform.scale(
                        scale: animationController.value.value,
                        child: Container(
                          height: 115.w,
                          width: 115.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(58.w),
                              color: AppColors.c10A86A),
                          child: Center(
                            child: Container(
                              height: 45.w,
                              width: 45.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(23.w),
                                  color: AppColors.cFFFFFF),
                              child: Center(
                                child: IconWidget(
                                  iconWidth: 23.w,
                                  icon: Assets.iconUiIconRuidgt,
                                  iconColor: AppColors.c10A86A,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                17.vGap,
                Text(
                  "ALL REWARDS CLEARED",
                  style: 27.w5(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium,
                  ),
                ),
                if (girlReward != null)
                  Container(
                    width: 297.w,
                    margin: EdgeInsets.only(top: 41.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Expanded(
                        //   child: Column(
                        //     children: [
                        //       Container(
                        //         height: 28.w,
                        //         width: 139.w,
                        //         decoration: BoxDecoration(
                        //             color: AppColors.c000000,
                        //             borderRadius: BorderRadius.vertical(
                        //                 top: Radius.circular(9.w))),
                        //         alignment: Alignment.center,
                        //         child: Text(
                        //           "Prize Pool",
                        //           style: 16.w4(
                        //             color: AppColors.cFFFFFF,
                        //             height: 1,
                        //             fontFamily: FontFamily.fOswaldRegular,
                        //           ),
                        //         ),
                        //       ),
                        //       Container(
                        //         height: 65.w,
                        //         width: 139.w,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.vertical(
                        //                 bottom: Radius.circular(9.w)),
                        //             border: Border.all(
                        //               color: AppColors.cD1D1D1,
                        //               width: 1.w,
                        //             )),
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             IconWidget(
                        //                 iconWidth: 40.w,
                        //                 icon: Assets.commonUiCommonProp05),
                        //             4.vGap,
                        //             Text(
                        //               "500k",
                        //               style: 14.w4(
                        //                 color: AppColors.c000000,
                        //                 height: 1,
                        //                 fontFamily: FontFamily.fRobotoRegular,
                        //               ),
                        //             )
                        //           ],
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // 9.hGap,
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 28.w,
                                width: 139.w,
                                decoration: BoxDecoration(
                                    color: AppColors.c000000,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(9.w))),
                                alignment: Alignment.center,
                                child: Text(
                                  "Super Prize",
                                  style: 16.w4(
                                    color: AppColors.cFFFFFF,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldRegular,
                                  ),
                                ),
                              ),
                              Container(
                                height: 65.w,
                                width: 139.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(9.w)),
                                    border: Border.all(
                                      color: AppColors.cD1D1D1,
                                      width: 1.w,
                                    )),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(9.w),
                                          child: SizedBox(
                                            width: 47.w,
                                            height: 47.w,
                                            child: IconWidget(
                                                iconWidth: 47.w,
                                                icon:
                                                    controller.getImageByAward(
                                                        girlReward!.awardItem)),
                                          )),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                Container(
                  height:
                      74.w * min(3, (successTurnRewardList.length / 4).ceil()),
                  margin:
                      EdgeInsets.symmetric(horizontal: 59.w, vertical: 25.w),
                  child: GridView.builder(
                      itemCount: successTurnRewardList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 64 / 74, crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        var item = successTurnRewardList[index];
                        return Column(
                          children: [
                            SizedBox(
                              width: 41.w,
                              height: 41.w,
                              child: Center(
                                child: IconWidget(
                                    iconWidth: 34.w,
                                    icon: controller
                                        .getImageByAward(item.awardItem)),
                              ),
                            ),
                            8.vGap,
                            Text(
                              controller.getPropNum(item.awardItem),
                              style: 14.w4(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular,
                              ),
                            )
                          ],
                        );
                      }),
                ),
                MtInkWell(
                  onTap: () => back(),
                  child: Container(
                    height: 51.w,
                    width: 343.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.c666666,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(9.w),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "DONE",
                      style: 23.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium,
                      ),
                    ),
                  ),
                ),
                20.vGap,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
