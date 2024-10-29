/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-28 17:18:15
 * @LastEditTime: 2024-10-29 14:38:54
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class JumpToPick extends GetView<HomeController> {
  const JumpToPick({super.key});

  @override
  Widget build(BuildContext context) {
    return PageJumpCard( Assets.uiIconPicks_01Png, "Today’s Streak Picks", (){
      controller.onTap(1);
    });
  }
}

class JumpToTrading extends GetView<HomeController> {
  const JumpToTrading({super.key});

  @override
  Widget build(BuildContext context) {
    return PageJumpCard( Assets.uiIconPicks_01Png, "Today’s Player Trading", (){
      controller.onTap(3);
    });
  }
}

class PageJumpCard extends StatelessWidget {
  const PageJumpCard(this.icon, this.title, this.onTap, {super.key});
  final String icon;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onTap();
        },
        //  splashColor: Colors.red, // 水波纹颜色
        // highlightColor: Colors.grey, //
        child: Container(
          height: 62.w,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.c262626,
            borderRadius: BorderRadius.circular(16.w),
            image: const DecorationImage(
                image: AssetImage(Assets.uiIconPickPng),
                fit: BoxFit.fitHeight,
                opacity: 0.15,
                colorFilter: ColorFilter.mode(
                  AppColors.cFF7954, // 修改为你想要的颜色
                  BlendMode.srcIn,
                ),
                alignment: Alignment.centerLeft),
          ),
          child: Row(
            children: [
              IconWidget(
                iconWidth: 32.w,
                icon:icon,
                iconColor: AppColors.cFF7954,
              ),
              14.hGap,
              Text(
                title,
                style: 16.w7(color: AppColors.cFF7954),
              ),
              Expanded(child: Container()),
              IconWidget(
                  iconWidth: 18.w,
                  iconColor: AppColors.cE6E6E,
                  icon: Assets.uiIconArrowsPng)
            ],
          ),
        ),
      ),
    );
  }
}

