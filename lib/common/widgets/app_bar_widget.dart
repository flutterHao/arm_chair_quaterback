/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-12 19:09:06
 * @LastEditTime: 2025-01-04 16:56:16
 */
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///@author lihonghao
///@date 2024/9/9
///@description 页面标题栏
class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.left,
    this.right,
    this.title,
    this.titleWidget,
    this.bottomChild,
    this.borderRadius,
  }) : assert(titleWidget != null || title != null,
            "select one of titleWidget,title");
  final Widget? left;
  final Widget? right;
  final String? title;
  final Widget? titleWidget;
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
            height: 47.w,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 16.w,
                  child: left ??
                      MtInkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Container(
                            width: 32.w,
                            height: 32.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.w),
                              border: Border.all(color: AppColors.cE1E1E1),
                            ),
                            child: IconWidget(
                              iconWidth: 19.w,
                              iconHeight: 19.w,
                              icon: Assets.iconIconBack,
                              iconColor: Colors.white,
                            ),
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
                  right: 16.w,
                  child: SizedBox(
                    // width: 19.w,
                    // height: 19.w,
                    child: right ?? MoneyAndCoinWidget(),
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
      constraints: BoxConstraints(minHeight: 47.w),
      decoration: BoxDecoration(
        color: AppColors.c000000,
        // borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(borderRadius ?? 16.w),
        //     bottomRight: Radius.circular(borderRadius ?? 16.w)),
      ),
      child: child,
    );
  }
}
