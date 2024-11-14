/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 16:18:58
 * @LastEditTime: 2024-11-13 19:57:13
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 16:18:58
 * @LastEditTime: 2024-10-12 20:29:16
 */

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/border_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/team_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamMenberView extends StatelessWidget {
  const TeamMenberView({super.key});

  Widget _head() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 97.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.w),
              topRight: Radius.circular(16.w),
            ),
            image: const DecorationImage(
              // scale: 0.5,
              opacity: 0.05,
              repeat: ImageRepeat.repeat,
              image: AssetImage(
                Assets.teamUiBgDiagonal,
              ),
            ),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.c1A1A1A,
                  Color.fromARGB(255, 51, 51, 51),
                ])),
        child: Text(
          "MY TEAM",
          style: 50.w7(color: AppColors.c838383.withOpacity(0.25)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TeamController());
    final TeamIndexController indexCtrl = Get.find();
    return GetBuilder<TeamController>(
      builder: (_) {
        return BorderWidget(
          offset: Offset(0, 3.w),
          width: 375.w,
          height: 619.h,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.w),
            topRight: Radius.circular(16.w),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // _head(),
              // ArrowAnimated(
              //   child: InkWell(
              //     onTap: () {
              //       Get.find<TeamIndexController>().pageOnTap();
              //     },
              //     child: Padding(
              //       padding: EdgeInsets.all(10.w),
              //       child: Obx(() {
              //         // bool isOpen = indexCtrl.isShow.value;
              //         // controller.turns = isOpen ? 1 / 2 : -1 / 2;
              //         return AnimatedRotation(
              //           duration: const Duration(milliseconds: 300),
              //           turns: indexCtrl.turns.value,
              //           child: Stack(
              //             children: [
              //               IconWidget(
              //                 iconWidth: 21.w,
              //                 icon: Assets.iconUiIconArrows04,
              //                 iconColor: AppColors.cB3B3B3.withOpacity(0.7),
              //               ),
              //               Container(
              //                 margin: EdgeInsets.only(top: 9.w),
              //                 child: IconWidget(
              //                   iconWidth: 21.w,
              //                   icon: Assets.iconUiIconArrows04,
              //                   iconColor: AppColors.cB3B3B3,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         );
              //       }),
              //     ),
              //   ),
              // ),

              ///Tabar容器
              Positioned(
                top: 66.w,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                    // height: 500.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.w),
                        topRight: Radius.circular(16.w),
                      ),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            // AppColors.c1A1A1A,
                            AppColors.c262626,
                            AppColors.c4D4D4D
                          ]),
                    ),
                    child: Column(
                      children: [
                        TeamTabbar(),
                        Expanded(
                          child: TabBarView(
                            // physics: const NeverScrollableScrollPhysics(),
                            controller: controller.tabController,
                            children: controller.pages.map((e) => e).toList(),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ArrowAnimated extends StatefulWidget {
  final Widget child;
  final double animationRange;
  final Duration animationDuration;

  const ArrowAnimated({
    super.key,
    required this.child,
    this.animationRange = 18.0,
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  State<ArrowAnimated> createState() => _ArrowAnimatedState();
}

class _ArrowAnimatedState extends State<ArrowAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: widget.animationRange)
        .animate(_controller)
      ..addListener(() {
        if (_animation.value >= widget.animationRange) {
          _controller.reverse();
        } else if (_animation.value <= 0.0) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
          top: _animation.value,
          child: widget.child,
        );
      },
    );
  }
}
