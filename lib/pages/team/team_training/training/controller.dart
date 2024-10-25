import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/my_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/reward_group_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/train_task_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/home/index.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingController extends GetxController
    with GetTickerProviderStateMixin {
  final random = Random();
  RxBool showThirdCard = true.obs;
  var isShot = false.obs; // 使用 GetX 的响应式状态
  var isAscending = true.obs; // 动画是否在上升
  var isShowBuble = false.obs;
  var isShowRipple = false.obs;
  var isShowBuff = false.obs;
  var isShowProp = false.obs;
  var isShowBall = false.obs;
  var showText = "TRAINING".obs;
  var recoverTime = "".obs;
  List<int> currentAward = [0, 0, 0].obs;
  List<RewardGroupEntity> rewardList = [];
  TrainingInfoEntity trainingInfo = TrainingInfoEntity();
  List<TeamPlayerInfoEntity> playerList = [];
  int currentIndex = 0;
  List<TrainTaskEntity> trainTaskList = [];
  Map<String, dynamic> trainDefineMap = {};
  late int _recoverSeconds;
  RxString remainString = "".obs;
  RxString taskCountDownString = "".obs;
  RxInt ballNum = 0.obs;

  ///篮球控制
  late AnimationController bllAnimationCtrl;
  late Animation<Offset> positionAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> rotationAnimation;
  late Animation<double> opacityAnimation;

  ///奖励
  late AnimationController moneyCtrl;
  late AnimationController flyCtrl;
  late List<MoneyItem> moneyList;

  //球员滚动
  late SwiperController swiperControl;
  late Timer _timer;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    // 初始化动画控制器
    setBallAnimationCtrl(1000);

    moneyCtrl = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    flyCtrl = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // 初始化10片随机落叶
    moneyList = List.generate(20, (index) => MoneyItem());

    swiperControl = SwiperController();
    setBallAnimation(0);
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    getData();
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
    _timer.cancel();
    swiperControl.dispose();
  }

  void getData() async {
    int teamId = HomeController.to.userEntiry.teamLoginInfo!.team!.teamId!;
    await Future.wait([
      CacheApi.getRewardGroup(),
      TeamApi.getTrainingInfo(),
      // TeamApi.getMyTeamPlayer(teamId),
      TeamApi.getTrainTaskList(),
      TeamApi.getTrainDefine(),
      TeamApi.getMyTeamPlayer(teamId)
    ]).then((v) {
      rewardList = v[0] as List<RewardGroupEntity>;
      trainingInfo = v[1] as TrainingInfoEntity;
      trainTaskList = v[2] as List<TrainTaskEntity>;
      trainDefineMap = v[3] as Map<String, dynamic>;
      playerList = (v[4] as MyTeamEntity).teamPlayers;
      ballNum.value = trainingInfo.prop.num;
      recoverTimeAndCountDown();
      Log.d("球员id列表:${playerList.map((e) => e.playerId).toList()}");
      update(["training_page"]);
    });
  }

  ///获取配置数据计算倒计时
  void recoverTimeAndCountDown() {
    int recover = int.tryParse(trainDefineMap["ballRecoverTime"]) ?? 0;
    DateTime recoverTime =
        DateUtil.getDateTimeByMs(trainingInfo.training.ballRefreshTime)
            .add(Duration(seconds: recover));
    Log.d("恢复时间:${recoverTime}");
    Log.d("现在时间:${DateTime.now()}");
    _recoverSeconds = recoverTime.difference(DateTime.now()).inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (v) async {
      _recoverSeconds--;

      ///获取回复篮球与当前时间倒计时，转换成mm:ss
      final minutes = _recoverSeconds ~/ 60;
      final remainingSeconds = _recoverSeconds % 60;
      remainString.value =
          '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
      if (_recoverSeconds == 0) {
        _timer.cancel();
        // 重新获取新的恢复时间进行倒计时
        trainingInfo = await TeamApi.getTrainingInfo();
        recoverTimeAndCountDown();
        // update(["training_page"]);
      }

      ///计算任务倒计时
      int ms = trainingInfo.training.taskEndTime -
          DateTime.now().millisecondsSinceEpoch;
      taskCountDownString.value =
          DateUtil.formatDateMs(ms, format: DateFormats.h_m_s);
    });
  }

  ///获取当前任务需要多少
  int getTaskNeed(int level) {
    for (var element in trainTaskList) {
      if (element.taskLevel == level) {
        return element.taskNeed;
      }
    }
    return 1;
  }

  // 投篮的逻辑
  void shootBall(String uuid) {
    if (ballNum.value <= 0) return;
    String id = playerList[currentIndex].uuid;
    ballNum.value = ballNum.value - 1;
    TeamApi.playerTraining(id).then((v) {
      trainingInfo = v;
      // update(["training_page"]);

      // swiperControl.stopAutoplay();
      currentAward = [0, 0, 0];

      update(["slot"]);
      int type = trainingInfo.awardGroupId != 0
          ? random.nextInt(2)
          : (random.nextInt(2) + 2);
      setBallAnimation(type);
      if (!isShot.value) {
        isShot.value = true;
        bllAnimationCtrl.forward().then((value) {
          // isShot.value = false;
          // animationController.reset(); // 投篮完成后重置篮球位置
        });
      }
    });
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

  void setBallAnimationCtrl(int milliseconds) {
    bllAnimationCtrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: milliseconds),
    );

    // 初始化旋转动画（0 到 2π，即一圈）
    rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.14159, // 一圈，360度
    ).animate(
      CurvedAnimation(
        parent: bllAnimationCtrl,
        curve: Curves.linear, // 旋转动画使用线性效果
      ),
    );
    // 透明度，消失
    opacityAnimation = Tween<double>(
      begin: 1,
      end: 0, // 一圈，360度
    ).animate(
      CurvedAnimation(
        parent: bllAnimationCtrl,
        curve: const Interval(0.8, 1, curve: Curves.linear),
      ),
    );
  }

  ///进球动画
  void setAnimation0() {
    setBallAnimationCtrl(1000);
    int type = random.nextInt(2);
    double x = random.nextDouble() * (type == 0 ? 0.1 : -0.1);
    positionAnimation = bllAnimationCtrl.drive(
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
            end: const Offset(0, -0.5),
          ).chain(CurveTween(curve: Curves.easeInCirc)),
          weight: 50.0, // 占总动画时间的 50%
        ),
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset(x, -0.5),
            end: const Offset(0, -0.3),
          ).chain(CurveTween(curve: Curves.decelerate)),
          weight: 20.0, // 占总动画时间的 50%
        ),
        // 第三阶段：从 (0, -1) 回到 (0, 0)，时间占 20%
        // TweenSequenceItem(
        //   tween: Tween<Offset>(
        //     begin: const Offset(0, -0.5),
        //     end: const Offset(0, -0.3),
        //   ).chain(CurveTween(curve: Curves.bounceOut)), // 下落时带有弹性效果
        //   weight: 30.0, // 占总动画时间的 20%
        // ),
      ]),
    );
    // 控制篮球大小变化的动画，变小后保持不变
    scaleAnimation = bllAnimationCtrl.drive(
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
        // TweenSequenceItem(
        //   tween: Tween<double>(
        //     begin: 0.35,
        //     end: 0.4, // 这里保持不变，或者根据需要修改
        //   ).chain(CurveTween(curve: Curves.bounceOut)), // 下落时保持原大小或弹性变化
        //   weight: 20.0, // 第三阶段占 20% 的时间
        // ),
      ]),
    );

    // 监听动画进度
    setAnimationListen(0, 0.4);
  }

  ///进球动画
  void setAnimation1() {
    setBallAnimationCtrl(1200);
    int type = random.nextInt(2);
    // double x = random.nextDouble() * ();
    double x = type == 0 ? 0.1 : -0.1;
    positionAnimation = bllAnimationCtrl.drive(
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
          weight: 5.0, //
        ),
        // 弹跳
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: Offset(-x, -0.78),
            end: Offset(x, -0.78),
          ).chain(CurveTween(curve: Curves.bounceOut)),
          weight: 5.0, //
        ),
        // 下落
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, -0.78),
            end: const Offset(0, -0.2),
          ).chain(CurveTween(curve: Curves.easeInCirc)),
          weight: 50.0, // 占总动画时间的 50%
        ),
        // 第三阶段：从 (0, -1) 回到 (0, 0)，时间占 20%
        // TweenSequenceItem(
        //   tween: Tween<Offset>(
        //     begin: const Offset(0, -0.5),
        //     end: const Offset(0, -0.3),
        //   ).chain(CurveTween(curve: Curves.bounceOut)), // 下落时带有弹性效果
        //   weight: 20.0, // 占总动画时间的 20%
        // ),
      ]),
    );

    // 控制篮球大小变化的动画，变小后保持不变
    scaleAnimation = bllAnimationCtrl.drive(
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
    setBallAnimationCtrl(1500);
    // int d = random.nextInt(2);
    // double x = random.nextDouble() * ();
    double x = 0.2, x1 = x + 0.8, x2 = x1 + 2;
    positionAnimation = bllAnimationCtrl.drive(
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
        // TweenSequenceItem(
        //   tween: Tween<Offset>(
        //     begin: Offset(x2, -0.4),
        //     end: Offset(x2, -0.2),
        //   ).chain(CurveTween(curve: Curves.bounceOut)), // 下落时带有弹性效果
        //   weight: 20.0, // 占总动画时间的 20%
        // ),
      ]),
    );

    // 控制篮球大小变化的动画，变小后保持不变
    scaleAnimation = bllAnimationCtrl.drive(
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
    setBallAnimationCtrl(1500);
    int type = random.nextBool() ? 1 : -1;
    // double x = random.nextDouble() * ();
    double x = -0.1 * type, x1 = (x + 0.5) * type, x2 = (x + 2.5) * type;
    positionAnimation = bllAnimationCtrl.drive(
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
        // TweenSequenceItem(
        //   tween: Tween<Offset>(
        //     begin: Offset(x2, -0.5),
        //     end: Offset(x2, -0.3),
        //   ).chain(CurveTween(curve: Curves.bounceOut)), // 下落时带有弹性效果
        //   weight: 30.0, // 占总动画时间的 20%
        // ),
        // ..._bounceList(30, x2)
      ]),
    );

    // 控制篮球大小变化的动画，变小后保持不变
    scaleAnimation = bllAnimationCtrl.drive(
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
    bllAnimationCtrl.addListener(() {
      if (bllAnimationCtrl.value <= progress) {
        isAscending.value = true; // 上升阶段
      } else {
        isAscending.value = false; // 下降阶段
      }

      if (bllAnimationCtrl.status.isCompleted) {
        if (type <= 1) {
          slotAnimation();
        } else {
          isShot.value = false;
          bllAnimationCtrl.reset(); // 投篮完成后重置篮球位置
          // swiperControl.startAutoplay();
        }
      }
    });
  }

  // void setScaleAnimation() {

  // }

  ///开始老虎机动画
  void slotAnimation() {
    // if (rewardList.isEmpty) return;
    // List<int> props = rewardList[Random().nextInt(rewardList.length)].propOrder;
    currentAward = [0, 0, 0];
    List<int> props = trainingInfo.propArray;
    if (props.isEmpty) return;
    Future.delayed(const Duration(milliseconds: 200), () {
      currentAward[0] = props[0];
      update(["slot"]);
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      currentAward[1] = props[1];
      update(["slot"]);
    });
    Future.delayed(const Duration(milliseconds: 1000), () {
      currentAward[2] = props[2];
      update(["slot"]);
      if (currentAward[0] == currentAward[1]) {
        _flashCard(0);
      } else {
        awardFlyAnimation();
      }
    });
  }

  ///奖励飞跃动画
  ///102:钱
  ///301:钱
  ///302:中钱
  ///303:状态
  ///304:Buff
  ///305:任务
  ///306:球
  void awardFlyAnimation() async {
    Map<int, int> propMap = countProp();
    if (propMap[304]! > 0) isShowBuff.value = true;
    if (propMap[304]! > 1) isShowRipple.value = true;
    if (propMap[305]! > 0) isShowProp.value = true;
    if (propMap[306]! > 0) isShowBall.value = true;
    await Future.delayed(const Duration(milliseconds: 300), () {
      isShowRipple.value = false;
      if (propMap[301]! > 0 || propMap[302]! > 0 || propMap[102]! > 0) {
        updateMoney();
        moneyCtrl.forward().then((v) {
          moneyCtrl.reset();
        });
      }
      flyCtrl.forward().then((v) {
        isShowBuff.value = false;
        isShowProp.value = false;
        isShowBall.value = false;
        Future.delayed(const Duration(seconds: 1), () {
          showText.value = "TRAINING";
        });
        //更新界面
        flyCtrl.reset();
        isShot.value = false;
        bllAnimationCtrl.reset();
        ballNum.value = trainingInfo.prop.num;
        update(["training_page"]);
      });
    });
  }

  void updateMoney() {
    for (var e in trainingInfo.award) {
      for (var element
          in HomeController.to.userEntiry.teamLoginInfo!.teamPropList!) {
        if ((e.id == 102 && element.propId == 102) ||
            (e.id == 103 && element.propId == 103)) {
          element.num = element.num! + e.num;
          showText.value = "Cash +${e.num}";
        }
      }
    }
    HomeController.to.update(["userInfo"]);
  }

  Map<int, int> countProp() {
    // 初始化所有可能的键，并设置它们的初始值为 0
    Map<int, int> map = {
      102: 0,
      301: 0,
      302: 0,
      303: 0,
      304: 0,
      305: 0,
      306: 0,
    };
    for (TrainingInfoAward award in trainingInfo.award) {
      if (award.num > 0) {
        map[award.id] = (map[award.id] ?? 0) + 1;
      }
    }

    // for (int i in trainingInfo.propArray) {
    //   map[i] = (map[i] ?? 0) + 1;
    // }

    return map;
  }

  // int countProp(int num) {
  // 统计列表中每个数字的出现次数
  // Map<int, int> occurrences = {};
  // for (int num in trainingInfo.propArray) {
  //   if (occurrences.containsKey(num)) {
  //     occurrences[num] = (occurrences[num] ?? 0) + 1;
  //   } else {
  //     occurrences[num] = 1;
  //   }
  // }
  // return occurrences;
  // int count=0;
  // for (int e in trainingInfo.propArray) {
  //   if(num==e){
  //     count++;
  //   }
  // }
  // return count;

  // }

  void updateCard(int index, List<int> props) {
    currentAward[index] = props[index];
    update(["slot"]);
  }

  void _flashCard(int count) {
    if (count >= 6) {
      awardFlyAnimation();
      return; // 闪烁5次后停止
    }

    showThirdCard.value = !showThirdCard.value;
    update(["slot"]);
    Future.delayed(const Duration(milliseconds: 100), () {
      _flashCard(count + 1);
    });
  }

  ///气泡提示
  void showBubles() {
    if (isShowBuble.value) return;
    isShowBuble.value = true;
    Future.delayed(const Duration(milliseconds: 2000), () {
      isShowBuble.value = false;
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

class MoneyItem {
  final int index;
  double x;
  double y;
  Widget widget;

  MoneyItem()
      : index = Random().nextInt(20),
        x = Random().nextDouble() * 300.w,
        y = Random().nextDouble() * -250.h,
        widget = Image.asset(
          Assets.uiBgMoneyPng,
          width: 50,
          fit: BoxFit.fitWidth,
        );
}

List<TweenSequenceItem<Offset>> _bounceList(double weight, double x) {
  return [
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(x, -0.3), // 初始位置
        end: Offset(x, -0.45), // 到达下落终点
      ).chain(CurveTween(curve: Cubic(0.42, 0.0, 1.0, 1.0))), // 加速下落
      weight: (0.3 * weight), // 占总时间的 40%
    ),
    //     TweenSequenceItem(
    //   tween: BezierOffsetTween(
    //     begin: Offset(x, -0.45),
    //     end: Offset(x + 0.6, -0.3),
    //     controlPoint: Offset(x + 0.3, -0.35), // 第一次弹起的高度
    //   ).chain(CurveTween(curve: Curves.easeOut)), // 弹起时减速
    //   weight: (0.3 * weight), // 占总时间的 20%
    // ),
    // 第二阶段：第一次弹起（高弹）
    // TweenSequenceItem(
    //   tween: Tween<Offset>(
    //     begin: Offset(x, -0.45),
    //     end: Offset(x, -0.3), // 第一次弹起的高度
    //   ).chain(CurveTween(curve: Curves.easeOut)), // 弹起时减速
    //   weight: (0.3 * weight), // 占总时间的 20%
    // ),
    // 第三阶段：第二次弹起（高度较低）
    // TweenSequenceItem(
    //   tween: Tween<Offset>(
    //     begin: Offset(x, -0.3),
    //     end: Offset(x, -0.4), // 弹回接近终点
    //   ).chain(CurveTween(curve: Curves.easeInOut)), // 缓和过渡
    //   weight: (0.3 * weight), // 占总时间的 20%
    // ),
    // // 第四阶段：小幅度的余震弹跳
    // TweenSequenceItem(
    //   tween: Tween<Offset>(
    //     begin: Offset(x, -0.4),
    //     end: Offset(x, -0.3), // 最终停止的位置
    //   ).chain(CurveTween(curve: Curves.easeOut)), // 最后弹回减速
    //   weight: (0.3 * weight), // 占总时间的 20%
    // ),
  ];
}

// TweenSequence<Offset> _customBounceSequence(double xPosition) {
//   return TweenSequence<Offset>([
//     // 第一阶段：快速下落到较低位置
//     TweenSequenceItem(
//       tween: Tween<Offset>(
//         begin: Offset(xPosition, -0.5), // 初始位置
//         end: Offset(xPosition, 0.3), // 到达下落终点
//       ).chain(CurveTween(curve: Curves.easeIn)), // 加速下落
//       weight: 12, // 占总时间的 40%
//     ),
//     // 第二阶段：第一次弹起（高弹）
//     TweenSequenceItem(
//       tween: Tween<Offset>(
//         begin: Offset(xPosition, 0.3),
//         end: Offset(xPosition, -0.2), // 第一次弹起的高度
//       ).chain(CurveTween(curve: Curves.easeOut)), // 弹起时减速
//       weight: 6, // 占总时间的 20%
//     ),
//     // 第三阶段：第二次弹起（高度较低）
//     TweenSequenceItem(
//       tween: Tween<Offset>(
//         begin: Offset(xPosition, -0.2),
//         end: Offset(xPosition, 0.1), // 弹回接近终点
//       ).chain(CurveTween(curve: Curves.easeInOut)), // 缓和过渡
//       weight: 6, // 占总时间的 20%
//     ),
//     // 第四阶段：小幅度的余震弹跳
//     TweenSequenceItem(
//       tween: Tween<Offset>(
//         begin: Offset(xPosition, 0.1),
//         end: Offset(xPosition, 0), // 最终停止的位置
//       ).chain(CurveTween(curve: Curves.easeOut)), // 最后弹回减速
//       weight: 6, // 占总时间的 20%
//     ),
//   ]);
// }

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
