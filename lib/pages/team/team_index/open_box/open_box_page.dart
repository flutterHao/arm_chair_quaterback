/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-17 18:13:43
 * @LastEditTime: 2024-12-18 21:42:58
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/card_pack_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_card_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/big_player_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/box_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OpenBoxPage extends GetView<TeamIndexController> {
  const OpenBoxPage({
    super.key,
    required this.item,
  });
  final CardPackInfoCard item;

  Widget _backgroud() {
    if (controller.step == 2) {
      return Positioned(
        top: 80.h,
        child: CustomPaint(
          size: Size(574.h, 574.h), // 设
          painter: CircleWithLinePainter(),
        ),
      );
    }
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Image.asset(
        Assets.managerUiManagerLineupBg,
        height: 370.h,
        alignment: Alignment.topRight,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _leftTopWidget() {
    return Positioned(
      top: 44.h,
      left: 29.w,
      child: Visibility(
        visible: controller.step == 0 || controller.step == 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.step == 0 ? "OPEN" : "CHOOSE",
              style: 44.w4(
                  color: AppColors.cFFFFFF,
                  fontFamily: FontFamily.fOswaldMedium,
                  height: 0.8),
            ),
            10.vGap,
            Text(
              (controller.step == 0 ? "the package" : "the one you want")
                  .toUpperCase(),
              style: 25.w4(
                  color: AppColors.cFFFFFF,
                  fontFamily: FontFamily.fOswaldMedium,
                  height: 0.8),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxWidget() {
    return Positioned(
      top: 314.h,
      left: 0,
      right: 0,
      child: Visibility(
        visible: controller.step == 0,
        child: Column(
          children: [
            MtInkwell(
              onTap: () {
                controller.nextStep();
              },
              splashColor: Colors.transparent,
              child: Image.asset(
                Assets.managerUiManagerGift03,
                width: 199.h,
                fit: BoxFit.fitWidth,
              ),
            ),
            25.vGap,
            IconWidget(
              iconWidth: 20.h,
              icon: Assets.iconUiIconShrink,
              iconColor: AppColors.cFF7954,
            ),
            16.vGap,
            Text(
              "Click to open".toUpperCase(),
              style: 21.w4(
                  color: AppColors.cFFFFFF,
                  fontFamily: FontFamily.fOswaldMedium,
                  height: 0.8),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rightBottom() {
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
              border: Border.all(color: AppColors.c2f2f2f, width: 10.h),
            ),
          )),
    );
  }

  Widget _cardWidget() {
    // double spacing = controller.cardPackInfo.card.length <= 3 ? 50.w : 30.w;
    double spacing = 10.w;
    return Positioned(
      top: 240.h,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: 300.milliseconds,
        opacity: (controller.step == 1 || controller.step == 3) ? 1 : 0,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50.w),
          alignment: Alignment.center,
          height: (122 * 2 + spacing).w,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: spacing,
            runSpacing: spacing,
            children: item.playerCards.map((e) {
              Widget card = Obx(() {
                return BoxCardWidget(
                  isFlipped: e.isOpen.value,
                  player: e,
                  onFlip: () {
                    if (!e.isSelect.value) {
                      for (var element in item.playerCards) {
                        if (e.playerId == element.playerId) {
                          e.isSelect.value = true;
                        } else {
                          element.isSelect.value = false;
                        }
                      }

                      controller.shakeController.forward();
                      controller.update(["open_box_page"]);
                    } else {
                      controller.openBattleBox(
                          item.playerCards.indexOf(e), e.playerId);
                      controller.shakeController.reset();
                      controller.shakeController.stop();

                      controller.nextStep();
                      Future.delayed(const Duration(milliseconds: 600), () {
                        e.isOpen.value = true;
                        controller.update(["open_box_page"]);
                      });
                    }
                  },
                );
              });
              if (!e.isSelect.value) {
                return card;
              }
              return AnimatedBuilder(
                  animation: controller.shakeAnimation,
                  builder: (context, child) {
                    return RotationTransition(
                      alignment: Alignment.center,
                      turns: controller.shakeAnimation,
                      child: AnimatedSlide(
                        duration: 100.milliseconds,
                        offset: Offset(controller.shakeAnimation.value * 1,
                            controller.shakeAnimation.value * 1),
                        child: card,
                      ),
                    );
                  });
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _congratulation() {
    var player = item.playerCards.firstWhereOrNull((e) => e.isSelect.value);
    return AnimatedPositioned(
      duration: 300.milliseconds,
      left: -28.w,
      bottom: controller.step == 2 ? 284.h : 815.w,
      child: Transform.rotate(
        angle: -pi / 2,
        // origin: Offset(0, 0),
        alignment: Alignment.topLeft,
        child: player != null && controller.step == 2
            ? Stack(
                children: [
                  // Border
                  Text(
                    "congratulation".toUpperCase(),
                    style: TextStyle(
                      letterSpacing: 0,
                      height: 0.8,
                      fontSize: 100.h,
                      fontFamily: FontFamily.fOswaldMedium,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1.5.w
                        ..color = getCardColor(
                            Utils.getPlayBaseInfo(player!.playerId).grade),
                    ),
                  ),
                  // Gradient Text
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "congratulation".toUpperCase(),
                      style: TextStyle(
                        letterSpacing: 0,
                        height: 0.8,
                        fontSize: 100.h,
                        fontFamily: FontFamily.fOswaldMedium,
                        color: AppColors.c1A1A1A,
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _rightBottomImage() {
    PlayerCardEntity? player =
        item.playerCards.firstWhereOrNull((e) => e.isSelect.value);
    return AnimatedPositioned(
      duration: 300.milliseconds,
      left: controller.step == 2 ? 336.w : 375.w,
      bottom: 162.w,
      child: player != null && controller.step == 2
          ? Image.asset(
              Assets.managerUiManagerPlayercard01,
              height: 198.5.h,
              fit: BoxFit.fitHeight,
              color:
                  getCardColor(Utils.getPlayBaseInfo(player!.playerId).grade),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _bigCard() {
    PlayerCardEntity? player =
        item.playerCards.firstWhereOrNull((e) => e.isSelect.value);
    return Positioned(
        top: 250.h,
        child: player != null && controller.step == 2
            ? BoxCardWidget(
                isSmall: false,
                isFlipped: player.isOpen.value,
                onFlip: () {},
                player: player,
              )
            : const SizedBox.shrink());
  }

  Widget _continueText() {
    return Positioned(
        bottom: 211.h,
        child: AnimatedOpacity(
          duration: 1000.milliseconds,
          opacity: controller.step == 2 ? 1 : 0,
          child: Text(
            "Tap screen to continue".toUpperCase(),
            style: 19.w4(
              color: AppColors.c666666,
              fontFamily: FontFamily.fOswaldMedium,
            ),
          ),
        ));
  }

  Widget _goBackButton() {
    return Positioned(
        // bottom: 188.h,
        top: 579.h + 50.h,
        child: AnimatedScale(
          duration: 300.milliseconds,
          scale: controller.step == 3 ? 1 : 0,
          child: MtInkwell(
            onTap: () => Get.back(),
            child: Container(
              width: 165.w,
              height: 45.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.w),
                border: Border.all(color: AppColors.c666666, width: 1.w),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Center(
                    child: Text(
                      "GO BACK".toUpperCase(),
                      style: 19.w4(
                          color: AppColors.cFFFFFF,
                          fontFamily: FontFamily.fOswaldMedium),
                    ),
                  ),
                  Positioned(
                    right: 8.w,
                    child: IconWidget(
                      iconWidth: 15.w,
                      icon: Assets.iconUiIconArrows04,
                      rotateAngle: -90,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // controller.status = 1;
    return HorizontalDragBackWidget(
      child: GetBuilder<TeamIndexController>(
          id: "open_box_page",
          builder: (context) {
            return GestureDetector(
              onTap: () async {
                if (controller.step == 2) {
                  controller.nextStep();
                  await Future.delayed(const Duration(milliseconds: 300));
                  for (var e in item.playerCards) {
                    await Future.delayed(const Duration(milliseconds: 100));
                    e.isOpen.value = true;
                  }
                }
              },
              child: Container(
                width: 375.w,
                height: 812.h,
                decoration: const BoxDecoration(color: AppColors.c1A1A1A),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    _backgroud(),

                    //第三步
                    _continueText(),
                    _goBackButton(),
                    //第二步
                    _bigCard(),
                    _cardWidget(),
                    _congratulation(),
                    _rightBottomImage(),
                    //第一步
                    _boxWidget(),
                    _leftTopWidget(),
                    _rightBottom(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class CircleWithLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.c2f2f2f
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.h;

    // 绘制圆圈
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - paint.strokeWidth / 2;
    canvas.drawCircle(center, radius, paint);

    // 绘制水平直线
    final lineStart = Offset(0, size.height / 2);
    final lineEnd = Offset(size.width, size.height / 2);
    canvas.drawLine(lineStart, lineEnd, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
