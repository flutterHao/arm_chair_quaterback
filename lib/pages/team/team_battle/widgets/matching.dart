import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/scale_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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

