import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/battle_animation_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/3/12:06

class BeforeGameController extends GetxController
    with GetTickerProviderStateMixin {
  BeforeGameController(this.context);

  final BuildContext context;

  List<EasyAnimationController> homeAnimationList = [];
  List<EasyAnimationController> awayAnimationList = [];

  Timer? timer;

  late BattleEntity battleEntity;

  List<TrainingInfoBuff> awayTeamBuffList = [];

  var showBorder = false.obs;

  var homeTacticProgress = 50.0.obs;

  var showTacticResult = false.obs;
  var startCountDown = false.obs;

  var onTheEnd = false.obs;
  double width = 0;

  var scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    width = MediaQuery.of(context).size.width;
    _init();
  }

  void _init() {
    battleEntity = Get.find<TeamBattleController>().battleEntity;
    awayTeamBuffList = _getAwayTeamBuff();
    var homeTeamBuff = battleEntity.homeTeamBuff;
    var d = width - (16.w * 2) - (43.w * 5 + 12.w * 4);
    var left = d / 2;
    print('left:$left');

    /// home 动画列表初始化
    for (int index = 0; index < homeTeamBuff.length; index++) {
      var item = homeTeamBuff[index];
      var top = 101.w + 156.w + 44.w + 9.w + 63.w;
      var startY = item.takeEffectGameCount == 1 ? (top + 3.w) : top;
      var easyAnimationController = EasyAnimationController(
          vsync: this,
          begin: Offset(left + (43.w + 12.w) * index, startY),
          end: Offset(13.w + (index * (28.w + 3.w)), 101.w + 162.w),
          duration: const Duration(milliseconds: 300));
      if (index == homeTeamBuff.length - 1) {
        easyAnimationController.controller
            .addStatusListener(lastAnimationStatusListener);
      }
      homeAnimationList.add(easyAnimationController);
    }

    /// away 动画列表初始化
    for (int index = 0; index < awayTeamBuffList.length; index++) {
      var easyAnimationController = EasyAnimationController(
          vsync: this,
          begin: Offset(13.w + (index * (28.w + 3.w)), 101.w + 162.w),
          end: Offset(71.w, 75.w),
          duration: const Duration(milliseconds: 300));
      if (index == awayTeamBuffList.length - 1) {
        easyAnimationController.controller
            .addStatusListener(lastIIAnimationStatusListener);
      }
      awayAnimationList.add(easyAnimationController);
    }
  }

  lastIIAnimationStatusListener(status) {
    if (status == AnimationStatus.completed) {
      print('completed--------');
      Get.find<TeamBattleV2Controller>().changeBuff();
      theEndFunction();
    }
  }

  void theEndFunction() {
    scrollController.animateTo(163.w,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    onTheEnd.value = true;
    showTacticResult.value = false;
    startCountDown.value = true;
  }

  lastAnimationStatusListener(status) {
    if (status == AnimationStatus.completed) {
      /// 开始翻牌
      startTurnAwayTacticCard();
    }
  }

  void startTurnAwayTacticCard() {
    int index = awayTeamBuffList.length - 1;
    timer?.cancel();
    timer = Timer.periodic(const Duration(milliseconds: 300), (t) {
      if(index>=0 && index < awayAnimationList.length) {
        awayTeamBuffList[index].isOpen.value =
        !awayTeamBuffList[index].isOpen.value;

        /// 每次翻牌之后计算百分比
        var homeGrade = getHomeTeamBuff().isEmpty
            ? 0
            : TacticUtils.getTacticTypeGrade(getHomeTeamBuff());
        var awayBuff = awayTeamBuffList.where((e) => e.isOpen.value).toList();
        var awayGrade =
        awayBuff.isEmpty ? 0 : TacticUtils.getTacticTypeGrade(awayBuff);
        if (homeGrade == 0 && awayGrade == 0) {
          homeTacticProgress.value = 50;
        } else {
          homeTacticProgress.value = homeGrade / (homeGrade + awayGrade) * 100;
        }
      }

      index--;
      if (index < 0) {
        t.cancel();

        /// 比完牌之后显示边框
        showBorder.value = true;

        Future.delayed(const Duration(milliseconds: 500),(){
          /// 显示卡牌对比结果
          showTacticResult.value = true;
        });
        /// 延迟开始比赛，同时移动卡牌位置到头像
        Future.delayed(const Duration(seconds: 2), () {
          print('---------dddd--------');
          var homeTeamBuff = battleEntity.homeTeamBuff;
          for (int index = 0; index < homeTeamBuff.length; index++) {
            var easyAnimationController = EasyAnimationController(
                vsync: this,
                begin: Offset(13.w + (index * (28.w + 3.w)), 101.w + 162.w),
                end: Offset(71.w, 75.w),
                duration: const Duration(milliseconds: 300));
            if (index == homeTeamBuff.length - 1 && awayAnimationList.isEmpty) {
              easyAnimationController.controller
                  .addStatusListener(lastIIAnimationStatusListener);
            }
            /// 因为要保留第一次移动的位置，所以还不能清除
            homeAnimationList.insert(index,easyAnimationController);
          }
          update();
          int count = 0;
          timer?.cancel();
          timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
            if (count < homeAnimationList.length) {
              homeAnimationList[count].forward(from: 0);
            }
            if (count < awayAnimationList.length) {
              awayAnimationList[count].forward(from: 0);
            }
            count++;
            if (count >=
                max(homeTeamBuff.length, awayTeamBuffList.length)) {
              t.cancel();
            }
          });
        });
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 100), () {
      startAnimation();
    });
  }

  void startAnimation() {
    if (battleEntity.homeTeamBuff.isEmpty &&
        battleEntity.awayTeamBuff.isEmpty) {
      startCountDown.value = true;
      theEndFunction();
    } else if (battleEntity.homeTeamBuff.isNotEmpty) {
      forward();
    } else {
      startTurnAwayTacticCard();
    }
  }

  reStart() {
    showBorder.value = false;
    showTacticResult.value = false;
    startCountDown.value = false;
    onTheEnd.value = false;
    homeTacticProgress.value = 50;
    for (int i = 0; i < homeAnimationList.length; i++) {
      homeAnimationList[i].reset();
    }
    for (int i = 0; i < awayAnimationList.length; i++) {
      awayAnimationList[i].reset();
      awayTeamBuffList[i].isOpen.value = false;
    }
    startAnimation();
  }

  forward() {
    int count = 0;
    timer?.cancel();
    timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      homeAnimationList[count].forward(from: 0);
      count++;
      if (count >= homeAnimationList.length) {
        t.cancel();
      }
    });
  }

  List<TrainingInfoBuff> getHomeTeamBuff() {
    List<TrainingInfoBuff> list = List.from(battleEntity.homeTeamBuff);
    list.sort((a, b) => a.face.compareTo(b.face));
    return list;
  }

  List<TrainingInfoBuff> _getAwayTeamBuff() {
    List<TrainingInfoBuff> list = List.from(battleEntity.awayTeamBuff);

    /// 因为绘制的时候是从右边往左边绘制，所以这里顺序要倒过来（从大到小）
    list.sort((a, b) => b.face.compareTo(a.face));
    return list;
  }

  bool isHomeWin() {
    var startUpdatedEntity =
        Get.find<TeamBattleController>().pkStartUpdatedEntity;
    var bool = startUpdatedEntity?.pokerWinner == battleEntity.homeTeam.teamId;
    return bool;
  }

  @override
  void dispose() {
    for (int index = 0; index < homeAnimationList.length; index++) {
      homeAnimationList[index].dispose();
    }
    for (int index = 0; index < awayAnimationList.length; index++) {
      awayAnimationList[index].dispose();
    }
    timer?.cancel();
    super.dispose();
  }
}
