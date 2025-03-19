import 'dart:math';

import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/12/19:14

class TopDialog extends StatefulWidget {
  const TopDialog({super.key, required this.title, this.routeId});

  final String title;
  final int? routeId;

  @override
  State<TopDialog> createState() => _TopDialogState();
}

class _TopDialogState extends State<TopDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  var offsetDy = 0.0.obs;
  double startY = 0;
  var maxHeight = -500.0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addStatusListener(_statusListener);
    animation = Tween(begin: maxHeight, end: 0.0).animate(animationController)
      ..addListener(_animationListener);
    animationController.forward();
  }

  void _animationListener() {
    offsetDy.value = animation.value;
  }

  void _statusListener(status) {
    if (status == AnimationStatus.completed && offsetDy.value == maxHeight) {
      Get.back(id: widget.routeId);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        // print('didPop:$didPop');
        if (!didPop) {
          offsetDy.value = 0;
          _releaseAnimation(isBack: true);
        }
      },
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onHorizontalDragUpdate: (d) {
                    offsetDy.value = d.localPosition.dy - startY;
                    // print('onHorizontalDragUpdate----->offsetDy.value:${offsetDy.value}');
                  },
                  onHorizontalDragStart: (d) {
                    // print('onHorizontalDragStart');
                    startY = d.localPosition.dy;
                  },
                  onHorizontalDragEnd: (d) {
                    print('onHorizontalDragEnd');
                    _releaseAnimation();
                  },
                  onHorizontalDragCancel: () {
                    print('onHorizontalDragCancel');
                    _releaseAnimation();
                  },
                  onHorizontalDragDown: (d) {
                    // print('onHorizontalDragDown');
                    startY = d.localPosition.dy;
                  },
                  child: Obx(() {
                    return Transform.translate(
                      offset:
                          Offset(0, offsetDy.value >= 0 ? 0 : offsetDy.value),
                      child: Container(
                        // height: 500.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.c262626,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(16.w))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Opacity(
                              opacity: 0,
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).padding.top +
                                          0.w),
                                  child: UserInfoBar(
                                    enable: false,
                                  )),
                            ),
                            20.vGap,
                            Container(
                              margin: EdgeInsets.only(
                                  // top: MediaQuery.of(context).padding.top + 6.w,
                                  left: 16.w,
                                  right: 16.w),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(RouteNames.userInfo);
                                        // _popAndPushNamed(context,
                                        //     RouteNames.picksPersonalCenter,
                                        //     useRootNavigator: true,
                                        //     arguments: {
                                        //       "teamId":
                                        //           Get.find<HomeController>()
                                        //                   .userEntiry
                                        //                   .teamLoginInfo
                                        //                   ?.team
                                        //                   ?.teamId ??
                                        //               0
                                        //     });
                                      },
                                      child: Container(
                                        height: 88.w,
                                        padding: EdgeInsets.only(
                                            left: 26.w,
                                            top: 21.w,
                                            right: 19.w,
                                            bottom: 17.w),
                                        decoration: BoxDecoration(
                                            color: AppColors.c333333,
                                            borderRadius:
                                                BorderRadius.circular(16.w)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ColorFiltered(
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                AppColors.cFF7954,
                                                BlendMode.srcIn,
                                              ),
                                              child: Image.asset(
                                                Assets.playerUiIconCenter,
                                                width: 21.w,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "My information",
                                                  style: 14.w4(
                                                      color: AppColors.cBFBEBE),
                                                ),
                                                Transform.rotate(
                                                    angle: pi,
                                                    child: IconWidget(
                                                      iconWidth: 13.w,
                                                      icon: Assets.iconIconBack,
                                                      iconColor:
                                                          AppColors.c666666,
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  9.hGap,
                                  Flexible(
                                    flex: 2,
                                    child: InkWell(
                                      onTap: () {
                                        print('Friend');
                                      },
                                      child: Container(
                                        height: 88.w,
                                        padding: EdgeInsets.only(
                                            left: 26.w,
                                            top: 21.w,
                                            right: 19.w,
                                            bottom: 17.w),
                                        decoration: BoxDecoration(
                                            color: AppColors.c333333,
                                            borderRadius:
                                                BorderRadius.circular(16.w)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ColorFiltered(
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                AppColors.cFF7954,
                                                BlendMode.srcIn,
                                              ),
                                              child: Image.asset(
                                                Assets.playerUiIconFriend,
                                                width: 21.w,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Friend",
                                                  style: 14.w4(
                                                      color: AppColors.cBFBEBE),
                                                ),
                                                Transform.rotate(
                                                    angle: pi,
                                                    child: IconWidget(
                                                      iconWidth: 13.w,
                                                      icon: Assets.iconIconBack,
                                                      iconColor:
                                                          AppColors.c666666,
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            9.vGap,
                            InkWell(
                              onTap: () {
                                print('Mail');
                              },
                              child: Container(
                                height: 51.w,
                                padding:
                                    EdgeInsets.only(left: 26.w, right: 24.w),
                                decoration: BoxDecoration(
                                    color: AppColors.c333333,
                                    borderRadius: BorderRadius.circular(16.w)),
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconWidget(
                                          iconWidth: 20.w,
                                          icon: Assets.playerUiIconMail,
                                          iconColor: AppColors.cFF7954,
                                        ),
                                        9.hGap,
                                        Text(
                                          "Mail",
                                          style:
                                              14.w4(color: AppColors.cBFBEBE),
                                        )
                                      ],
                                    ),
                                    Transform.rotate(
                                        angle: pi,
                                        child: IconWidget(
                                          iconWidth: 13.w,
                                          icon: Assets.iconIconBack,
                                          iconColor: AppColors.c666666,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            9.vGap,
                            InkWell(
                              onTap: () {
                                _popAndPushNamed(
                                    context, RouteNames.mineMineSetting);
                              },
                              child: Container(
                                height: 51.w,
                                padding:
                                    EdgeInsets.only(left: 26.w, right: 24.w),
                                decoration: BoxDecoration(
                                    color: AppColors.c333333,
                                    borderRadius: BorderRadius.circular(16.w)),
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconWidget(
                                          iconWidth: 20.w,
                                          icon: Assets.playerUiIconSetting,
                                          iconColor: AppColors.cFF7954,
                                        ),
                                        9.hGap,
                                        Text(
                                          "Setting",
                                          style:
                                              14.w4(color: AppColors.cBFBEBE),
                                        )
                                      ],
                                    ),
                                    Transform.rotate(
                                        angle: pi,
                                        child: IconWidget(
                                          iconWidth: 13.w,
                                          icon: Assets.iconIconBack,
                                          iconColor: AppColors.c666666,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            9.vGap,
                            InkWell(
                              onTap: () {
                                _popAndPushNamed(
                                    context, RouteNames.mineMineAccount);
                              },
                              child: Container(
                                height: 51.w,
                                padding:
                                    EdgeInsets.only(left: 26.w, right: 24.w),
                                decoration: BoxDecoration(
                                    color: AppColors.c333333,
                                    borderRadius: BorderRadius.circular(16.w)),
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconWidget(
                                          iconWidth: 20.w,
                                          icon: Assets.playerUiIconAccount,
                                          iconColor: AppColors.cFF7954,
                                        ),
                                        9.hGap,
                                        Text(
                                          "Account",
                                          style:
                                              14.w4(color: AppColors.cBFBEBE),
                                        )
                                      ],
                                    ),
                                    Transform.rotate(
                                        angle: pi,
                                        child: IconWidget(
                                          iconWidth: 13.w,
                                          icon: Assets.iconIconBack,
                                          iconColor: AppColors.c666666,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            24.vGap,
                            InkWell(
                              onTap: () {
                                print('privacy policy');
                              },
                              child: Text(
                                "PRIVACY POLICY",
                                style: TextStyle(
                                    color: AppColors.cB3B3B3,
                                    fontSize: 12.sp,
                                    height: 1,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.cB3B3B3),
                              ),
                            ),
                            24.vGap,
                            Container(
                              height: 4.w,
                              width: 64.w,
                              decoration: BoxDecoration(
                                  color: AppColors.c404040,
                                  borderRadius: BorderRadius.circular(2.w)),
                            ),
                            15.vGap,
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.c000000,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(16.w))),
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 0.w),
                    child: UserInfoBar(
                      enable: false,
                    )),
              ],
            ),
            Expanded(child: InkWell(
              onTap: () {
                if (animationController.isAnimating) {
                  return;
                }

                ///点击空白处
                offsetDy.value = 0;
                _releaseAnimation(isBack: true);
              },
            ))
          ],
        ),
      ),
    );
  }

  void _popAndPushNamed(BuildContext context, String routeName,
      {bool useRootNavigator = false, dynamic? arguments}) {
    // Get.back(id: widget.routeId);
    Get.toNamed(routeName,
        id: useRootNavigator ? null : widget.routeId, arguments: arguments);
    // Navigator.of(context).pushNamed(routeName,arguments: {"id":widget.routeId});
  }

  void _releaseAnimation({bool isBack = false}) {
    if (!isBack && offsetDy.value >= 0) {
      return;
    }
    print('offsetDy.value:${offsetDy.value}');
    animationController.removeStatusListener(_statusListener);
    animation.removeListener(_animationListener);
    animationController.reset();
    animationController.addStatusListener(_statusListener);
    animation.addListener(_animationListener);
    if (offsetDy.value < 0 && offsetDy.value.abs() < 100) {
      animation =
          Tween(begin: offsetDy.value, end: 0.0).animate(animationController);
      animationController.forward(from: offsetDy.value);
    } else {
      animation = Tween(begin: offsetDy.value, end: maxHeight)
          .animate(animationController);
      animationController.forward();
    }
  }
}
