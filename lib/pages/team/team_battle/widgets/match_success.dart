import 'dart:math';

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/28/15:30

class MatchSuccess extends StatefulWidget {
  const MatchSuccess({required this.onCompleted, super.key});

  final Function() onCompleted;

  @override
  State<MatchSuccess> createState() => _MatchSuccessState();
}

class _MatchSuccessState extends State<MatchSuccess>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  var progress = 0.0.obs;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener(_matchStatusListener);
    animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 5),
      TweenSequenceItem(tween: Tween(begin: 4.0, end: 5.0), weight: 5),
    ]).animate(animationController)
      ..addListener(_animationListener);
    animationController.forward();
  }

  void _animationListener() {
    progress.value = animation.value;
  }

  void _matchStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(const Duration(seconds: 1), () {
        animationController.reverse();
      });
    }
    if (status == AnimationStatus.dismissed) {
      widget.onCompleted.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Obx(() {
      return Stack(
        children: _buildStartWidget(width, height),
      );
    });
  }

  List<Widget> _buildStartWidget(double width, double height) {
    TeamBattleController controller = Get.find();
    double designHeight = 261.w;
    return [

      /// left
      Positioned(
        left: -282.w * (progress.value < 2 ? (1 - progress.value) : 0),
        top: (height - designHeight) / 2,
        child: SizedBox(
          width: 282.w,
          height: 86.w,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 3.w),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    centerSlice: Rect.fromLTWH(0, 0, 2, 50),
                    image: AssetImage(Assets.teamUiBattlePanel01),
                    colorFilter: ColorFilter.mode(
                      AppColors.c3B93FF, // 修改为你想要的颜色
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 3.w, right: 3.w),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    centerSlice: Rect.fromLTWH(0, 0, 2, 50),
                    image: AssetImage(Assets.teamUiBattlePanel01),
                    colorFilter: ColorFilter.mode(
                      AppColors.cFFFFFF, // 修改为你想要的颜色
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "ME",
                                style:
                                10.w4(color: AppColors.c3B93FF, height: 1),
                              ),
                              Text(
                                controller.battleEntity.homeTeam.teamName,
                                style:
                                19.w7(color: AppColors.c262626, height: 1),
                              )
                            ],
                          ),
                        ),
                        7.vGap,
                        SizedBox(
                          width: 143.w,
                          height: 20.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconWidget(iconWidth: 18.w,
                                  icon: Assets.teamUiIconTrophy01),
                              6.hGap,
                              Text("${controller.battleEntity.homeTeam.cup}",
                                style: 16.w7(
                                    color: AppColors.c262626, height: 1),),
                            ],
                          ),
                        )
                      ],
                    ),
                    9.hGap,
                    Container(
                        width: 64.w,
                        height: 64.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.w),
                            border: Border.all(
                                color: AppColors.c3B93FF, width: 2.w)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(14.w),
                            child: ImageWidget(url: Utils.getAvaterUrl(
                                controller.battleEntity.homeTeam.teamLogo),
                              width: 64.w,
                              height: 64.w,))),
                    12.hGap,
                    IconWidget(
                      iconWidth: 7.w,
                      icon: Assets.picksUiTriangleG,
                      iconColor: AppColors.c3B93FF,
                      rotateAngle: 90,
                    ),
                    25.hGap
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// vs
      Positioned(
          left: 0,
          right: 0,
          top: (height - designHeight) / 2 + 86.w,
          bottom: (height - designHeight) / 2 + 86.w,
          child: Transform.scale(
            scale: 3 - (progress.value > 4 ? (progress.value - 4) : 0) * 2,
            child: Opacity(
              opacity: 1 * (progress.value > 4 ? (progress.value - 4) : 0),
              child: Center(
                child: Text(
                  "VS",
                  style: 64.w7(color: AppColors.cFFFFFF, height: 1),
                ),
              ),
            ),
          )),

      /// right
      Positioned(
          right: -282.w * (progress.value < 2 ? (1 - progress.value) : 0),
          // right: -282.w,
          bottom: (height - designHeight) / 2,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Transform.rotate(
                angle: pi,
                child: SizedBox(
                  width: 282.w,
                  height: 86.w,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 3.w),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            centerSlice: Rect.fromLTWH(0, 0, 2, 50),
                            image: AssetImage(Assets.teamUiBattlePanel01),
                            colorFilter: ColorFilter.mode(
                              AppColors.cFF7954, // 修改为你想要的颜色
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3.w, right: 3.w),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            centerSlice: Rect.fromLTWH(0, 0, 2, 50),
                            image: AssetImage(Assets.teamUiBattlePanel01),
                            colorFilter: ColorFilter.mode(
                              AppColors.cFFFFFF, // 修改为你想要的颜色
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  25.hGap,
                  IconWidget(
                    iconWidth: 7.w,
                    icon: Assets.picksUiTriangleG,
                    iconColor: AppColors.cFF7954,
                    rotateAngle: -90,
                  ),
                  12.hGap,
                  Container(
                      width: 64.w,
                      height: 64.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.w),
                          border:
                          Border.all(color: AppColors.cFF7954, width: 2.w)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(14.w),
                          child: ImageWidget(url: Utils.getAvaterUrl(
                              controller.battleEntity.awayTeam.teamLogo),
                              width: 64.w,
                              height: 64.w,))),
                  9.hGap,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "OPPONENT",
                              style: 10.w4(color: AppColors.cFF7954, height: 1),
                            ),
                            Text(
                              controller.battleEntity.awayTeam.teamName,
                              style: 19.w7(color: AppColors.c262626, height: 1),
                            )
                          ],
                        ),
                      ),
                      7.vGap,
                      SizedBox(
                        width: 143.w,
                        height: 20.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconWidget(iconWidth: 18.w,
                                icon: Assets.teamUiIconTrophy01),
                            6.hGap,
                            Text("${controller.battleEntity.awayTeam.cup}",
                              style: 16.w7(color: AppColors.c262626,
                                  height: 1),),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          )),
    ];
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
