import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/scale_animation_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spine_flutter/spine_widget.dart';

///
///@auther gejiahui
///created at 2024/9/28/15:23

class Matching extends StatefulWidget {
  const Matching({super.key});

  @override
  State<Matching> createState() => _MatchingState();
}

class _MatchingState extends State<Matching>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  var progress = 0.0.obs;
  late Animation animation;
  late double width, height;

  void _scanStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
      animationController.forward();
    }
  }

  void _animationListener() {
    progress.value = animation.value;
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..addStatusListener(_scanStatusListener);
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(_animationListener);
    animationController.forward();
    Future.delayed(Duration.zero, () {
      _randomImages();
    });
  }

  List<String> totalAvatars = [
    Assets.teamUiHead01,
    Assets.teamUiHead02,
    Assets.teamUiHead03,
    Assets.teamUiHead04,
    Assets.teamUiHead05,
    Assets.teamUiHead06,
    Assets.teamUiHead07,
    Assets.teamUiHead08,
    Assets.teamUiHead09,
    Assets.teamUiHead10,
    Assets.teamUiHead11,
    Assets.teamUiHead12,
  ];
  List<String> avatars = [];
  List<Size> sizes = [];
  List<Offset> totalOffsets = [
    Offset(30.w, 256.w),
    Offset(50.w, 500.w),
    Offset(160.w, 600.w),
    Offset(280.w, 530.w),
    Offset(270.w, 400.w),
    Offset(170.w, 140.w),
    Offset(290.w, 250.w),
    Offset(30.w, 386.w),
    Offset(160.w, 500.w),
    Offset(130.w, 270.w),
    Offset(220.w, 240.w),
    Offset(35.w, 580.w),
  ];
  List<Offset> offsets = [];

  _randomImages() {
    avatars.clear();
    sizes.clear();
    offsets.clear();
    // var scanWidgetSize = Size(143.w, 143.w);
    while (avatars.length < 6) {
      var nextInt = Random().nextInt(totalAvatars.length);
      var avatar = totalAvatars[nextInt];
      var contains = avatars.contains(avatar);
      if (!contains) {
        avatars.add(avatar);
      }
    }

    List.generate(avatars.length, (_) {
      sizes.add(Size.square((Random().nextInt(44) + 20).toDouble()));
    });
    while (offsets.length <= avatars.length) {
      var nextInt = Random().nextInt(totalOffsets.length);
      var avatar = totalOffsets[nextInt];
      var contains = offsets.contains(avatar);
      if (!contains) {
        offsets.add(avatar);
      }
    }

    if (mounted) setState(() {});
  }

  _changeAvatar(String image) {
    var indexOf = avatars.indexOf(image);
    while (true) {
      var avatar = totalAvatars[Random().nextInt(totalOffsets.length)];
      if (!avatars.contains(avatar)) {
        avatars.replaceRange(indexOf, indexOf + 1, [avatar]);
        break;
      }
    }
    while (true) {
      var offset = totalOffsets[Random().nextInt(totalOffsets.length)];
      if (!offsets.contains(offset)) {
        offsets.replaceRange(indexOf, indexOf + 1, [offset]);
        break;
      }
    }
    sizes.replaceRange(indexOf, indexOf + 1,
        [Size.square((Random().nextInt(44) + 20).toDouble())]);

    if (mounted) setState(() {});

    // state.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      child: Container(
        color: AppColors.c000000.withOpacity(.6),
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: _buildScan(width, height),
        ),
      ),
    );
  }

  List<Widget> _buildScan(double width, double height) {
    double minSize = 143.w;
    double maxWidthHeight = max(width, height);
    return [
      // 大圆
      Obx(() {
        var p = progress.value;
        double rWidth = maxWidthHeight * p;
        return Positioned(
          width: rWidth,
          height: rWidth,
          child: rWidth <= minSize
              ? const SizedBox.shrink()
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(.2 * (1 - p)),
                      borderRadius: BorderRadius.circular(rWidth / 2),
                      border: Border.all(
                          color: Colors.blue.withOpacity(.4 * (1 - p)),
                          width: 1)),
                ),
        );
      }),
      // 小圆
      Obx(() {
        var p = progress.value - 0.2;
        double rWidth = maxWidthHeight * p;
        return Positioned(
          width: rWidth,
          height: rWidth,
          child: rWidth <= minSize
              ? const SizedBox.shrink()
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(.2 * (1 - p)),
                      borderRadius: BorderRadius.circular(rWidth / 2),
                      border: Border.all(
                          color: Colors.blue.withOpacity(.4 * (1 - p)),
                          width: 1)),
                ),
        );
      }),
      // 扫描
      SizedBox(
        width: 143.w,
        height: 143.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            IconWidget(iconWidth: 143.w, icon: Assets.teamUiBgRadar),
            Obx(() {
              return Positioned(
                  child: Transform.rotate(
                angle: -pi / 180 * 360 * progress.value,
                child: SizedBox(
                  width: 143.w,
                  height: 143.w,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 13.w,
                        bottom: 13.w,
                        child: IconWidget(
                          iconWidth: 91.w,
                          icon: Assets.teamUiBgScan,
                        ),
                      ),
                    ],
                  ),
                ),
              ));
            })
          ],
        ),
      ),

      ...List.generate(
          avatars.length,
          (index) => Positioned(
                left: offsets[index].dx,
                top: offsets[index].dy,
                child: SizedBox(
                  height: sizes[index].height,
                  width: sizes[index].width,
                  child: Center(
                      child: ScaleAnimationWidget(
                          size: sizes[index],
                          image: avatars[index],
                          onComplete: _changeAvatar)),
                ),
              ))
    ];
  }
}

class MatchingV2 extends GetView<TeamBattleController> {
  const MatchingV2({super.key});

  @override
  Widget build(BuildContext context) {
    final spineController = SpineWidgetController(onInitialized: (controller) {
      // Set the default mixing time between animations
      controller.animationState.getData().setDefaultMix(0.2);
      // Set the portal animation on track 0
      controller.animationState.setAnimationByName(0, "loading", true);
      // Queue the run animation after the portal animation
      // spineController.animationState.addAnimationByName(0, "run", true, 0);
    });
    return GetBuilder<TeamBattleController>(
      id: TeamBattleController.idMatching,
        builder: (logic) {
      return Container(
        color: AppColors.cF2F2F2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: IconWidget(icon: Assets.managerUiMangerNew26)),
            Positioned(
                bottom: 0,
                right: 0,
                width: 150.w,
                child: IconWidget(icon: Assets.managerUiMangerNew27)),
            Positioned(
                top: 80.w,
                child: Text(
                  "MATCH GAME",
                  style: 35.w5(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium,
                  ),
                )),
            Positioned(
                top: 287.w,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(39.w),
                                  border: Border.all(
                                      color: AppColors.c2C9AE0, width: 2.w),
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: UserAvatarWidget(
                                    url: Utils.getAvatarUrl(
                                        "${Get.find<HomeController>().userEntiry.teamLoginInfo?.team?.teamLogo}"),
                                    width: 78.w,
                                    radius: 39.w,
                                    height: 78.w)),
                            14.vGap,
                            Text(
                              "${Get.find<HomeController>().userEntiry.teamLoginInfo?.team?.teamName}",
                              style: 14.w4(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldRegular,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 93.w,
                          height: 78.w,
                          child: Center(
                            child: Text(
                              "VS",
                              style: 30.w5(
                                color: AppColors.c262626,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Builder(builder: (context) {
                              if (controller.loadStatus ==
                                  LoadDataStatus.loading) {
                                return Container(
                                  height: 78.w,
                                  width: 78.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.c262626,
                                    borderRadius: BorderRadius.circular(39.w),
                                    border: Border.all(
                                        color: AppColors.c262626, width: 2.w),
                                  ),
                                  child: IconWidget(
                                    icon:
                                        Assets.managerUiManagerTrainingUnknown,
                                    iconWidth: 14.w,
                                  ),
                                );
                              }
                              return Container(
                                  height: 78.w,
                                  width: 78.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(39.w),
                                    border: Border.all(
                                        color: AppColors.cD60D20, width: 2.w),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: UserAvatarWidget(
                                      url: Utils.getAvatarUrl(
                                          "${controller.battleEntity.awayTeam.teamLogo}"),
                                      width: 78.w,
                                      radius: 39.w,
                                      height: 78.w));
                            }),
                            14.vGap,
                            Text(
                              controller.loadStatus == LoadDataStatus.loading
                                  ? ". . ."
                                  : controller.battleEntity.awayTeam.teamName,
                              style: 14.w4(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldRegular,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    54.vGap,
                    if (controller.loadStatus == LoadDataStatus.loading)
                      SizedBox(
                          width: 50.w,
                          height: 50.w,
                          child: SpineWidget.fromAsset(
                              Assets.spineLoadingLoading,
                              'assets/spine/loading/loading.json',
                              spineController))
                  ],
                ))
          ],
        ),
      );
    });
  }
}
