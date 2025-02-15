import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/tatics_combine_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/train_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/train_task_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/utils/click_feed_back.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/top_toast_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/index.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/card_rule_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_utils.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tatic_match.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_award_dialog.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/constant/getx_builder_ids.dart';

///1:战术(buff)
///2:状态
///3:道具
///4:篮球
///5:钞票
class TrainingController extends GetxController
    with GetTickerProviderStateMixin {
  final random = Random();
  RxBool isPlaying = false.obs;
  // RxInt currentIndex = 0.obs;
  var showBall = false.obs;
  var showPlayer = false.obs;
  var showStatus = false.obs;
  var showCash = false.obs;
  var caShScale = false.obs;
  var showBuff = false.obs;
  RxInt cash = 0.obs;
  var showProp = false.obs;
  bool canChoose = false;

  TrainingInfoEntity trainingInfo = TrainingInfoEntity();
  // List<TeamPlayerInfoEntity> playerList = [];
  List<TrainTaskEntity> trainTaskList = [];
  TrainDefineEntity trainDefine = TrainDefineEntity();
  RxInt ballNum = 0.obs;
  RxString recoverTimeStr = "".obs;
  List<RxBool> slotCard = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs
  ];
  List<double> offsetList = [];
  final List<ScrollController> scrollerCtrlList =
      List.generate(6, (_) => ScrollController());

  List<AnimationController> slotsAnimlList = [];
  List<Animation<double>> sizeAnimations = [];
  List<Animation<double>> scaleAnimations = [];
  int awardLength = 3;
  List<RxBool> isAwards = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs
  ];

  List<RxBool> showBoxList = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs
  ];

  List<RxBool> isShowColor = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs
  ];
  late AnimationController colorAnimatedCtrl;
  late Animation<double> colorAnimation;

  final List<int> propList = [1, 2, 3, 4, 5];

  // final List<int> statusList = [106, 105, 104, 103, 102, 101];
  final List<int> statusList = [101, 102, 103, 104, 105, 106];

  //球员滚动
  Timer? _timer;
  late Timer _timer1;
  late ScrollController playerScollCtrl;
  List<ScrollController> statusScollerList = [];
  int playerIdx = 0;
  var showPlayerBox = false.obs;
  // AnimationController showBoxAnimationCtrl;
  // Animation<double>
  bool playerScrollerEnd = false;
  RxInt currentPlayerIndex = 3.obs;
  List<TeamPlayerInfoEntity> playerList = [];

  ///战术卡牌
  RxBool showChooseDialog = false.obs;
  // RxBool isChange = false.obs;
  int selectTacticId = 0;
  int changeTacticId = 0;
  List<TrainingInfoBuff> tacticChooseList = [];
  // late AnimationController shakeController;
  // late Animation<double> shakeAnimation;
  //卡牌动画
  // List<AnimationController> tacAnimlList = [];
  // List<Animation<double>> tacSizeAnimations = [];
  // List<Animation<double>> tacScaleAnimations = [];
  // List<Animation<double>> tacPosAnimations = [];

  ///战术牌型动画
  // late AnimationController tacticAnimCtrl;
  late Animation<double> tacticExpAnimated;
  late Animation<double> tacticScaleAnimated;
  // late Animation<Offset> tacticPosAnimated;
  late Animation<double> widthAniamtion;
  String tacticType = "";
  RxBool showTacticColor = false.obs;
  List<TaticsCombineEntity> buffValueConfigList = [];
  RxBool tacticFly = false.obs;

  //任务
  String awardIcon = "";
  RxInt taskValue = 0.obs;
  int currentTaskNeed = 10;
  int currentLevel = 1;
  RxDouble taskProgress = 0.0.obs;
  RxString taskCountDownString = "".obs;
  late DateTime refreshTime = DateTime.now();
  //奖励飞行动画
  late AnimationController flyAnimationCtrl;
  late Animation<double> flyAnimation;

  //箭头动画
  late AnimationController arrowAnimCtrl;
  late Animation<double> arrowAnimated;
  Duration currentDuration = 100.milliseconds;

  List<Offset> offsets = [
    Offset(30.w, 114.w),
    Offset(40.w, 102.w),
    Offset(53.w, 93.w),
    Offset(69.w, 90.w),
    Offset(87.w, 91.w)
  ];
  List<double> angles = [-40.23, -23.23, -6.81, 10.76, 23.46];

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    playerScollCtrl = ScrollController();
    slotsAnimlList = List.generate(6, (_) {
      return AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      );
    });
    sizeAnimations = List.generate(6, (index) {
      return TweenSequence([
        TweenSequenceItem<double>(tween: Tween(begin: 1, end: 0.9), weight: 1),
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.9, end: 0.9), weight: 40),
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.9, end: 0.8), weight: 10),
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.8, end: 1.0), weight: 10),
        TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1.2), weight: 10),
        TweenSequenceItem<double>(
            tween: Tween(begin: 1.2, end: 1.0), weight: 10),
      ]).animate(CurvedAnimation(
          parent: slotsAnimlList[index], curve: Curves.easeInOut));
    });
    scaleAnimations = List.generate(6, (index) {
      return TweenSequence([
        TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1), weight: 60),
        TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1.2), weight: 10),
        TweenSequenceItem<double>(tween: Tween(begin: 1.2, end: 1), weight: 10),
      ]).animate(
          CurvedAnimation(parent: slotsAnimlList[index], curve: Curves.linear));
    });

    //飞行
    flyAnimationCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    flyAnimation = Tween<double>(begin: 0, end: 1).animate(flyAnimationCtrl);

    // shakeController = AnimationController(
    //   duration: const Duration(milliseconds: 200),
    //   vsync: this,
    // );
    // shakeAnimation = TweenSequence([
    //   TweenSequenceItem<double>(tween: Tween(begin: 0, end: -0.01), weight: 1),
    //   TweenSequenceItem<double>(tween: Tween(begin: -0.01, end: 0), weight: 1),
    //   TweenSequenceItem<double>(tween: Tween(begin: 0, end: 0.01), weight: 1),
    // ]).animate(
    //   CurvedAnimation(
    //     parent: shakeController,
    //     curve: Curves.linear,
    //   ),
    // )..addStatusListener((status) {
    //     if (status == AnimationStatus.completed) {
    //       shakeController.reverse();
    //     } else if (status == AnimationStatus.dismissed) {
    //       shakeController.forward();
    //     }
    //   });

    colorAnimatedCtrl = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    colorAnimation = Tween<double>(begin: 0, end: 1).animate(colorAnimatedCtrl);

    arrowAnimCtrl = AnimationController(
      duration: currentDuration,
      vsync: this,
    );

    arrowAnimated = Tween<double>(begin: 0.0, end: 10).animate(arrowAnimCtrl)
      ..addListener(() {
        if (arrowAnimated.value >= 10) {
          arrowAnimCtrl.reverse();
        } else if (arrowAnimated.value <= 0.0) {
          arrowAnimCtrl.forward();
        }
      })
      ..addStatusListener((status) {
        // Log.d("status:$status");
        if (status == AnimationStatus.forward ||
            status == AnimationStatus.reverse) {
          // 每次动画完成或结束时，增加持续时间
          currentDuration += 25.milliseconds; // 可以根据需要调整增加的毫秒数
          arrowAnimCtrl.duration = currentDuration;
        }
      });

    //战术牌型
    // tacticAnimCtrl = AnimationController(
    //   duration: const Duration(milliseconds: 2000),
    //   vsync: this,
    // );
    // tacticExpAnimated = TweenSequence<double>([
    //   TweenSequenceItem<double>(tween: Tween(begin: 0, end: 0), weight: 2),
    //   TweenSequenceItem<double>(tween: Tween(begin: 0, end: 0.3), weight: 2),
    //   TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1), weight: 12),
    // ]).animate(tacticAnimCtrl);
    // tacticScaleAnimated = TweenSequence([
    //   TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1.5), weight: 2),
    //   TweenSequenceItem<double>(tween: Tween(begin: 1.5, end: 1), weight: 2),
    //   TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1), weight: 12),
    // ]).animate(CurvedAnimation(parent: tacticAnimCtrl, curve: Curves.linear));
    // //战术类型文字
    // tacticPosAnimated = TweenSequence<Offset>([
    //   TweenSequenceItem<Offset>(
    //       tween: Tween(begin: const Offset(0, 0), end: const Offset(0, 0)),
    //       weight: 3),
    //   TweenSequenceItem<Offset>(
    //       tween: Tween(begin: const Offset(0, 60), end: const Offset(0, 15)),
    //       weight: 3),
    //   TweenSequenceItem<Offset>(
    //       tween: Tween(begin: const Offset(0, 15), end: const Offset(0, 15)),
    //       weight: 10),
    //   TweenSequenceItem<Offset>(
    //       tween: Tween(begin: const Offset(0, 15), end: const Offset(0, 15)),
    //       weight: 1),
    // ]).animate(tacticAnimCtrl);
    // widthAniamtion = TweenSequence<double>([
    //   TweenSequenceItem<double>(tween: Tween(begin: 0, end: 0), weight: 3),
    //   TweenSequenceItem<double>(tween: Tween(begin: 0, end: 1), weight: 3),
    //   TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1), weight: 10),
    //   TweenSequenceItem<double>(tween: Tween(begin: 1, end: 0), weight: 1),
    // ]).animate(tacticAnimCtrl);
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
    _timer?.cancel();
    _timer1.cancel();
    for (var controller in scrollerCtrlList) {
      controller.dispose();
    }
  }

  Future getData() async {
    await Future.wait([
      // CacheApi.getRewardGroup(),
      TeamApi.getTrainingInfo(),
      // TeamApi.getMyTeamPlayer(teamId),
      TeamApi.getTrainTaskList(),
      TeamApi.getTrainDefine(),
      TeamApi.getTacticCombine(),
      // getPlayerList(),
    ]).then((v) {
      // rewardList = v[0] as List<RewardGroupEntity>;
      trainingInfo = v[0] as TrainingInfoEntity;
      trainTaskList = v[1] as List<TrainTaskEntity>;
      trainDefine = v[2] as TrainDefineEntity;
      buffValueConfigList = v[3] as List<TaticsCombineEntity>;
      ballNum.value = trainingInfo.prop.num;
      // tacticList = trainingInfo.buff;
      updateProp();
      taskValue.value = trainingInfo.training.taskItemCount;
      currentLevel = trainingInfo.training.currentTaskId;
      if (_timer == null) {
        recoverBallCountDown();
      }
      // taskCountDownTime();
      update(["training_page"]);
    }).catchError((v) {
      ErrorUtils.toast(v);
      isPlaying.value = false;
    });
  }

  void updateProp() {
    for (int i = 0; i < trainTaskList.length; i++) {
      if (trainingInfo.training.currentTaskId == trainTaskList[i].taskLevel) {
        currentTaskNeed = trainTaskList[i].taskNeed;
        List<String> award = trainTaskList[i].taskReward.split("_");
        awardIcon = Utils.getSlotIconUrl(award[2]);
      }
    }
  }

  // Future getPlayerList() async {
  //   if (HomeController.to.userEntiry.teamLoginInfo == null) {
  //     await HomeController.to.refreshUserEntity();
  //   }
  //   int teamId = HomeController.to.userEntiry.teamLoginInfo!.team!.teamId ?? 0;
  //   MyTeamEntity teamEntity = await TeamApi.getMyTeamPlayer(teamId);
  //   playerList = teamEntity.teamPlayers;
  // }

  ///获取配置数据计算倒计时
  void recoverBallCountDown() {
    if (trainingInfo.prop.num >= trainDefine.ballMaxNum) {
      _timer?.cancel();
      return;
    }
    int recover = trainDefine.ballRecoverTime;
    DateTime now = DateTime.now();
    DateTime recoverTime =
        DateUtil.getDateTimeByMs(trainingInfo.training.ballRefreshTime)
            .add(Duration(seconds: recover));
    int recoverSeconds = recoverTime.difference(now).inSeconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (v) async {
      recoverSeconds--;

      ///获取回复篮球与当前时间倒计时，转换成mm:ss
      final minutes = recoverSeconds ~/ 60;
      final remainingSeconds = recoverSeconds % 60;
      recoverTimeStr.value =
          '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
      if (recoverSeconds <= 0) {
        _timer?.cancel();
        // 重新获取新的恢复时间进行倒计时
        TeamApi.getTrainingInfo().then((v) {
          trainingInfo.prop = v.prop;
          ballNum.value = trainingInfo.prop.num;
          trainingInfo.training = v.training;
          update(["training_page"]);
          recoverBallCountDown();
        });
      }
    });
  }

  ///任务倒计时
  // void taskCountDownTime() async {
  //   DateTime now = DateTime.now();
  //   refreshTime = now;
  //   DateTime taskRefreshTime =
  //       DateUtil.getDateTimeByMs(trainingInfo.training.taskEndTime);

  //   int taskSeconds = taskRefreshTime.difference(now).inSeconds;
  //   if (trainingInfo.training.todayTaskOver == 1) return;
  //   _timer1 = Timer.periodic(const Duration(seconds: 1), (v) async {
  //     taskSeconds--;
  //     final hours = taskSeconds ~/ 3600;
  //     final minutes = (taskSeconds % 3600) ~/ 60;
  //     final remainingSeconds = taskSeconds % 60;
  //     taskCountDownString.value =
  //         '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  //     if (taskSeconds <= 0) {
  //       if (refreshTime.difference(now).inSeconds < 10) {
  //         return;
  //       }
  //       _timer1.cancel();
  //       // 重新获取新的恢复时间进行倒计时
  //       TeamApi.getTrainingInfo().then((v) {
  //         v.propArray = trainingInfo.propArray;
  //         trainingInfo = v;
  //         update(["training_page"]);
  //         recoverBallCountDown();
  //       });
  //     }
  //   });
  // }

  void buyTrainingBall(int count) {
    TeamApi.buyTrainingBall(count).then((v) {
      ballNum.value = v;
      // update(["training_page"]);
    });
  }

  void chooseTactic(BuildContext context, TrainingInfoBuff e) async {
    e.isSelect.value = true;
    selectTacticId = e.id;
    canChoose = false;
    if (selectTacticId == 0) return;
    Get.back();
    tacticFly.value = true;
    showBuff.value = true;
    for (int i = 0; i < tacticChooseList.length; i++) {
      if (selectTacticId == tacticChooseList[i].id) {
        int length = min(trainingInfo.buff.length, 4);
        tacticChooseList[i].scale = (35.w + length * 2.5.w) / 74.w;
        tacticChooseList[i].offset.value = offsets[length];
        tacticChooseList[i].rotate.value = angles[length] / 360;
      }
    }

    // update(["training_page"]);
    TeamApi.chooseTactic(selectTacticId, replaceTacticId: changeTacticId)
        .then((v) async {
      changeTacticId = 0;

      await Future.delayed(const Duration(milliseconds: 200));
      trainingInfo = await TeamApi.getTrainingInfo();

      await chooseEnd(context);
      trainingInfo.buff = v;
      update(["training_page"]);

      await Future.delayed(const Duration(milliseconds: 200));
      String newTacticType = TacticUtils.checkTacticMatch(trainingInfo.buff);
      // var list = TacticUtils.matchedIndices;
      if (ObjectUtil.isNotEmpty(newTacticType) && tacticType != newTacticType) {
        tacticType = newTacticType;
        await Future.delayed(const Duration(milliseconds: 200)).then((v) async {
          await showTopToastDialog(child: const TacticMatch());
        });
      }
      tacticType = newTacticType;

      // Future.delayed(const Duration(milliseconds: 300), () async {
      //   showTacticColor.value = true;
      //   await Future.delayed(const Duration(milliseconds: 1500));
      //   showTacticColor.value = false;
      // });
      ///取战斗
      if (trainingInfo.buff.length == 5) {
        TeamIndexController ctrl = Get.find();
        ctrl.matchBattle();
      }
    }).catchError((e) {
      Log.e("网络错误");
      // chooseEnd(context, type);
    });
  }

  Future chooseEnd(BuildContext context) async {
    selectTacticId = 0;
    changeTacticId = 0;

    await Future.delayed(const Duration(milliseconds: 300));
    showBuff.value = false;
    tacticFly.value = false;
    isPlaying.value = false;
    canChoose = true;
    // isChange.value = false;

    // for (var element in tacticChooseList) {
    //   element.isOpen.value = false;
    //   initTacticPosition();
    // }
    // tacticChooseList.clear();
    initTacticPosition();
  }

  void chooseFinish() {
    selectTacticId = 0;
    changeTacticId = 0;
    showBuff.value = false;
    isPlaying.value = false;
    for (var element in tacticChooseList) {
      element.isOpen.value = false;
    }
    update(["training_page"]);
  }

  void initSlot() {
    canChoose = false;
    isPlaying.value = true;
    cash.value = 0;
    for (var e in showBoxList) {
      e.value = false;
    }
    // showBuff.value = false;
  }

  void startSlot() async {
    if (ballNum.value > 0) {
      ballNum.value = ballNum.value - 1;
    }
    // else {
    //   int cost = getBallCost();
    //   bool result = HomeController.to.updateTeamProp(-cost);
    //   if (!result) return;
    // }
    if (isPlaying.value) return;
    initSlot();
    final teamIndexCtrl = Get.find<TeamIndexController>();
    teamIndexCtrl.scroToSlot();
    playerList = Get.find<TeamController>().myTeamEntity.teamPlayers;
    playerIdx = random.nextInt(playerList.length);

    await TeamApi.playerTraining(playerList[playerIdx].uuid).then((v) {
      if (ballNum.value == 0) {
        HomeController.to.updateTeamProp();
      }
      trainingInfo = v;
      trainingInfo.propArray.shuffle();
      recoverBallCountDown();
      startScroller();
    }).catchError((v) {
      isPlaying.value = false;
      // EasyLoading.showToast(v.message.toString());
    });
  }

  void startScroller() {
    // update(["training_page"]);
    for (int i = 0; i < slotCard.length; i++) {
      slotCard[i].value = false;
      scrollerCtrlList[i].jumpTo(0);
      slotsAnimlList[i].reset();
    }
    offsetList.clear();
    SoundServices.to.playSound(Assets.soundWaitingAward, loop: true);
    for (int i = 0; i < scrollerCtrlList.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        _scrollColumn(i);
      });
    }
  }

  void _scrollColumn(int index) async {
    slotCard[index].value = true;
    if (trainingInfo.propArray.isEmpty) return;
    int propIndex = propList.indexOf(trainingInfo.propArray[index]);

    ///在获奖的结果基础上旋转三周
    double offset = 68.w * (propIndex + propList.length * 3);
    offsetList.add(offset);
    slotsAnimlList[index].forward();
    await scrollerCtrlList[index].animateTo(offset,
        duration: const Duration(milliseconds: 600),
        curve: const Cubic(0.27, 0.59, 0.19, 1.1));

    if (index == 5) {
      ///最后一个旋转结束
      showAward();
      SoundServices.to.stopAllSounds();
    }
  }

  ///奖励表达
  Future showAward() async {
    // tacticType = TacticUtils.checkTacticMatch(tacticList);
    isPlaying.value = true;
    canChoose = false;
    int cashNum = 0;
    List<int> awads = [];
    for (var e in trainingInfo.award) {
      ///槽位显示中奖放大动画
      awardLength = 0;
      for (int i = 0; i < trainingInfo.propArray.length; i++) {
        if (trainingInfo.propArray[i] == e.id) {
          awardLength++;
          isAwards[i].value = true;
          showBoxList[i].value = true;
          //槽位恢复
          Future.delayed(const Duration(milliseconds: 200), () async {
            isAwards[i].value = false;
            isShowColor[i].value = true;
            colorAnimatedCtrl.forward();
            await Future.delayed(const Duration(milliseconds: 150));
            isShowColor[i].value = false;
            colorAnimatedCtrl.reset();
          });
        }
      }
      if (e.id == 5) {
        cashNum = e.num;
      }
      awads.add(e.id);
    }

    await Future.delayed(const Duration(milliseconds: 300));
    // for (var element in scrollerCtrlList) {
    //   Log.d("slot 当前位置 ${element.offset}");
    // }

    ///2:状态
    if (awads.contains(2)) {
      showAwardDialog();
      SoundServices.to.playSound(
          awardLength > 4 ? Assets.soundStatusBig : Assets.soundStatusSmall);
      await startPlayerScroll(0);
      //更新球员状态
      Get.find<TeamController>().updateTeamInfo();
      update(["training_page"]);

      await Future.delayed(const Duration(milliseconds: 500));
    }

    ///3:道具自动加
    // taskValue.value = trainingInfo.training.taskItemCount;
    if (awads.contains(3)) {
      //如果升级，先满填满
      if (trainingInfo.training.currentTaskId > currentLevel) {
        // currentLevel = trainingInfo.training.currentTaskId;
        taskValue.value = currentTaskNeed;
        //箱子放大动画
        await Future.delayed(const Duration(milliseconds: 300));
        showProp.value = true;
        await Future.delayed(const Duration(milliseconds: 300));
        showProp.value = false;
        taskValue.value = 0;
        await Future.delayed(const Duration(milliseconds: 300));
      }

      //更新道具
      updateProp();
      taskValue.value = trainingInfo.training.taskItemCount;
      update(["training_page"]);

      ///获取奖励值，获奖动画
      int cashs = 0;
      if (trainingInfo.training.currentTaskId > currentLevel) {
        await Future.delayed(const Duration(milliseconds: 300));

        var item =
            trainTaskList.where((e) => e.taskLevel == currentLevel).first;
        cashs = item.propNum;
        await showCashAward(cashs);
        currentLevel = trainingInfo.training.currentTaskId;
        Get.back();
        // HomeController.to.updateMoney();
      }
    }

    ///4:篮球
    if (awads.contains(4)) {
      showBall.value = true;
      // ballNum.value = trainingInfo.prop.num;
      await Future.delayed(const Duration(milliseconds: 500), () async {
        showBall.value = false;
        await Future.delayed(const Duration(milliseconds: 200));
        ballNum.value = trainingInfo.prop.num;
      });
    }

    ///5:钞票
    if (awads.contains(5)) {
      await showCashAward(cashNum);
    }

    ///战术 buff
    if (awads.contains(1)) {
      showAwardDialog();
      tacticChooseList.clear();
      tacticChooseList = List.from(trainingInfo.chooseBuffs);
      //初始化卡牌的位置和朝向
      initTacticPosition();

      update(["training_page"]);
      showBuff.value = true;
      await Future.delayed(const Duration(milliseconds: 300));
      for (var element in tacticChooseList) {
        await Future.delayed(const Duration(milliseconds: 100));
        element.isOpen.value = true;
      }
      updateScroller();
      Future.delayed(const Duration(milliseconds: 500), () {
        canChoose = true;
      });
    }

    if (!awads.contains(1)) {
      isPlaying.value = false;
    }
    // for (var element in scrollerCtrlList) {
    //   Log.d("slot 当前位置 ${element.offset}");
    // }

    //暂时不知道重置到开始位置的原因，先重新变更成中奖位置
    updateScroller();

    Future.delayed(const Duration(milliseconds: 10), () {
      updateScroller();
    });

    // for (var element in slotsAnimlList) {
    //   element.reset();
    // }
    // getPlayerList();
    // update(["training_page"]);
    if (awads.contains(2) || awads.contains(5)) {
      Get.back();
    }
  }

  void showAwardDialog() {
    showDialog(
        barrierDismissible: false,
        context: Get.context!,
        barrierColor: Colors.black.withOpacity(0.6),
        builder: (context) {
          return const TrainingAwardDialog();
        });
  }

  void updateScroller() {
    if (scrollerCtrlList.where((e) => e.offset == 0.0).length == 6) {
      if (offsetList.isNotEmpty) {
        for (int i = 0; i < scrollerCtrlList.length; i++) {
          scrollerCtrlList[i].jumpTo(offsetList[i]);
        }
      }
    }
  }

  void initTacticPosition() {
    double spacing = 20.w;
    for (int i = 0; i < tacticChooseList.length; i++) {
      var item = tacticChooseList[i];
      item.isOpen.value = false;
      double x = (375.w -
                  (tacticChooseList.length * 74.w +
                      (tacticChooseList.length - 1) * spacing)) /
              2 +
          i * (74.w + spacing);
      item.offset.value = Offset(x, 250.w);
      item.rotate.value = 0;
      item.scale = 1;
      // item.isOpen.value = false;
    }
  }

  Future showCashAward(int cashs) async {
    ///5:钞票
    showAwardDialog();
    await Future.delayed(const Duration(milliseconds: 300));
    showCash.value = true;
    cash.value = cashs;
    caShScale.value = true;
    updateScroller();
    SoundServices.to.playSound(
        awardLength > 4 ? Assets.soundMoneyBig : Assets.soundMoneySmall);
    Future.delayed(const Duration(milliseconds: 1000), () async {
      caShScale.value = false;
    });
    await Future.delayed(const Duration(milliseconds: 1500), () async {
      showCash.value = false;
      HomeController.to.updateMoney();
      await Future.delayed(const Duration(milliseconds: 300));
    });
  }

  ///球员滚动
  Future startPlayerScroll(int count) async {
    ///状态控制

    await Future.delayed(const Duration(milliseconds: 150));
    var teamPlayers =
        Get.find<TeamController>().myTeamEntity.teamPlayers.toList();
    trainingInfo.selectPlayer.value =
        trainingInfo.statusReplyPlayers.map((e) => e.playerId).toList();
    playerList = List.from(teamPlayers)
      ..sort((a, b) {
        bool aInStatus = trainingInfo.selectPlayer.contains(a.playerId);
        bool bInStatus = trainingInfo.selectPlayer.contains(b.playerId);
        if (aInStatus && !bInStatus) {
          return -1;
        } else if (!aInStatus && bInStatus) {
          return 1;
        } else {
          return 0; // 或者根据其他属性排序
        }
        // int indexA = trainingInfo.selectPlayer.indexOf(a.playerId);
        // int indexB = trainingInfo.selectPlayer.indexOf(b.playerId);
        // if (indexA >= 0 && indexB >= 0) {
        //   return indexA.compareTo(indexB);
        // } else if (indexA < 0 && indexB < 0) {
        //   return 2;
        // } else {
        //   return indexA < 0 ? 3 : indexA;
        // }
      });
    var tempList = playerList.map((e) => e.playerId).toList();
    trainingInfo.selectPlayer.sort((a, b) {
      return tempList.indexOf(a).compareTo(tempList.indexOf(b));
    });
    statusScollerList.clear();
    for (int i = 0; i < trainingInfo.statusReplyPlayers.length; i++) {
      statusScollerList.add(ScrollController());
    }
    showPlayerBox.value = true;
    await Future.delayed(const Duration(milliseconds: 300));
    showPlayer.value = true;
    currentDuration = 150.milliseconds;
    arrowAnimCtrl.duration = currentDuration;
    // arrowAnimCtrl.reset();
    arrowAnimCtrl.forward();
    update(["playerList"]);
    if (playerScollCtrl.hasClients) {
      playerScollCtrl.jumpTo(0);

      double isTwo = (trainingInfo.statusReplyPlayers.length - 1) * 32.5.w;
      // isTwo = 0;
      double offset = (playerList.length * 3 - 3) * 65.w + isTwo;
      playerScollCtrl.addListener(() {
        currentPlayerIndex.value = (playerScollCtrl.offset / 65.w).round() + 3;
      });
      await playerScollCtrl
          .animateTo(
        playerScollCtrl.offset + offset,
        duration: const Duration(milliseconds: 2000),
        // curve: Curves.easeInOut,
        curve: const Cubic(0.27, 0.59, 0.19, 1.07),
      )
          .then((v) async {
        await Future.delayed(const Duration(milliseconds: 100));

        playerScrollerEnd = true;
        update(["playerSelectBox"]);
        await Future.delayed(const Duration(milliseconds: 300));
        update(["playerList"]);

        ///找到跳转到原来状态
        await Future.delayed(const Duration(milliseconds: 200));
        List<int> oldList = [];
        for (int i = 0; i < statusScollerList.length; i++) {
          int oldIndex = 0;
          for (var player in playerList) {
            if (trainingInfo.statusReplyPlayers[i].uuid == player.uuid) {
              oldIndex = statusList.indexOf(player.playerStatus);
            }
          }
          oldList.add(oldIndex);
          if (statusScollerList[i].hasClients) {
            statusScollerList[i].jumpTo(oldIndex * 30.w - 3.w);
          }
        }
        showStatus.value = true;
        await Future.delayed(const Duration(milliseconds: 500), () {});
        // update(["playerList"]);
        for (int i = 0; i < statusScollerList.length; i++) {
          statusScroll(i, oldList[i]);
          SoundServices.to.playSound(awardLength > 4
              ? Assets.soundStatsRecoverAll
              : Assets.soundStatsRecoverOne);
        }
        updateScroller();
        await Future.delayed(
            Duration(milliseconds: 500 + statusScollerList.length * 250), () {
          showPlayerBox.value = false;
          showPlayer.value = false;
          playerScrollerEnd = false;
          showStatus.value = false;
          arrowAnimCtrl.reset();
          arrowAnimCtrl.stop();
          updateScroller();
        });
      });
    }
  }

  void colosePlayerAwards() {
    // if (!playerScrollerEnd) return;
    // showPlayerBox.value = false;
    // showPlayer.value = false;
    // playerScrollerEnd = false;
    // showStatus.value = false;
    // isPlaying.value = false;
  }

  void statusScroll(int index, int oldIndex) async {
    if (statusScollerList[index].hasClients) {
      int newIndex = statusList
          .indexOf(trainingInfo.statusReplyPlayers[index].playerStatus);
      double offset = 30.w * (newIndex);
      statusScollerList[index].animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: oldIndex == newIndex
            ? Curves.bounceOut
            : const Cubic(0.27, 0.59, 0.19, 1.0),
        // curve: const Cubic(0.27, 0.59, 0.19, 1.0),
      );
    }
  }

  // void updateMoney() {
  //   for (var e in trainingInfo.award) {
  //     if (e.id == 5) {
  //       for (var element
  //           in HomeController.to.userEntiry.teamLoginInfo!.teamPropList!) {
  //         if (element.propId == 102) {
  //           element.num = element.num! + e.num;
  //         }
  //       }
  //     }
  //   }
  //   HomeController.to.update([GetXBuilderIds.idMoneyAndCoinWidget]);
  // }

  ///计算每个的数量
  void getBuffValue(TrainingInfoBuff buff) {
    int count = 0;
    for (var element in trainingInfo.buff) {
      if (element.color == buff.color) {
        count += element.takeEffectGameCount;
      }
    }
    for (var config in buffValueConfigList) {
      if (config.suit == buff.color) {
        int length = config.suitAdd.length;
        int m = min(length, count);
        buff.buffValue = config.suitAdd[m - 1];
      }
    }
  }

  int getBallCost() {
    if (trainingInfo.training.todayBuyCount >= 0) {
      int length = trainDefine.trainCoinNum.length;
      if (length == 0) return 0;
      int cost = min(length, trainingInfo.training.todayBuyCount);
      return trainDefine.trainCoinNum[cost];
    }
    return 0;
  }

  void cancelTactic() {
    TeamApi.cancelTactic().then((v) async {
      int cashNum = 0;
      if (trainDefine.giveUpTactics.length > awardLength - 1) {
        cashNum = trainDefine.giveUpTactics[awardLength - 1];
      }
      await showCashAward(cashNum);
    });
  }

  TrainTaskEntity getTaskAward() {
    var item =
        trainTaskList.firstWhereOrNull((e) => e.taskLevel == currentLevel);
    return item ?? TrainTaskEntity();
  }

  void showRuleDilaog() {
    BottomTipDialog.showWithSound(
        isScrollControlled: true,
        // barrierColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        context: Get.context!,
        builder: (context) {
          return const VerticalDragBackWidget(child: CardRuleDialog());
        });
  }
}
