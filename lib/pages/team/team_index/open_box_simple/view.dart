/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-17 18:13:43
 * @LastEditTime: 2025-03-20 20:14:52
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/player_card_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/custom_buttom.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/animated_arrow.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/box_card_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/ripper_animation.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box_simple/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box_simple/widgets/animted_box_simple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OpenBoxSimplePage extends GetView<OpenBoxSimpleController> {
  const OpenBoxSimplePage({
    super.key,
  });

  Widget _backgroud() {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Image.asset(
        Assets.managerUiManagerLineupBg,
        height: 370.h,
        color: AppColors.cE6E6E6,
        alignment: Alignment.topRight,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _openTitle() {
    var duration = 300.milliseconds;
    return AnimatedPositioned(
      duration: duration,
      top: controller.step == 2 ? 56.h : 84.h,
      // left: controller.step == 0 ? 29.w : 15.w,
      onEnd: () {
        controller.showClick.value = true;
      },
      child: AnimatedOpacity(
        duration: duration,
        opacity: controller.fallOutAnimation.value == 1 ? 1 : 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.cD7283B, width: 4.w),
                    ),
                  ),
                  child: Text(
                    "GET",
                    style: 33.w4(
                        color: AppColors.cD7283B,
                        fontFamily: FontFamily.fOswaldMedium,
                        height: 1.2),
                  ),
                ),
                13.hGap,
                Text(
                  "player".toUpperCase(),
                  style: 45.w4(
                      color: AppColors.c000000,
                      fontFamily: FontFamily.fOswaldMedium,
                      height: 1),
                )
              ],
            ),
            8.vGap,
            Text(
              "cardpack".toUpperCase(),
              style: 54.w4(
                  color: AppColors.c000000,
                  fontFamily: FontFamily.fOswaldBold,
                  height: 0.8),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxWidget() {
    var item = controller.currentCardPack;

    return AnimatedBuilder(
        animation: controller.fallOutAnimation,
        builder: (context, child) {
          return Positioned(
            top: 362.h * controller.fallOutAnimation.value + 100.h,
            left: 0,
            right: 0,
            child: Visibility(
              visible: controller.step == 0,
              child: Column(
                children: [
                  Opacity(
                    opacity: 0.5 + controller.fallOutAnimation.value * 0.5,
                    child: AnimatedBoxSimple(
                      child: Image.asset(
                        Utils.getBoxImageUrl(item.cardId),
                        width: 150.h * 1.2,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  // 25.vGap,
                  if (controller.fallOutAnimation.value == 1)
                    AnimatedArrow(
                      end: -5.w,
                      child: IconWidget(
                        iconWidth: 12.h,
                        icon: Assets.commonUiCommonIconSystemArrow,
                        rotateAngle: -90,
                        iconColor: AppColors.cD7283B,
                      ),
                    ),
                  16.vGap,
                  if (controller.fallOutAnimation.value == 1)
                    Text(
                      "Click to open".toUpperCase(),
                      style: 21.w4(
                          color: AppColors.c000000,
                          fontFamily: FontFamily.fOswaldMedium,
                          height: 0.8),
                    ),
                ],
              ),
            ),
          );
        });
  }

  Widget _rightBottomBackgroud() {
    return Visibility(
      visible: controller.step != 2,
      child: Positioned(
          right: -160.h,
          bottom: -180.h,
          child: Container(
            width: 280.h,
            height: 280.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(140.h),
              border: Border.all(color: AppColors.cE6E6E6, width: 10.h),
            ),
          )),
    );
  }

  Widget _cardWidget(BuildContext context) {
    var item = controller.currentCardPack;
    return Positioned(
      top: 0.h,
      left: 0,
      right: 0,
      bottom: 0,
      child: AnimatedOpacity(
        duration: 300.milliseconds,
        opacity: (controller.step == 1 || controller.step >= 3) ? 1 : 0,
        onEnd: () {
          if (controller.step == 1) {
            controller.shuffleCards(context);
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            for (int i = 0; i < item.playerCards.length; i++)
              Obx(() {
                final e = item.playerCards[i];
                Widget card = BoxCardWidget(
                  duration: 400.milliseconds,
                  isFlipped: e.isOpen.value,
                  player: e,
                  onFlip: () async {
                    // controller.selectCard(e);
                  },
                );

                var dy =
                    e.isSelect.value && controller.step == 1 && !e.isOpen.value
                        ? 15.w
                        : 0;
                var curCard = item.playerCards[i];
                return AnimatedPositioned(
                  curve: Curves.decelerate,
                  duration: 150.milliseconds,
                  onEnd: () => curCard.rotation.value = 0,
                  left: curCard.offset.value.dx +
                      curCard.rotation.value * 2000.w, // 水平位置
                  top: 180.h + curCard.offset.value.dy - dy, // 垂直位置
                  child: SizedBox(
                    width: 196.w,
                    height: 221.w,
                    // color: Colors.white,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (e.isSelect.value && !e.isOpen.value)
                          RipperAnimation(),
                        if (e.isSelect.value && !e.isOpen.value)
                          Positioned(
                            top: 0,
                            left: 11.5.w,
                            child: Image.asset(
                              height: 221.5.w,
                              width: 165.5.w,
                              fit: BoxFit.fill,
                              Assets.managerUiManagerGiftEffect01,
                            ),
                          ),
                        card,
                      ],
                    ),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }

  Widget _bigCard() {
    var item = controller.currentCardPack;
    PlayerCardEntity? player = item.playerCards.firstWhereOrNull(
        (e) => item.playerCards.indexOf(e) == controller.selectIndex);
    return Positioned(
        top: 250.h,
        child: AnimatedOpacity(
          duration: 150.milliseconds,
          opacity: controller.step == 2 ? 1 : 0,
          child: AnimatedScale(
            duration: 150.milliseconds,
            alignment: Alignment.bottomCenter,
            scale: controller.step == 2 ? 0.9 : 0,
            child: BoxCardWidget(
              isSmall: false,
              isFlipped: player!.isOpen.value,
              onFlip: () {},
              player: player,
            ),
          ),
        ));
  }

  Widget _continueText(BuildContext context) {
    return Positioned(
      bottom: 160.h,
      child: AnimatedOpacity(
        duration: (controller.step == 2 || controller.step == 4)
            ? 1000.milliseconds
            : 200.milliseconds,
        opacity: (controller.step == 2 || controller.step == 4) ? 1 : 0,
        child: Text(
          "Tap to proceed".toUpperCase(),
          style: 19.w4(
            color: AppColors.c666666,
            fontFamily: FontFamily.fOswaldMedium,
          ),
        ),
      ),
    );
  }

  Widget _collectBt() {
    return Positioned(
      bottom: 35.5.w,
      // left: 16.w,
      // right: 16.w,
      child: Obx(() {
        return AnimatedOpacity(
          opacity: controller.showCollect.value && controller.step == 2 ? 1 : 0,
          duration: 300.milliseconds,
          child: CustomButton(
              width: controller.showCollect.value && controller.step == 2
                  ? 343.w
                  : 0,
              height: 51.w,
              text: "COLLECT",
              fontSize: 23.sp,
              onPressed: () {
                Get.back();
              }),
        );
      }),
    );
  }

  Widget _goBackButton() {
    var show = controller.step == 3;
    return Positioned(
        // bottom: 188.h,
        top: 579.h + 50.h,
        child: Visibility(
          visible: show,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Column(
              //   children: [
              //     Row(children: [
              //       Text("COST:",
              //           style: 16.w4(
              //               fontFamily: FontFamily.fOswaldMedium,
              //               color: AppColors.cFFFFFF)),
              //       3.hGap,
              //       IconWidget(
              //         iconWidth: 20.w,
              //         icon: Assets.commonUiCommonIconCurrency02,
              //       ),
              //       4.hGap,
              //       Text(
              //           "${CacheApi.cardPackDefineMap[controller.currentCardPack.cardId]?.cardPackOpenMore ?? 0}",
              //           style: 16.w4(
              //               fontFamily: FontFamily.fOswaldMedium,
              //               color: AppColors.cFFFFFF)),
              //     ]),
              //     8.vGap,
              //     MtInkWell(
              //       onTap: () {
              //         controller.oneMore(CacheApi
              //                 .cardPackDefineMap[
              //                     controller.currentCardPack.cardId]
              //                 ?.cardPackOpenMore ??
              //             0);
              //       },
              //       child: Container(
              //         width: 146.w,
              //         height: 41.w,
              //         alignment: Alignment.center,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(9.w),
              //           border:
              //               Border.all(color: AppColors.c666666, width: 1.w),
              //         ),
              //         child: Center(
              //           child: Text(
              //             "ONE MORE".toUpperCase(),
              //             style: 19.w4(
              //                 color: AppColors.cFFFFFF,
              //                 fontFamily: FontFamily.fOswaldMedium),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // 9.hGap,
              MtInkWell(
                onTap: () => controller.gotIt(),
                child: Container(
                  width: 146.w,
                  height: 41.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.w),
                    border: Border.all(color: AppColors.c666666, width: 1.w),
                  ),
                  child: Center(
                    child: Text(
                      "GOT IT".toUpperCase(),
                      style: 19.w4(
                          color: AppColors.cFFFFFF,
                          fontFamily: FontFamily.fOswaldMedium),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // controller.step = 0;
    return GetBuilder<OpenBoxSimpleController>(
        init: OpenBoxSimpleController(),
        id: "open_box_simple",
        builder: (_) {
          // item.playerCards.shuffle();
          return Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                if (!Utils.canOperate()) return;
                if (controller.fallOutAnimation.value == 1 &&
                    controller.step == 0 &&
                    !controller.isOpen) {
                  SoundServices.to.playSound(Assets.soundTearPack);
                  controller.isOpen = true;
                  controller.boxAniCtrl.reset();
                  controller.boxAniCtrl.forward().then((v) {
                    controller.clickkBox();
                  });
                }
              },
              child: Container(
                width: 375.w,
                height: 812.h,
                color: AppColors.cF2F2F2,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    _backgroud(),
                    _rightBottomBackgroud(),

                    ///返回
                    _goBackButton(),

                    ///获得展示
                    // _continueText(context),
                    _bigCard(),
                    _collectBt(),

                    ///抽卡
                    _cardWidget(context),

                    /// 开宝箱
                    _openTitle(),
                    _boxWidget(),
                  ],
                ),
              ),
            );
          });
        });
  }
}
