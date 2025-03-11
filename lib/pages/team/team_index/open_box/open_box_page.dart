/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-17 18:13:43
 * @LastEditTime: 2025-03-05 20:43:48
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/player_card_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/animated_arrow.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/animted_box.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/box_card_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/ripper_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OpenBoxPage extends GetView<TeamIndexController> {
  const OpenBoxPage({
    super.key,
  });

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
        color: AppColors.c2f2f2f,
        alignment: Alignment.topRight,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _openTitle() {
    var duration = 300.milliseconds;
    return AnimatedPositioned(
      duration: duration,
      top: 44.h,
      left: controller.step == 0 ? 29.w : 15.w,
      child: AnimatedOpacity(
        duration: duration,
        opacity: controller.step == 0 ? 1 : 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "OPEN",
              style: 44.w4(
                  color: AppColors.cFFFFFF,
                  fontFamily: FontFamily.fOswaldMedium,
                  height: 0.8),
            ),
            10.vGap,
            Text(
              "the package".toUpperCase(),
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

  Widget _changeTitle() {
    var duration = 300.milliseconds;
    return Obx(() {
      var visible = controller.showChangeText.value && controller.step == 1;
      return AnimatedPositioned(
        duration: duration,
        top: 44.h,
        left: visible ? 29.w : 35.w,
        child: AnimatedOpacity(
          duration: duration,
          opacity: visible ? 1 : 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CHOOSE",
                style: 44.w4(
                    color: AppColors.cFFFFFF,
                    fontFamily: FontFamily.fOswaldMedium,
                    height: 0.8),
              ),
              10.vGap,
              Text(
                "the one you want".toUpperCase(),
                style: 25.w4(
                    color: AppColors.cFFFFFF,
                    fontFamily: FontFamily.fOswaldMedium,
                    height: 0.8),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _boxWidget() {
    var item = controller.currentCardPack;
    return AnimatedBuilder(
        animation: controller.fallOutAnimation,
        builder: (context, child) {
          return Positioned(
            top: 214.h * controller.fallOutAnimation.value + 100.h,
            left: 0,
            right: 0,
            child: Visibility(
              visible: controller.step == 0,
              child: Column(
                children: [
                  Opacity(
                    opacity: 0.5 + controller.fallOutAnimation.value * 0.5,
                    child: AnimatedBox(
                      onTap: () {
                        controller.clickkBox();
                      },
                      child: Image.asset(
                        Utils.getBoxImageUrl(item.cardId),
                        width: 199.h * 1.2,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  25.vGap,
                  if (controller.fallOutAnimation.value == 1)
                    AnimatedArrow(
                      end: -5.w,
                      child: IconWidget(
                        iconWidth: 12.h,
                        icon: Assets.commonUiCommonIconSystemArrow,
                        rotateAngle: -90,
                        iconColor: AppColors.cFF7954,
                      ),
                    ),
                  16.vGap,
                  if (controller.fallOutAnimation.value == 1)
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
        });
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
                    controller.selectCard(e);
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
                        AnimatedRotation(
                          duration: 150.milliseconds,
                          turns: curCard.rotation.value,
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 100),
                            scale: e.isSelect.value ? 1.0 : 0.9,
                            alignment: Alignment.bottomCenter,
                            child: (!e.isSelect.value) && controller.step < 3
                                ? AnimatedBuilder(
                                    animation: controller.breathController,
                                    builder: (context, child) {
                                      return Transform.scale(
                                        scale: controller.breathAnimation.value,
                                        child: card,
                                      );
                                    },
                                  )
                                : AnimatedBuilder(
                                    animation: controller.shakeAnimation,
                                    builder: (context, child) {
                                      double angle =
                                          controller.shakeAnimation.value *
                                              pi *
                                              controller.shake *
                                              5;
                                      if (e.isOpen.value) return card;
                                      return RotationTransition(
                                        alignment: Alignment.center,
                                        turns: controller.shakeAnimation,
                                        // child: card,
                                        child: Transform(
                                          transform: Matrix4.identity()
                                            ..setEntry(3, 2, 0.001)
                                            ..rotateX(angle)
                                            ..rotateY(angle),
                                          child: card,
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            // for (int i = 0; i < item.playerCards.length; i++)
            //   Positioned(
            //     left: item.playerCards[i].offset.value.dx -
            //         controller.cardWidth / 4,
            //     top: 240.h + item.playerCards[i].offset.value.dy, // 垂直位置
            //     child: Visibility(
            //         visible: item.playerCards[i].isSelect.value,
            //         child: const RipperAnimation()),
            //   ),
          ],
        ),
      ),
    );
  }

  Widget _congratulation() {
    var item = controller.currentCardPack;
    var player = item.playerCards.firstWhereOrNull((e) => e.isSelect.value);
    return Obx(() {
      return AnimatedPositioned(
        duration: 200.milliseconds,
        left: -28.w,
        bottom: controller.showBackground1.value ? 284.h : 815.w,
        child: Transform.rotate(
          angle: -pi / 2,
          // origin: Offset(0, 0),
          alignment: Alignment.topLeft,
          child: player != null && controller.showBackground1.value
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
    });
  }

  Widget _rightBottomImage() {
    var item = controller.currentCardPack;
    PlayerCardEntity? player =
        item.playerCards.firstWhereOrNull((e) => e.isSelect.value);
    return Obx(() {
      return AnimatedPositioned(
        duration: 200.milliseconds,
        left: controller.showBackground2.value ? 336.w : 375.w,
        bottom: 162.w,
        child: player != null && controller.showBackground2.value
            ? Image.asset(
                Assets.managerUiManagerPlayercard01,
                height: 198.5.h,
                fit: BoxFit.fitHeight,
                color:
                    getCardColor(Utils.getPlayBaseInfo(player!.playerId).grade),
              )
            : const SizedBox.shrink(),
      );
    });
  }

  Widget _bigCard() {
    var item = controller.currentCardPack;
    PlayerCardEntity? player = item.playerCards.firstWhereOrNull(
        (e) => item.playerCards.indexOf(e) == controller.selectIndex);
    return Positioned(
        top: 250.h,
        child: player != null && controller.step == 2
            ? AnimatedBuilder(
                animation: controller.shakeAnimation,
                builder: (context, child) {
                  return RotationTransition(
                    alignment: Alignment.center,
                    turns: controller.shakeAnimation,
                    child: AnimatedSlide(
                      duration: 100.milliseconds,
                      offset: Offset(controller.shakeAnimation.value * 1,
                          controller.shakeAnimation.value * 1),
                      child: BoxCardWidget(
                        isSmall: false,
                        isFlipped: player.isOpen.value,
                        onFlip: () {},
                        player: player,
                      ),
                    ),
                  );
                })
            : const SizedBox.shrink());
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
        ));
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
              Column(
                children: [
                  Row(children: [
                    Text("COST:",
                        style: 16.w4(
                            fontFamily: FontFamily.fOswaldMedium,
                            color: AppColors.cFFFFFF)),
                    3.hGap,
                    IconWidget(
                      iconWidth: 20.w,
                      icon: Assets.commonUiCommonIconCurrency02,
                    ),
                    4.hGap,
                    Text(
                        "${CacheApi.cardPackDefineMap[controller.currentCardPack.cardId]?.cardPackOpenMore ?? 0}",
                        style: 16.w4(
                            fontFamily: FontFamily.fOswaldMedium,
                            color: AppColors.cFFFFFF)),
                  ]),
                  8.vGap,
                  MtInkWell(
                    onTap: () {
                      controller.oneMore(CacheApi
                              .cardPackDefineMap[
                                  controller.currentCardPack.cardId]
                              ?.cardPackOpenMore ??
                          0);
                    },
                    child: Container(
                      width: 146.w,
                      height: 41.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.w),
                        border:
                            Border.all(color: AppColors.c666666, width: 1.w),
                      ),
                      child: Center(
                        child: Text(
                          "ONE MORE".toUpperCase(),
                          style: 19.w4(
                              color: AppColors.cFFFFFF,
                              fontFamily: FontFamily.fOswaldMedium),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              9.hGap,
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

//颜色背景
  Widget _colorBackgroud() {
    var item = controller.currentCardPack;
    PlayerCardEntity? player = item.playerCards.firstWhereOrNull(
        (e) => item.playerCards.indexOf(e) == controller.selectIndex);
    // var item = controller.currentCardPack;
    // var player = item.playerCards.firstWhereOrNull((e) => e.isSelect.value);
    if (player == null && controller.step != 2) {
      return Container();
    }
    double angle = -pi / 4;
    return Obx(() {
      var show = controller.showBackground3.value;
      return AnimatedPositioned(
          curve: show ? Curves.easeIn : Curves.easeOut,
          duration: 200.milliseconds,
          left: show ? 0.w : 375.w,
          bottom: show ? 162.h : 500.h,
          child: SizedBox(
            width: 800.w,
            height: 800.w,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Transform.rotate(
                    alignment: Alignment.bottomLeft,
                    angle: angle,
                    child: CustomPaint(
                      painter: ParallelgramPainter(
                        base: 800.w,
                        height: 100.w,
                        rotateAngle: -angle,
                        color: getCardColor(
                            Utils.getPlayBaseInfo(player!.playerId).grade),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 100.w,
                  bottom: 80.w,
                  child: CustomPaint(
                    painter: ParallelgramPainter(
                      base: 20.h,
                      height: 600.h,
                      rotateAngle: -angle,
                      color: getCardColor(
                          Utils.getPlayBaseInfo(player!.playerId).grade),
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // controller.status = 1;
    // controller.showBackground1.value = false;
    // controller.showBackground2.value = false;
    // controller.showBackground3.value = false;
    return GetBuilder<TeamIndexController>(
        id: "open_box_page",
        builder: (_) {
          // item.playerCards.shuffle();
          return Builder(builder: (context) {
            return GestureDetector(
              onTap: controller.step == 2 || controller.step == 4
                  ? () => controller.toContinue(context)
                  : null,
              // onTap: () => controller.back(context),
              child: Container(
                width: 375.w,
                height: 812.h,
                decoration: const BoxDecoration(color: AppColors.c1A1A1A),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    _backgroud(),

                    ///返回
                    _goBackButton(),

                    ///获得展示
                    _colorBackgroud(),
                    _continueText(context),
                    _congratulation(),
                    _bigCard(),

                    ///抽卡
                    _cardWidget(context),
                    _rightBottomImage(),

                    /// 开宝箱
                    _openTitle(),
                    _changeTitle(),
                    _rightBottom(),
                    _boxWidget(),
                  ],
                ),
              ),
            );
          });
        });
  }
}

//篮球中心圈
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

// 平行四边形
class ParallelgramPainter extends CustomPainter {
  final double base; // 底长
  final double height; // 高度
  final Color color;
  final double rotateAngle;

  ParallelgramPainter(
      {required this.base,
      required this.height,
      required this.color,
      required this.rotateAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // 左下角
    path.lineTo(base, 0); // 右下角
    path.lineTo(base + height / tan(rotateAngle), -height); // 右上角
    path.lineTo(height / tan(rotateAngle), -height); // 左上角
    path.close(); // 关闭路径

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
