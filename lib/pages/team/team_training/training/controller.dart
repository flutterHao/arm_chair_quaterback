import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/line_up_tab.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_bag_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingController extends GetxController
    with GetTickerProviderStateMixin {
  final random = Random();
  late TabController tabController;
  RxInt current = 0.obs;
  // double turns = 0;
  final List<String> tabs = ["Line-up", "Player bag"];
  final List<Widget> pages = const [
    LineUpTab(),
    PlayerBagTab(),
  ];
  List<String> teamList = ["C", "PG", "SG", "SF", "PF"];
  RxBool isRecovering = false.obs;
  List<int> lineUpList = [];
  RxBool showThirdCard = true.obs;

  late AnimationController animationController;
  late Animation<Offset> positionAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> rotationAnimation;
  late Animation<double> opacityAnimation;

  var isShot = false.obs; // 使用 GetX 的响应式状态
  var isAscending = true.obs; // 动画是否在上升

  final List<String> awardList = [
    Assets.uiIconPicks_01Png,
    Assets.uiIconTeam_01Png
  ];
  List<String> currentAward = ['', '', ''].obs;

  late AnimationController prizeController;
  late List<Leaf> leaves;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    // 初始化动画控制器
    setAnimationCtrl(2000);
    setBallAnimation(0);

    prizeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // 初始化10片随机落叶
    leaves = List.generate(20, (index) => Leaf());
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  void onTabChange(v) {
    current.value = v;
    tabController.animateTo(v);
  }

  // 投篮的逻辑
  void shootBall() {
    currentAward = ['', '', ''];
    update(["slot"]);
    int type = random.nextInt(4);
    setBallAnimation(type);
    if (!isShot.value) {
      isShot.value = true;
      animationController.forward().then((value) {
        // isShot.value = false;
        // animationController.reset(); // 投篮完成后重置篮球位置
      });
    }
  }

  void setBallAnimation(int type) {
    switch (type) {
      case 0:
        setAnimation0();
        break;
      case 1:
        setAnimation1();
        break;
      case 2:
        setAnimation2();
        break;
      case 3:
        setAnimation3();
        break;
    }
  }

  void setAnimationCtrl(int milliseconds) {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: milliseconds),
    );

    // 初始化旋转动画（0 到 2π，即一圈）
    rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.14159, // 一圈，360度
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear, // 旋转动画使用线性效果
      ),
    );
    // 透明度，消失
    opacityAnimation = Tween<double>(
      begin: 1,
      end: 0, // 一圈，360度
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.8, 1, curve: Curves.linear),
      ),
    );
  }

  ///进球动画
  void setAnimation0() {
    setAnimationCtrl(1500);
    int type = random.nextInt(2);
    double x = random.nextDouble() * (type == 0 ? 0.1 : -0.1);
    positionAnimation = animationController.drive(
      TweenSequence<Offset>([
        // 第一阶段：从 (0, 0) 到 (0, -0.5)，时间占 30%
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, 0),
            end: Offset(x, -1),
          ).chain(CurveTween(curve: Curves.decelerate)), // 设置动画曲线
          weight: 30.0, // 占总动画时间的 30%
        ),
        // 第二阶段：从 (0, -0.5) 到 (0, -1)，时间占 50%
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset(x, -1),
            end: const Offset(0, -0.3),
          ).chain(CurveTween(curve: Curves.easeInCirc)),
          weight: 40.0, // 占总动画时间的 50%
        ),
        // 第三阶段：从 (0, -1) 回到 (0, 0)，时间占 20%
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, -0.5),
            end: const Offset(0, -0.3),
          ).chain(CurveTween(curve: Curves.bounceOut)), // 下落时带有弹性效果
          weight: 30.0, // 占总动画时间的 20%
        ),
      ]),
    );
    // 控制篮球大小变化的动画，变小后保持不变
    scaleAnimation = animationController.drive(
      TweenSequence<double>([
        // 第一阶段：篮球从正常大小变小 (1.0 到 0.7)
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 1.0,
            end: 0.5,
          ).chain(CurveTween(curve: Curves.easeIn)), // 上升时缩小
          weight: 30.0, // 第一阶段占 40% 的时间
        ),
        // 第二阶段：篮球从缩小状态恢复到原大小 (0.7 到 1.0)
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.5,
            end: 0.35,
          ).chain(CurveTween(curve: Curves.easeOut)), // 到达最高点时恢复原大小
          weight: 50.0, // 第二阶段占 40% 的时间
        ),
        // 第三阶段：投篮下落时，篮球可以保持原大小，或者继续变小或变大
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.35,
            end: 0.4, // 这里保持不变，或者根据需要修改
          ).chain(CurveTween(curve: Curves.bounceOut)), // 下落时保持原大小或弹性变化
          weight: 20.0, // 第三阶段占 20% 的时间
        ),
      ]),
    );

    // 监听动画进度
    setAnimationListen(0, 0.4);
  }

  ///进球动画
  void setAnimation1() {
    setAnimationCtrl(2000);
    int type = random.nextInt(2);
    // double x = random.nextDouble() * ();
    double x = type == 0 ? 0.1 : -0.1;
    positionAnimation = animationController.drive(
      TweenSequence<Offset>([
        //上升
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, 0),
            end: Offset(x, -1),
          ).chain(CurveTween(curve: Curves.decelerate)), // 设置动画曲线
          weight: 30.0, // 占总动画时间的 30%
        ),
        // 下落
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset(x, -1),
            end: Offset(x, -0.78),
          ).chain(CurveTween(curve: Curves.easeInCirc)),
          weight: 20.0, // 占总动画时间的 50%
        ),
        // 弹跳
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset(x, -0.78),
            end: Offset(-x, -0.78),
          ).chain(CurveTween(curve: Curves.bounceOut)),
          weight: 10.0, // 占总动画时间的 50%
        ),
        // 下落
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, -0.78),
            end: const Offset(0, -0.3),
          ).chain(CurveTween(curve: Curves.easeInCirc)),
          weight: 30.0, // 占总动画时间的 50%
        ),
        // 第三阶段：从 (0, -1) 回到 (0, 0)，时间占 20%
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, -0.5),
            end: const Offset(0, -0.3),
          ).chain(CurveTween(curve: Curves.bounceOut)), // 下落时带有弹性效果
          weight: 20.0, // 占总动画时间的 20%
        ),
      ]),
    );

    // 控制篮球大小变化的动画，变小后保持不变
    scaleAnimation = animationController.drive(
      TweenSequence<double>([
        // 第一阶段：篮球从正常大小变小 (1.0 到 0.7)
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 1.0,
            end: 0.5,
          ).chain(CurveTween(curve: Curves.easeIn)), // 上升时缩小
          weight: 30.0, // 第一阶段占 40% 的时间
        ),
        // 第二阶段：篮球从缩小状态恢复到原大小 (0.7 到 1.0)
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.5,
            end: 0.35,
          ).chain(CurveTween(curve: Curves.easeOut)), // 到达最高点时恢复原大小
          weight: 20.0, // 第二阶段占 40% 的时间
        ),
        // 第三阶段：投篮下落时，篮球可以保持原大小，或者继续变小或变大
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.35,
            end: 0.35, // 这里保持不变，或者根据需要修改
          ).chain(CurveTween(curve: Curves.bounceOut)), // 下落时保持原大小或弹性变化
          weight: 50.0, // 第三阶段占 20% 的时间
        ),
      ]),
    );

    setAnimationListen(1, 0.4);
  }

  ///未进球动画
  void setAnimation2() {
    setAnimationCtrl(2000);
    // int d = random.nextInt(2);
    // double x = random.nextDouble() * ();
    double x = 0.2, x1 = x + 0.8, x2 = x1 + 2;
    positionAnimation = animationController.drive(
      TweenSequence<Offset>([
        //上升
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, 0),
            end: Offset(x, -1),
          ).chain(CurveTween(curve: Curves.decelerate)), // 设置动画曲线
          weight: 30.0, // 占总动画时间的 30%
        ),
        // 下落
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset(x, -1),
            end: Offset(x, -0.75),
          ).chain(CurveTween(curve: Curves.easeInCirc)),
          weight: 20.0, // 占总动画时间的 50%
        ),
        // 弹跳
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset(x, -0.78),
            end: Offset(-x, -0.78),
          ).chain(CurveTween(curve: Curves.bounceOut)),
          weight: 10.0, // 占总动画时间的 50%
        ),
        // 弹出
        TweenSequenceItem(
          tween: BezierOffsetTween(
            begin: Offset(-x, -0.78),
            end: Offset(x1, -0.85),
            controlPoint: Offset((-x + x1) / 2, -0.82),
          ).chain(CurveTween(curve: Cubic(1, 1, 0.5, 0))),
          weight: 10.0, // 占总动画时间的 50%
        ),
        // 下落
        TweenSequenceItem(
          tween: BezierOffsetTween(
            begin: Offset(x1, -0.85), // 起始点
            end: Offset(x2, -0.2), // 终点
            controlPoint: Offset((x1 + x2) / 2, -1), // 控制点，决定抛物线的形状
          ).chain(
              CurveTween(curve: Cubic(0.5, 0.2, 0.4, 0.8))), // 使用贝塞尔曲线并结合自定义曲线
          weight: 30.0, // 占总动画时间的 30%
        ),
        // 第三阶段：从 (0, -1) 回到 (0, 0)，时间占 20%
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset(x2, -0.4),
            end: Offset(x2, -0.2),
          ).chain(CurveTween(curve: Curves.bounceOut)), // 下落时带有弹性效果
          weight: 20.0, // 占总动画时间的 20%
        ),
      ]),
    );

    // 控制篮球大小变化的动画，变小后保持不变
    scaleAnimation = animationController.drive(
      TweenSequence<double>([
        // 第一阶段：篮球从正常大小变小 (1.0 到 0.7)
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 1.0,
            end: 0.5,
          ).chain(CurveTween(curve: Curves.easeIn)), // 上升时缩小
          weight: 30.0, // 第一阶段占 40% 的时间
        ),
        // 第二阶段：篮球从缩小状态恢复到原大小 (0.7 到 1.0)
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.5,
            end: 0.35,
          ).chain(CurveTween(curve: Curves.easeOut)), // 到达最高点时恢复原大小
          weight: 20.0,
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.35,
            end: 0.35,
          ).chain(CurveTween(curve: Curves.bounceOut)),
          weight: 10.0,
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.35,
            end: 0.37,
          ).chain(CurveTween(curve: Curves.bounceOut)),
          weight: 10.0,
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.37,
            end: 0.4,
          ).chain(CurveTween(curve: Curves.bounceOut)),
          weight: 50.0, //
        ),
      ]),
    );

    setAnimationListen(2, 0.4);
  }

  ///未进球动画
  void setAnimation3() {
    setAnimationCtrl(2000);
    int type = -1;
    // double x = random.nextDouble() * ();
    double x = -0.1 * type, x1 = (x + 0.5) * type, x2 = (x + 1.5) * type;
    positionAnimation = animationController.drive(
      TweenSequence<Offset>([
        //上升
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, 0),
            end: Offset(x, -1),
          ).chain(CurveTween(curve: Curves.decelerate)), // 设置动画曲线
          weight: 30.0, // 占总动画时间的 30%
        ),
        // 下落
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset(x, -1),
            end: Offset(x, -0.78),
          ).chain(CurveTween(curve: Curves.easeInCirc)),
          weight: 20.0, // 占总动画时间的 50%
        ),
        // 弹出
        TweenSequenceItem(
          tween: BezierOffsetTween(
            begin: Offset(x, -0.78),
            end: Offset(x1, -0.85),
            controlPoint: Offset((-x + x1) / 2, -0.82),
          ).chain(CurveTween(curve: Cubic(1, 1, 0.5, 0))),
          weight: 10.0, // 占总动画时间的 50%
        ),
        // 下落
        TweenSequenceItem(
          tween: BezierOffsetTween(
            begin: Offset(x1, -0.85), // 起始点
            end: Offset(x2, -0.3), // 终点
            controlPoint: Offset((x1 + x2) / 2, -1), // 控制点，决定抛物线的形状
          ).chain(
              CurveTween(curve: Cubic(0.5, 0.2, 0.4, 0.8))), // 使用贝塞尔曲线并结合自定义曲线
          weight: 30.0, // 占总动画时间的 30%
        ),
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset(x2, -0.5),
            end: Offset(x2, -0.3),
          ).chain(CurveTween(curve: Curves.bounceOut)), // 下落时带有弹性效果
          weight: 30.0, // 占总动画时间的 20%
        ),
        // ..._bounceList(x2)
      ]),
    );

    // 控制篮球大小变化的动画，变小后保持不变
    scaleAnimation = animationController.drive(
      TweenSequence<double>([
        // 第一阶段：篮球从正常大小变小 (1.0 到 0.7)
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 1.0,
            end: 0.5,
          ).chain(CurveTween(curve: Curves.easeIn)), // 上升时缩小
          weight: 30.0, // 第一阶段占 40% 的时间
        ),
        // 第二阶段：篮球从缩小状态恢复到原大小 (0.7 到 1.0)
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.5,
            end: 0.35,
          ).chain(CurveTween(curve: Curves.easeOut)), // 到达最高点时恢复原大小
          weight: 20.0,
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.35,
            end: 0.37,
          ).chain(CurveTween(curve: Curves.bounceOut)),
          weight: 10.0,
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.37,
            end: 0.4,
          ).chain(CurveTween(curve: Curves.bounceOut)),
          weight: 50.0, //
        ),
      ]),
    );

    setAnimationListen(2, 0.4);
  }

  void setAnimationListen(int type, double progress) {
    // 监听动画进度
    animationController.addListener(() {
      if (animationController.value <= progress) {
        isAscending.value = true; // 上升阶段
      } else {
        isAscending.value = false; // 下降阶段
      }

      if (animationController.status.isCompleted) {
        if (type <= 1) {
          slotAnimation();
        } else {
          isShot.value = false;
          animationController.reset(); // 投篮完成后重置篮球位置
        }
      }
    });
  }

  // void setScaleAnimation() {

  // }

  ///开始老虎机动画
  void slotAnimation() {
    currentAward = ['', '', ''];
    Future.delayed(const Duration(milliseconds: 200), () {
      updateCard(0);
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      updateCard(1);
    });
    Future.delayed(const Duration(milliseconds: 1000), () {
      updateCard(2);
      if (currentAward[1] == currentAward[2]) {
        _flashCard(0);
      }
    }).then((v) {
      Future.delayed(const Duration(milliseconds: 200), () {
        isShot.value = false;
        animationController.reset(); // 投篮完成后重置篮球位置
        prizeController.reset();
        prizeController.forward();
      });
    });
  }

  void updateCard(int index) {
    currentAward[index] = awardList[Random().nextInt(awardList.length)];
    update(["slot"]);
  }

  void _flashCard(int count) {
    if (count >= 6) return; // 闪烁5次后停止

    showThirdCard.value = !showThirdCard.value;
    update(["slot"]);
    Future.delayed(const Duration(milliseconds: 100), () {
      _flashCard(count + 1);
    });
  }
}

class BezierOffsetTween extends Tween<Offset> {
  final Offset controlPoint;

  BezierOffsetTween({
    required Offset begin,
    required Offset end,
    required this.controlPoint,
  }) : super(begin: begin, end: end);

  @override
  Offset lerp(double t) {
    // 二阶贝塞尔曲线公式
    double x = (1 - t) * (1 - t) * begin!.dx +
        2 * (1 - t) * t * controlPoint.dx +
        t * t * end!.dx;
    double y = (1 - t) * (1 - t) * begin!.dy +
        2 * (1 - t) * t * controlPoint.dy +
        t * t * end!.dy;

    return Offset(x, y);
  }
}

class Leaf {
  final int index;
  double x;
  double y;
  Widget widget;

  Leaf()
      : index = Random().nextInt(20),
        x = Random().nextDouble() * 375.w,
        y = Random().nextDouble() * -250.h,
        widget = Image.asset(
          Assets.uiBgMoneyPng,
          width: 50,
          fit: BoxFit.fitWidth,
        );
}

List<TweenSequenceItem<Offset>> _bounceList(double x) {
  return [
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(x, -0.3), // 初始位置
        end: Offset(x, -0.45), // 到达下落终点
      ).chain(CurveTween(curve: Curves.easeIn)), // 加速下落
      weight: 10, // 占总时间的 40%
    ),
    // 第二阶段：第一次弹起（高弹）
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(x, -0.45),
        end: Offset(x, -0.3), // 第一次弹起的高度
      ).chain(CurveTween(curve: Curves.easeOut)), // 弹起时减速
      weight: 10, // 占总时间的 20%
    ),
    // 第三阶段：第二次弹起（高度较低）
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(x, -0.3),
        end: Offset(x, -0.4), // 弹回接近终点
      ).chain(CurveTween(curve: Curves.easeInOut)), // 缓和过渡
      weight: 10, // 占总时间的 20%
    ),
    // 第四阶段：小幅度的余震弹跳
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(x, -0.4),
        end: Offset(x, -0.3), // 最终停止的位置
      ).chain(CurveTween(curve: Curves.easeOut)), // 最后弹回减速
      weight: 10, // 占总时间的 20%
    ),
  ];
}

TweenSequence<Offset> _customBounceSequence(double xPosition) {
  return TweenSequence<Offset>([
    // 第一阶段：快速下落到较低位置
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(xPosition, -0.5), // 初始位置
        end: Offset(xPosition, 0.3), // 到达下落终点
      ).chain(CurveTween(curve: Curves.easeIn)), // 加速下落
      weight: 12, // 占总时间的 40%
    ),
    // 第二阶段：第一次弹起（高弹）
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(xPosition, 0.3),
        end: Offset(xPosition, -0.2), // 第一次弹起的高度
      ).chain(CurveTween(curve: Curves.easeOut)), // 弹起时减速
      weight: 6, // 占总时间的 20%
    ),
    // 第三阶段：第二次弹起（高度较低）
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(xPosition, -0.2),
        end: Offset(xPosition, 0.1), // 弹回接近终点
      ).chain(CurveTween(curve: Curves.easeInOut)), // 缓和过渡
      weight: 6, // 占总时间的 20%
    ),
    // 第四阶段：小幅度的余震弹跳
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(xPosition, 0.1),
        end: Offset(xPosition, 0), // 最终停止的位置
      ).chain(CurveTween(curve: Curves.easeOut)), // 最后弹回减速
      weight: 6, // 占总时间的 20%
    ),
  ]);
}


// class HighBounceOutCurve extends Curve {
//   // const HighBounceOutCurve._();
//   @override
//   double transformInternal(double t) {
//     // 通过更平滑的方式增加弹跳高度
//     double bounceHeightFactor = 1.2; // 适度提升弹跳高度

//     if (t < 0.5) {
//       // 第一阶段（弹跳进入）
//       return (1.0 - _highBounce(1.0 - t * 2.0, bounceHeightFactor)) * 0.5;
//     } else {
//       // 第二阶段（弹跳退出）
//       return _highBounce(t * 2.0 - 1.0, bounceHeightFactor) * 0.5 + 0.5;
//     }
//   }

//   // 修改后的 _bounce 函数，保持较小的弹跳高度变化，避免计算过多
//   double _highBounce(double t, double bounceHeightFactor) {
//     const double scale = 7.5625;
//     // 通过简化条件分支，减少 t 的不必要变化
//     if (t < 1 / 2.75) {
//       return scale * t * t * bounceHeightFactor; // 第一阶段
//     } else if (t < 2 / 2.75) {
//       t -= 1.5 / 2.75;
//       return scale * (t * t + 0.75) * bounceHeightFactor; // 第二阶段
//     } else if (t < 2.5 / 2.75) {
//       t -= 2.25 / 2.75;
//       return scale * (t * t + 0.9375) * bounceHeightFactor; // 第三阶段
//     } else {
//       t -= 2.625 / 2.75;
//       return scale * (t * t + 0.984375) * bounceHeightFactor; // 第四阶段
//     }
//   }
// }
