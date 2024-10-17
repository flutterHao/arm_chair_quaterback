/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-12 19:09:06
 * @LastEditTime: 2024-09-19 12:34:58
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///@author lihonghao
///@date 2024/9/9
///@description 页面标题栏
class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key,
      this.left,
      this.right = const MoneyAndCoinWidget(),
      this.title,
      this.titleWidget,
      this.id,
      this.bottomChild,
      this.borderRadius,})
      : assert(titleWidget != null || title != null,
            "select one of titleWidget,title");
  final Widget? left;
  final Widget? right;
  final String? title;
  final Widget? titleWidget;
  final int? id;
  final Widget? bottomChild;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      borderRadius: borderRadius,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 63.w,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  child: SizedBox(
                    width: 48.w,
                    height: 48.w,
                    child: left ??
                        InkWell(
                          onTap: () {
                            Get.back(id: id);
                          },
                          child: IconWidget(
                            iconWidth: 19.w,
                            iconHeight: 19.w,
                            icon: Assets.iconBackPng,
                            iconColor: Colors.white,
                          ),
                        ),
                  ),
                ),
                Center(
                  child: titleWidget ??
                      Text(
                        title!,
                        style: 19.w7(color: Colors.white),
                      ),
                ),
                Positioned(
                  right: 8.w,
                  child: SizedBox(
                    // width: 19.w,
                    // height: 19.w,
                    child: right,
                  ),
                )
              ],
            ),
          ),
          bottomChild ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class AppBarContainer extends StatelessWidget {
  static double APPBARCONTAINERHEIGHT = ScreenUtil().setWidth(63);
  const AppBarContainer({super.key, required this.child, this.borderRadius});

  final Widget child;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 361.w,
      constraints: BoxConstraints(minHeight: 63.w),
      decoration: BoxDecoration(
        color: AppColors.c262626,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius??16.w),
            bottomRight: Radius.circular(borderRadius??16.w)),
      ),
      child: child,
    );
  }
}
