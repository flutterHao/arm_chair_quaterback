import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///战术卡牌
class SmallTacticCard extends StatelessWidget {
  const SmallTacticCard(
      {super.key, required this.num, required this.color, required this.width});

  final int num; //数字
  final int color; //花色
  final double width;

  @override
  Widget build(BuildContext context) {
    double scale = width / 35.w;
    return Container(
      width: 35.w * scale,
      height: 52.w * scale,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(6.w * scale),
          boxShadow: [
            BoxShadow(
                color: AppColors.c000000.withOpacity(0.2),
                offset: Offset(0, 0.5 * scale),
                blurRadius: 1.5.w * scale)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            geCardtName(num),
            style: (19 * scale).w5(
                color: getCardColor(color),
                height: 0.9,
                fontFamily: FontFamily.fRobotoMedium),
          ),
          (4 * scale).vGap,
          Image.asset(getCardImage(color), width: 18.w * scale),
        ],
      ),
    );
  }
}

class SmallTacticCardNew extends StatelessWidget {
  const SmallTacticCardNew(
      {super.key, required this.width, required this.buff});

  final TrainingInfoBuff buff;
  final double width;

  @override
  Widget build(BuildContext context) {
    double scale = width / 50.w;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // 动画持续时间
      curve: Curves.easeInOut, // 动画曲线
      width: 50.w * scale,
      height: 68.w * scale,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(6.w),
          boxShadow: [
            BoxShadow(
                color: AppColors.c000000.withOpacity(0.2),
                offset: const Offset(-2, 2),
                blurRadius: 1.5.w)
          ]),
      child: Stack(
        children: [
          Positioned(
            top: 6.w * scale,
            left: 5.w * scale,
            child: Text(
              geCardtName(buff.face),
              style: (16 * scale).w5(
                  color: getCardColor(buff.color),
                  height: 0.9,
                  fontFamily: FontFamily.fRobotoMedium),
            ),
          ),
          Positioned(
              top: 22.w * scale,
              left: 5.w * scale,
              child:
                  Image.asset(getCardImage(buff.color), width: 8.5.w * scale)),
          Positioned(
              right: 6.5.w * scale,
              bottom: 4.5.w * scale,
              child:
                  Image.asset(getCardImage(buff.color), width: 26.w * scale)),
        ],
      ),
    );
  }
}

class CardBackWidget extends StatelessWidget {
  const CardBackWidget({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    double scale = width / 50.w;
    return Container(
      width: 50.w * scale,
      height: 68.w * scale,
      decoration: BoxDecoration(
        color: AppColors.c262626,
        borderRadius: BorderRadius.circular(6.w),
        border: Border.all(width: 2.w, color: Colors.black),
      ),
      child: Center(
        child: Image.asset(
          Assets.commonUiCommonIconSystemEmpty,
          width: 24.w * scale,
          color: AppColors.c666666,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class TacticCard extends StatelessWidget {
  const TacticCard(
      {super.key,
      required this.num,
      required this.color,
      required this.width,
      required this.buff,
      this.borderRadius});

  final int num; //数字
  final int color; //花色
  final double width;
  final TrainingInfoBuff buff;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    double scale = width / 71.w;
    return Container(
      width: 71.w * scale,
      height: 97.w * scale,
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: borderRadius ?? BorderRadius.circular(6.w),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 5.5.w * scale,
            left: 5.w * scale,
            child: Text(
              geCardtName(num),
              style: (16 * scale).w4(color: getCardColor(color), height: 0.9),
            ),
          ),
          Positioned(
            top: 23.w * scale,
            left: 5.w * scale,
            child: Image.asset(getCardImage(color), width: 9.w * scale),
          ),
          Positioned(
            top: 32.5.w * scale,
            child: Image.asset(getCardNewImage(color), width: 52.w * scale),
          ),
          Positioned(
            bottom: 6.5.w * scale,
            child: Text(
              getCardTacticNmae(color),
              style: (10 * scale).w4(color: getCardColor(color), height: 0.9),
            ),
          ),
          Positioned(
            top: 6.w * scale,
            right: 5.5.w * scale,
            child: Text(
              "+${(buff.buffValue * 100).toStringAsFixed(0)}%",
              style: (scale * 12).w4(
                  color: getCardColor(color),
                  height: 0.9,
                  fontFamily: FontFamily.fOswaldRegular),
            ),
          ),
        ],
      ),
    );
  }
}

String geCardtName(int num) {
  if (num == 9) {
    return "9";
  } else if (num == 10) {
    return "10";
  } else if (num == 11) {
    return "J";
  } else if (num == 12) {
    return "Q";
  } else if (num == 13) {
    return "K";
  } else {
    return "A";
  }
}

String getCardImage(int color) {
  if (color == Constant.spade) {
    return Assets.managerUiManagerTactics02;
  } else if (color == Constant.heart) {
    return Assets.managerUiManagerTactics01;
  } else if (color == Constant.club) {
    return Assets.managerUiManagerTactics03;
  } else {
    return Assets.managerUiManagerTactics04;
  }
}

String getCardNewImage(int color) {
  if (color == Constant.spade) {
    return Assets.managerUiManagerTactics06;
  } else if (color == Constant.heart) {
    return Assets.managerUiManagerTactics05;
  } else if (color == Constant.club) {
    return Assets.managerUiManagerTactics07;
  } else {
    return Assets.managerUiManagerTactics08;
  }
}

String getCardTacticNmae(int color) {
  if (color == Constant.spade) {
    return "3 Points";
  } else if (color == Constant.heart) {
    return "Lay up";
  } else if (color == Constant.club) {
    return "Mid-range";
  } else {
    return "Draw a foul";
  }
}

Color getCardColor(int color) {
  if (color == Constant.spade || color == Constant.club) {
    return AppColors.c262626;
  } else {
    return AppColors.cEB0000;
  }
}
