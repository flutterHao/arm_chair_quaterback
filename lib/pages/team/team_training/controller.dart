import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/widgets/line_up_tab.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/widgets/player_bag_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamTrainingController extends GetxController
    with GetTickerProviderStateMixin {
  final state = TeamTrainingState();

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

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    // 初始化动画控制器
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    setAnimation(0);

    // 控制篮球大小变化的动画，变小后保持不变
    scaleAnimation = animationController.drive(
      TweenSequence<double>([
        // 第一阶段：篮球从正常大小变小 (1.0 到 0.7)
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 1.0,
            end: 0.5,
          ).chain(CurveTween(curve: Curves.easeIn)), // 上升时缩小
          weight: 40.0, // 第一阶段占 40% 的时间
        ),
        // 第二阶段：篮球从缩小状态恢复到原大小 (0.7 到 1.0)
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.5,
            end: 0.35,
          ).chain(CurveTween(curve: Curves.easeOut)), // 到达最高点时恢复原大小
          weight: 40.0, // 第二阶段占 40% 的时间
        ),
        // 第三阶段：投篮下落时，篮球可以保持原大小，或者继续变小或变大
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.35,
            end: 0.35, // 这里保持不变，或者根据需要修改
          ).chain(CurveTween(curve: Curves.bounceOut)), // 下落时保持原大小或弹性变化
          weight: 20.0, // 第三阶段占 20% 的时间
        ),
      ]),
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

    // 初始化旋转动画（0 到 2π，即一圈）
    opacityAnimation = Tween<double>(
      begin: 1,
      end: 0, // 一圈，360度
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1, curve: Curves.linear),
      ),
    );
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

  // final List<String> awardList = ['🍒', '🍋', '🍉', '🍇', '🍓', '🍌'];
  final List<String> awardList = [
    Assets.uiIconPicks_01Png,
    Assets.uiIconTeam_01Png
  ];
  List<String> currentAward = ['', '', ''].obs;

  ///开始老虎机动画
  void startAnimation() {
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

  // 投篮的逻辑
  void shootBall() {
    int type = Random().nextInt(2);
    setAnimation(type);
    if (!isShot.value) {
      isShot.value = true;
      animationController.forward().then((value) {
        isShot.value = false;
        animationController.reset(); // 投篮完成后重置篮球位置
      });
    }
  }

  void setAnimation(int type) {
    switch (type) {
      case 0:
        setAnimation0();
        break;
      case 1:
        setAnimation2();
        break;
    }
  }

  ///进球动画1
  void setAnimation0() {
    positionAnimation = animationController.drive(
      TweenSequence<Offset>([
        // 第一阶段：从 (0, 0) 到 (0, -0.5)，时间占 30%
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset(0, 0),
            end: Offset(0, -1),
          ).chain(CurveTween(curve: Curves.decelerate)), // 设置动画曲线
          weight: 40.0, // 占总动画时间的 30%
        ),
        // 第二阶段：从 (0, -0.5) 到 (0, -1)，时间占 50%
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset(0, -1),
            end: Offset(0, -0.4),
          ).chain(CurveTween(curve: Curves.easeInCirc)),
          weight: 40.0, // 占总动画时间的 50%
        ),
        // 第三阶段：从 (0, -1) 回到 (0, 0)，时间占 20%
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset(0, -0.4),
            end: Offset(0, -0.2),
          ).chain(CurveTween(curve: Curves.bounceOut)), // 下落时带有弹性效果
          weight: 20.0, // 占总动画时间的 20%
        ),
      ]),
    );

    // 监听动画进度
    animationController.addListener(() {
      if (animationController.value <= 0.4) {
        isAscending.value = true; // 上升阶段
      } else {
        isAscending.value = false; // 下降阶段
      }
    });
  }

  ///未进球动画2
  void setAnimation2() {
    positionAnimation = animationController.drive(TweenSequence<Offset>([
      TweenSequenceItem(
        tween:
            Tween<Offset>(begin: Offset(0, 0), end: Offset(0.4, -0.8)) // 向右上方偏移
                .chain(CurveTween(curve: Curves.decelerate)),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(begin: Offset(0.4, -0.8), end: Offset(0.4, 0))
            .chain(CurveTween(curve: Curves.easeInCirc)),
        weight: 50.0,
      ),
    ]));

    // 监听动画进度
    animationController.addListener(() {
      if (animationController.value <= 0.7) {
        isAscending.value = true; // 上升阶段
      } else {
        isAscending.value = false; // 下降阶段
      }
    });
  }

  ///未进球动画2
  void setAnimation3() {
    positionAnimation = animationController.drive(TweenSequence<Offset>([
      TweenSequenceItem(
        tween:
            Tween<Offset>(begin: Offset(0, 0), end: Offset(0.4, -0.8)) // 向右上方偏移
                .chain(CurveTween(curve: Curves.decelerate)),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(begin: Offset(0.4, -0.8), end: Offset(0.4, 0))
            .chain(CurveTween(curve: Curves.easeInCirc)),
        weight: 50.0,
      ),
    ]));

    // 监听动画进度
    animationController.addListener(() {
      if (animationController.value <= 0.7) {
        isAscending.value = true; // 上升阶段
      } else {
        isAscending.value = false; // 下降阶段
      }
    });
  }
}
