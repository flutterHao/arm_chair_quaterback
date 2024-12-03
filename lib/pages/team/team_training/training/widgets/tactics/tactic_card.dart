import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///战术卡牌
class SmallTacticCard extends StatelessWidget {
  const SmallTacticCard({super.key, required this.num, required this.color});
  final int num; //数字
  final int color; //花色

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      height: 52.w,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(6.w),
          boxShadow: [
            BoxShadow(
                color: AppColors.c000000.withOpacity(0.2),
                offset: const Offset(0, 0.5),
                blurRadius: 1.5.w)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            geCardtName(num),
            style: 16.w4(color: getCardColor(color), height: 0.9),
          ),
          3.5.vGap,
          Image.asset(getCardImage(color), width: 18.w, height: 18.w),
        ],
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
      required this.buff});
  final int num; //数字
  final int color; //花色
  final double width;
  final TrainingInfoBuff buff;

  @override
  Widget build(BuildContext context) {
    double scale = width / 71.w;
    return Container(
      width: 71.w * scale,
      height: 97.w * scale,
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(6.w),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 5.5.w * scale,
            left: 5.w * scale,
            child: Text(
              geCardtName(num),
              style: 16.w4(color: getCardColor(color), height: 0.9),
            ),
          ),
          Positioned(
            top: 23.w,
            left: 4.5.w,
            child: Image.asset(getCardImage(color), width: 9.w * scale),
          ),
          Positioned(
            top: 34.5.w,
            child: Image.asset(getCardImage(color), width: 27.w * scale),
          ),
          Positioned(
            top: 70.w,
            child: Text(
              "Perimeter",
              style: 10.w4(color: getCardColor(color), height: 0.9),
            ),
          ),
          Positioned(
            top: 83.w,
            child: Text(
              "${(buff.buffValue * 100).toStringAsFixed(0)}%",
              style: 12.w4(color: getCardColor(color), height: 0.9),
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

Color getCardColor(int color) {
  if (color == Constant.spade || color == Constant.club) {
    return AppColors.c262626;
  } else {
    return AppColors.cEB0000;
  }
}
