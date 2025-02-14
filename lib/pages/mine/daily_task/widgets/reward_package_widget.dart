import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:flutter/foundation.dart';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/easy_animation_controller.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/1/13/15:22

class RewardPackageWidget extends StatefulWidget {
  const RewardPackageWidget({super.key, required this.claimAndExit});

  final Function claimAndExit;

  @override
  State<RewardPackageWidget> createState() => _RewardPackageWidgetState();
}

class _RewardPackageWidgetState extends State<RewardPackageWidget>
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
        duration: const Duration(milliseconds: 300));
    Future.delayed(Duration.zero, () {
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  back({Function? onEnd}) {
    animationController.reverse().then((v) {
      Get.back();
      onEnd?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (isPop, result) {
        if (!isPop) {
          back();
        }
      },
      child: Obx(() {
        return Container(
          width: size.width,
          height: size.height,
          color: (Theme.of(context).dialogTheme.barrierColor ?? Colors.black54)
              .withOpacity(min(0.5, animationController.value.value)),
          child: Stack(
            children: [
              Positioned(
                left: -width + (width * animationController.value.value),
                width: size.width,
                height: size.height,
                child: Row(
                  children: [
                    Container(
                      width: 243.w,
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(9.w),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: kIsWeb
                                ? 0
                                : Platform.isIOS
                                    ? MediaQuery.of(context).padding.top
                                    : 0,
                          ),
                          31.vGap,
                          Container(
                            margin: EdgeInsets.only(left: 16.w),
                            child: Text(
                              LangKey.dailyTaksTabMyReward.tr,
                              style: 19.w5(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium,
                              ),
                            ),
                          ),
                          10.vGap,
                          Divider(
                            color: AppColors.cD1D1D1,
                            height: 1.w,
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.separated(
                                itemCount:
                                    controller.getTurnRewardList().length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var item =
                                      controller.getTurnRewardList()[index];
                                  return Container(
                                    height: 72.w,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        IconWidget(
                                            iconWidth: 36.w,
                                            icon: controller.getImageByPath(item
                                                .propDefineEntity.propIcon)),
                                        12.hGap,
                                        Expanded(
                                          child: Text(
                                            item.propDefineEntity.propName,
                                            style: 14.w4(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fRobotoRegular,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 35.w,
                                          alignment: Alignment.center,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              controller
                                                  .getPropNum(item.awardItem),
                                              style: 12.w4(
                                                color: AppColors.c000000,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fRobotoRegular,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: AppColors.cD1D1D1,
                                    height: 1.w,
                                  );
                                },
                              ),
                            ),
                          )),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.cFFFFFF,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.cB3B3B3.withOpacity(0.2),
                                    offset: Offset.zero,
                                    blurRadius: 3.w,
                                    spreadRadius: 3.w,
                                  )
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                36.vGap,
                                MtInkWell(
                                  onTap: () {
                                    print('claim and exit ');
                                    back(onEnd: () {
                                      BottomTipDialog.show(
                                          context: context,
                                          height: 384.w,
                                          btnDirection: Axis.horizontal,
                                          centerWidget: const Expanded(child: SizedBox()),
                                          title: LangKey.dailyTaksTipsCAE.tr,
                                          desc: LangKey.dailyTaksTipsExit.tr,
                                          confirmStr:
                                              LangKey.dailyTaksButtonPlayOn.tr,
                                          cancelStr:
                                              LangKey.dailyTaksButtonCAE.tr,
                                          onTap: () {
                                            print('PLAY ON');
                                            Get.back();
                                          },
                                          cancelTap: () {
                                            print('CLAIM AND EXIT');
                                            widget.claimAndExit.call();
                                          });
                                    });
                                  },
                                  child: Container(
                                    width: 211.w,
                                    height: 51.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9.w),
                                      border: Border.all(
                                        color: AppColors.c666666,
                                        width: 1.w,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        LangKey.dailyTaksButtonCAE.tr,
                                        style: 23.w5(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                10.vGap,
                                SizedBox(
                                  width: 193.w,
                                  child: Text(
                                    LangKey.dailyTaksTipsCAE.tr,
                                    textAlign: TextAlign.center,
                                    style: 12.w4(
                                      color: AppColors.c4D4D4D,
                                      height: 1.2,
                                      fontFamily: FontFamily.fRobotoRegular,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).padding.bottom,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () => back(),
                      child: Container(),
                    ))
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
