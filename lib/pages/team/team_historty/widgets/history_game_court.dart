import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/heartbeat.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/money_income_animation.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HistoryGameCourtWidget extends GetView<TeamHistortyController> {
  const HistoryGameCourtWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// 背景球场
        _buildBasketballCourt(context),

        SizedBox(
          height: 219.w,
          width: double.infinity,
          child: controller.isLeftWin()
              ? _buildLeftWinWidget(context)
              : _buildRightWinWidget(context),
        ),
      ],
    );
  }

  Widget _buildBasketballCourt(BuildContext context) {
    return SizedBox(
      height: 156.w,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          //球场整行的宽高
          Positioned(
            top: 0.w,
            left: 9.w,
            right: 9.w,
            child: Stack(
              children: [
                //球场容器
                Container(
                  margin: EdgeInsets.only(top: 38.w),
                  width: 357.w,
                  height: 89.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ///球场
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              Assets.managerUiManagerCourt,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Expanded(
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..scale(-1.0, 1.0),
                              child: Image.asset(
                                Assets.managerUiManagerCourt,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 38.w),
                  width: 357.w,
                  height: 89.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      /// 左边篮球架
                      Positioned(
                          left: 3.w,
                          top: 5.w,
                          width: 26.w,
                          height: 38.w,
                          child: Center(
                              child: IconWidget(
                                  iconWidth: 26.w,
                                  icon: Assets.managerUiManagerCourt01))),

                      /// 右边篮球架
                      Positioned(
                          right: 3.w,
                          top: 5.w,
                          width: 26.w,
                          height: 38.w,
                          child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..scale(-1.0, 1.0),
                              child: Center(
                                  child: IconWidget(
                                      iconWidth: 26.w,
                                      icon: Assets.managerUiManagerCourt01)))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack _buildLeftWinWidget(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ///winner旗帜
        winnerBg(true, context),

        ///WINNER：文字
        winnerText(true),

        /// winner奖杯
        winnerCups(true),

        /// chest
        giftBox(true),

        /// 奖励箱子
        gift(true),

        ///loser旗帜
        loserBg(true),

        /// LOSER
        loserText(true),

        /// loser 奖杯
        loserCups(true),

        /// 钞票数量
        moneyCount(true),

        /// 钞票
        moneyAnimation(context, true),
      ],
    );
  }

  Obx winnerBg(bool isLeft, BuildContext context) {
    return Obx(() {
      return AnimatedPositioned(
          top: controller.startObs.value ? -10.w : -208.w,
          left: isLeft ? 19.w : null,
          right: !isLeft ? 19.w : null,
          duration: const Duration(milliseconds: 300),
          onEnd: () {
            print('AnimatedPositioned---onEnd----');
            Future.delayed(const Duration(milliseconds: 500), () {
              if (context.mounted) {
                controller.initCup();
              }
            });
          },
          child: IconWidget(
            iconHeight: 208.w,
            fit: BoxFit.fitHeight,
            icon: Assets.managerUiManagerEndingWin02,
            iconWidth: 131.w,
          ));
    });
  }

  Positioned winnerText(bool isLeft) {
    return Positioned(
      top: 22.w,
      right: !isLeft ? 19.w : null,
      left: isLeft ? 19.w : null,
      child: Container(
        width: 131.w,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              "WINNER",
              style: 30.w7(
                  color: AppColors.cC01223,
                  height: 1,
                  fontFamily: FontFamily.fOswaldBold),
            ),
          ],
        ),
      ),
    );
  }

  Positioned winnerCups(bool isLeft) {
    return Positioned(
        top: 63.w,
        left: isLeft ? 19.w : null,
        right: !isLeft ? 19.w : null,
        child: Obx(() {
          return HeartbeatWidget(
            child: Container(
              width: 131.w,
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 2.w),
                        child: IconWidget(
                            iconWidth: 23.w,
                            icon: Assets.managerUiManagerIconCurrency04),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 1.w,
                        child: IconWidget(
                          iconWidth: 8.w,
                          icon: Assets.managerUiManagerTacticsArrow,
                          iconColor: AppColors.c40F093,
                        ),
                      ),
                    ],
                  ),
                  3.hGap,
                  Text(
                    "+${(isLeft ? controller.leftCup.value : controller.rightCup.value).abs()}",
                    style: 16.w5(
                        color: AppColors.cF2F2F2,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  )
                ],
              ),
            ),
          );
        }));
  }

  Positioned giftBox(bool isLeft) {
    return Positioned(
        top: 96.w,
        right: !isLeft ? 28.w : null,
        left: isLeft ? 36.w : null,
        child: Obx(() {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: controller.opacityObs.value ? 1 : 0,
            onEnd: () {
              controller.moneyOpacityObs.value = true;
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 96.w,
                  height: 31.w,
                  margin: EdgeInsets.only(right: 8.w),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 17.w),
                  decoration: BoxDecoration(
                      color: AppColors.c000000,
                      border: Border.all(color: AppColors.c333333, width: 1.w),
                      borderRadius: BorderRadius.circular(6.w)),
                  child: Text(
                    controller.isFull() ? "FULL" : "CHEST",
                    style: 14.w5(
                        color: controller.isFull()
                            ? AppColors.c666666
                            : AppColors.cFFFFFF,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                ),
                if (controller.isFull())
                  Positioned(
                    right: 0,
                    child: IconWidget(
                        iconWidth: 16.w,
                        icon: Assets.commonUiCommonIconSystemDanger01),
                  )
              ],
            ),
          );
        }));
  }

  Obx gift(bool isLeft) {
    return Obx(() {
      return AnimatedPositioned(
          top: controller.giftObs.value ? 103.w : null,
          left: isLeft
              ? controller.giftObs.value
                  ? 44.w
                  : 155.w
              : null,
          right: !isLeft
              ? controller.giftObs.value
                  ? 102.w
                  : 155.w
              : null,
          duration: const Duration(milliseconds: 500),
          onEnd: () {
            print('giftObs===onEnd---');
            controller.opacityObs.value = !controller.opacityObs.value;
          },
          child: InkWell(
            onTap: () {},
            child: AnimatedScale(
              scale: controller.giftObs.value
                  ? 1
                  : controller.giftScaleObs.value
                      ? 1.5
                      : 1,
              duration: const Duration(milliseconds: 500),
              onEnd: () {
                controller.giftObs.value = true;
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: controller.giftObs.value ? 24.w : 63.w,
                child: Center(
                  child: Opacity(
                    opacity: controller.isFull() ? 0.5 : 1,
                    child: IconWidget(
                      iconWidth: 63.w,
                      icon: Utils.getBoxImageUrl(controller.getCardBoxId()),
                    ),
                  ),
                ),
              ),
            ),
          ));
    });
  }

  Obx loserBg(bool isLeft) {
    return Obx(() {
      return AnimatedPositioned(
          top: controller.startObs.value ? -10.w : -208.w,
          right: isLeft ? 19.w : null,
          left: !isLeft ? 19.w : null,
          duration: const Duration(milliseconds: 300),
          child: IconWidget(
            iconHeight: 193.w,
            fit: BoxFit.fitHeight,
            icon: Assets.managerUiManagerEndingLose01,
            iconWidth: 131.w,
          ));
    });
  }

  Positioned loserText(bool isLeft) {
    return Positioned(
        top: 22.w,
        right: isLeft ? 19.w : null,
        left: !isLeft ? 19.w : null,
        child: Container(
          width: 131.w,
          alignment: Alignment.topCenter,
          child: Text(
            "LOSER",
            style: 26.w7(
                color: AppColors.c666666,
                height: 1,
                fontFamily: FontFamily.fOswaldBold),
          ),
        ));
  }

  Positioned loserCups(bool isLeftWin) {
    return Positioned(
        top: 63.w,
        right: isLeftWin ? 19.w : null,
        left: !isLeftWin ? 19.w : null,
        child: Obx(() {
          controller.rightCup.value;
          controller.leftCup.value;
          var value2 =
              isLeftWin ? controller.rightCup.value : controller.leftCup.value;
          return HeartbeatWidget(
            onEnd: () {},
            child: Container(
              width: 131.w,
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 2.w),
                        child: IconWidget(
                            iconWidth: 23.w,
                            icon: Assets.managerUiManagerIconCurrency04),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 1.w,
                        child: IconWidget(
                          iconWidth: 8.w,
                          icon: Assets.managerUiManagerTacticsArrow,
                          iconColor: AppColors.cC01223,
                          rotateAngle: 180,
                        ),
                      ),
                    ],
                  ),
                  3.hGap,
                  Text(
                    "-${value2.abs()}",
                    style: 16.w5(
                        color: AppColors.cF2F2F2,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  )
                ],
              ),
            ),
          );
        }));
  }

  Positioned moneyCount(bool isLeft) {
    return Positioned(
        top: 133.w,
        left: isLeft ? 36.w : null,
        right: !isLeft ? 36.w : null,
        child: Obx(() {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: controller.moneyOpacityObs.value ? 1 : 0,
            onEnd: () {
              controller.moneyIncomeObs.value = true;
            },
            child: Container(
              width: 96.w,
              height: 31.w,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 17.w),
              decoration: BoxDecoration(
                  color: AppColors.c000000,
                  border: Border.all(color: AppColors.c333333, width: 1.w),
                  borderRadius: BorderRadius.circular(6.w)),
              child: Row(
                children: [
                  7.hGap,
                  IconWidget(
                      iconWidth: 28.w,
                      fit: BoxFit.fitWidth,
                      iconHeight: 22.w,
                      icon: Assets.commonUiCommonProp05),
                  Expanded(
                    child: Center(
                      child: AnimatedNum(
                        number: controller.moneyAnimationEnd.value
                            ? controller.getMoneyCount()
                            : 0,
                        isMoney: true,
                        milliseconds: 300,
                        textStyle: 14.w5(
                            color: AppColors.cFFFFFF,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  Positioned moneyAnimation(BuildContext context, bool isLeft) {
    return Positioned(child: Obx(() {
      if (!controller.moneyIncomeObs.value) {
        return const SizedBox.shrink();
      }
      return MoneyIncomeAnimation(
        randRect: Rect.fromLTWH((MediaQuery.of(context).size.width - 100) / 2,
            (219.w - 100) / 2, 100, 100),
        childSize: Size(28.w, 22.w),
        targetPosition: Offset(!isLeft ? 250.w : 43.w, 137.w),
        childWidget: IconWidget(
            iconWidth: 28.w,
            fit: BoxFit.fitWidth,
            iconHeight: 22.w,
            icon: Assets.commonUiCommonProp05),
        onEnd: _onHeaderAnimationEnd,
      );
    }));
  }

  void _onHeaderAnimationEnd() {
    controller.mvpObs.value = true;
    controller.moneyAnimationEnd.value = true;
  }

  Stack _buildRightWinWidget(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ///winner旗帜
        winnerBg(false, context),

        ///WINNER：文字
        winnerText(false),

        /// winner奖杯
        winnerCups(false),

        /// chest
        giftBox(false),

        /// 奖励箱子
        gift(false),

        ///loser旗帜
        loserBg(false),

        /// LOSER
        loserText(false),

        /// loser 奖杯
        loserCups(false),

        /// 钞票数量
        moneyCount(false),

        /// 钞票
        moneyAnimation(context, false),
      ],
    );
  }
}
