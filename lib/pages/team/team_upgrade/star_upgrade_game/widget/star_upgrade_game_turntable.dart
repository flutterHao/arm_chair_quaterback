import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/star_upgrade_game/widget/spinning_wheel_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

///
///@auther gejiahui
///created at 2025/2/27/19:29

class StarUpgradeGameTurntable extends StatefulWidget {
  const StarUpgradeGameTurntable({super.key});

  @override
  State<StarUpgradeGameTurntable> createState() =>
      _StarUpgradeGameTurntableState();
}

class _StarUpgradeGameTurntableState extends State<StarUpgradeGameTurntable>
    with TickerProviderStateMixin {
  ui.Image? _iconImage12;
  ui.Image? _iconImage13;
  late AnimationController _controller;
  late Animation<double> _animation;

  late AnimationController _pointerController;
  late Animation<double> _pointerAnimation;

  double currentAngle = 0.0; // 当前角度（单位：弧度）

  @override
  void initState() {
    super.initState();
    _loadImage();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: currentAngle, end: 2 * pi * 3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _pointerController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _pointerAnimation = Tween<double>(begin: 0, end: pi / 180 * 30).animate(
      CurvedAnimation(parent: _pointerController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _pointerController.dispose();
    super.dispose();
  }

  /// 旋转到指定扇形索引（0-11）
  void rotateToIndex(int index) {
    // 每个扇形的中心角度，0 下标从 -90° 开始，每个扇形 30°
    double baseAngle = index * 30.0;
    double randomOffset = 5.0 + Random().nextDouble() * 20.0; // 5°~25° 随机偏移
    double targetRotation = 360 - (baseAngle + randomOffset); // 目标角度（单位：度）

    // 确保当前角度是顺时针旋转
    // 如果目标角度 <= 当前角度，则加上 360°，确保旋转方向是顺时针
    // if (targetRotation <= currentAngle) {
    //   targetRotation += 360.0;
    // }

    // 额外增加 1 圈，确保动画至少旋转一圈
    targetRotation += 360.0 * 2;

    // 将目标角度转换为弧度，动画需要使用弧度
    targetRotation = targetRotation * pi / 180.0;

    // 创建旋转动画
    _animation =
        Tween<double>(begin: currentAngle, end: targetRotation).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart), // 超慢停止
    );

    _controller.forward(from: 0.0).then((_) {
      currentAngle = targetRotation % (2 * pi); // **存储最新角度**
      double angle = getAngle();
      _pointerAnimation = Tween<double>(begin: angle, end: 0).animate(
        CurvedAnimation(parent: _pointerController, curve: Curves.easeOut),
      );
      _pointerController.forward(from: 0);
    });
  }

  double getAngle() {
    var i = _animation.value ~/ (pi / 180 * 30);
    var angle = (i % 2 == 0
        ? -(_animation.value % (pi / 180 * 30))
        : -((pi / 180 * 30) - _animation.value % (pi / 180 * 30)));
    return angle;
  }

  Future<void> _loadImage() async {
    final ByteData data =
        await rootBundle.load(Assets.managerUiManagerRisingstar12);
    final ui.Codec codec =
        await ui.instantiateImageCodec(data.buffer.asUint8List());
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ByteData data2 =
        await rootBundle.load(Assets.managerUiManagerRisingstar13);
    final ui.Codec codec2 =
        await ui.instantiateImageCodec(data2.buffer.asUint8List());
    final ui.FrameInfo frameInfo2 = await codec2.getNextFrame();
    setState(() {
      _iconImage12 = frameInfo.image;
      _iconImage13 = frameInfo2.image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 508.w,
      width: Utils.getMaxWidth(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// 弹框背景
          Positioned(
            bottom: 0,
            child: Container(
              height: 305.w,
              width: 375.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.managerUiManagerRisingstar10))),
            ),
          ),

          /// 转盘背景
          Positioned(
            top: 3.w,
            child: Container(
              height: 426.w,
              width: 426.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.managerUiManagerRisingstar03))),
            ),
          ),

          /// 转盘
          Positioned(
            top: 23.w,
            child: SizedBox(
              width: 385.w,
              height: 385.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// 转盘
                  AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _animation.value,
                          child: Container(
                            decoration: BoxDecoration(
                                // image: DecorationImage(
                                //     image: AssetImage(
                                //         Assets.managerUiManagerRisingstar07)),
                                ),
                            child: CustomPaint(
                              size: Size(375.w, 375.w),
                              painter: SpinningWheelPainter(
                                  rotation: 0,
                                  iconImage12: _iconImage12,
                                  iconImage13: _iconImage13),
                            ),
                          ),
                        );
                      }),

                  /// 中心按钮
                  MtInkWell(
                    onTap: () {
                      var nextInt = Random().nextInt(12);
                      print('ROLL：$nextInt');
                      rotateToIndex(nextInt);
                    },
                    child: Container(
                      width: 100.w,
                      height: 100.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(""))),
                      child: Center(
                        child: Text(
                          "ROLL",
                          style: 32.w5(
                            color: AppColors.cFFFFFF,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 指针
          Positioned(
              top: 1.w,
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return AnimatedBuilder(
                        animation: _pointerController,
                        builder: (context, _) {
                          double angle = getAngle();
                          if (_controller.isCompleted) {
                            angle = _pointerAnimation.value;
                          }
                          return Transform.rotate(
                            alignment: Alignment.topCenter,
                            angle: angle,
                            child: IconWidget(
                              icon: Assets.managerUiManagerRisingstar05,
                              iconWidth: 37.w,
                            ),
                          );
                        });
                  }))
        ],
      ),
    );
  }
}
