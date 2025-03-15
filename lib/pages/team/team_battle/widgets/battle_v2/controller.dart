import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/competition_venue_entity.dart';
import 'package:arm_chair_quaterback/common/entities/game_event_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pk_event_updated_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pk_player_updated_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';
import 'package:arm_chair_quaterback/common/entities/web_socket/web_socket_entity.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/index.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/thrid_lib/flutter_barrage.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/common/widgets/easy_animation_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_leader/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/live_text_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/team_stat/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/win_rate/controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShootHistory {
  // 左边 false 右边 true
  final bool isAway;
  final Offset shootLocation;
  final bool isSuccess;

  ShootHistory(this.isAway, this.shootLocation, this.isSuccess);
}

class TeamBattleV2Controller extends GetxController
    with GetTickerProviderStateMixin, WidgetsBindingObserver {
  TeamBattleV2Controller();

  late BarrageWallController normalBarrageWallController =
      BarrageWallController();
  late BarrageWallController highLightBarrageWallController =
      BarrageWallController();

  late AnimationController shootAnimationController;
  Animation? shootAnimation;
  var shootOffset = Offset(-1000, -1000).obs;
  var shootPathOffsets = <Offset>[].obs;
  var shootPathColor = AppColors.cTransparent;

  // 投篮轨迹点
  Offset start = Offset.zero; // 起点
  Offset end = Offset.zero; // 终点
  Offset peak = Offset.zero; // 随机生成的最高点

  late double a, b, c; // 抛物线参数

  var isSuccess = false;
  var isSecondAnimationRunning = false;

  // 主角投篮位置
  ShootHistory? mainOffset;
  List<ShootHistory> shootHistory = [];

  var isGameOver = false.obs;
  Timer? _timer;

  late StreamSubscription<ResponseMessage> subscription;

  late EasyAnimationController<double> quarterTimeCountDownAnimationController;
  var quarterGameCountDown = 40.0.obs;

  /// 第一节 等于 1
  var quarter = 0.obs;
  Map<String, List<GameEvent>> eventCacheMap = {}; //缓存所有的事件，等待事件引擎调用
  Timer? eventEngine; //事件引擎,根据showTime设置显示时间
  int eventCount = 0;
  Map<String, List<GameEvent>> eventOnScreenMap = {}; //正在播放的事件

  //游戏速度 默认 1
  double gameSpeed = 1;

  /// 是否开启超级加速
  bool superSpeedMan = true;

  List<PkPlayerUpdatedPlayers> homeTeamPlayerList = [];
  List<PkPlayerUpdatedPlayers> awayTeamPlayerList = [];

  late BattleEntity battleEntity;

  ScrollController liveTextScrollController = ScrollController();

  var showBuff = false.obs;

  late WinRateController winRateController;
  late GameLeaderController gameLeaderController;
  late TeamStatsController teamStatsController;

  ///是否收到结算事件，代表比赛是否结束
  bool isPkResultUpdated = false;
  PkResultUpdatedEntity? pkResultUpdatedEntity;

  var isGameStart = false.obs;

  var maybeException = false.obs;

  var liveTextTabIndex = RxInt(-1);

  var shootAnimationDuration = 1200;

  bool? leftRound;

  GameEvent? highLightEvent;

  Timer? normalDanMaKuTimer;

  ///上个时间比分占比(比分随时间占比)
  double lastHomeScoreDiff = 0, lastAwayScoreDiff = 0;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    if (superSpeedMan) {
      gameSpeed = 80;
    }
    WidgetsBinding.instance.addObserver(this);
    battleEntity = Get.find<TeamBattleController>().battleEntity;
    winRateController = Get.put(WinRateController());
    gameLeaderController = Get.put(GameLeaderController());
    teamStatsController = Get.put(TeamStatsController());
    homeTeamPlayerList = battleEntity.homeTeamPlayerList
        .map((e) => PkPlayerUpdatedPlayers.fromJson(e.toJson()))
        .toList();
    awayTeamPlayerList = battleEntity.awayTeamPlayerList
        .map((e) => PkPlayerUpdatedPlayers.fromJson(e.toJson()))
        .toList();
    shootAnimationController = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds: (shootAnimationDuration / gameSpeed).toInt()));
    quarterTimeCountDownAnimationController = EasyAnimationController(
        vsync: this,
        begin: 40,
        end: 0,
        duration: Duration(milliseconds: (40 * 1000 / gameSpeed).toInt()))
      ..controller.addStatusListener(quarterStatusListener)
      ..controller.addListener(quarterListener);

    subscription = WSInstance.stream.listen((result) {
      if (result.serviceId == Api.wsPkPlayerUpdated) {
        ///换人
        ///todo 时间要同步wsPkEventUpdated
        // substitutionPlayer(result);
      }
      if (result.serviceId == Api.wsPkStopUpdated) {
        ///比赛结束
      }
      if (result.serviceId == Api.wsPkResultUpdated) {
        ///比赛结果
        isPkResultUpdated = true;
        pkResultUpdatedEntity = PkResultUpdatedEntity.fromJson(result.payload);
      }
      if (result.serviceId == Api.wsPkEventUpdated) {
        PkEventUpdatedEntity pkEventUpdatedEntity =
            PkEventUpdatedEntity.fromJson(result.payload);
        var gameEvent = getGameEvent(pkEventUpdatedEntity.eventId);
        var text = insertParamValue(
            gameEvent?.eventDescripition ?? "", pkEventUpdatedEntity);
        bool isHomePlayer =
            battleEntity.homeTeam.teamId == pkEventUpdatedEntity.senderTeamId;
        var competitionVenue = getCompetitionVenue(gameEvent!.gameEventType,
            pkEventUpdatedEntity.senderPlayerId, isHomePlayer);
        var event = GameEvent(
          pkEventUpdatedEntity.stepId,
          pkEventUpdatedEntity.senderPlayerId,
          text,
          pkEventUpdatedEntity.homeScore,
          pkEventUpdatedEntity.awayScore,
          isHomePlayer,
          isShootType(gameEvent.gameEventType),
          isScoreType(gameEvent.gameEventType, pkEventUpdatedEntity),
          competitionVenue == null ? null : getPositions(competitionVenue),
          competitionVenue == null
              ? null
              : getMainPos(
                  competitionVenue,
                  pkEventUpdatedEntity.senderPlayerId,
                  isHomePlayer,
                  getPositions(competitionVenue)),
          pkEventUpdatedEntity.stepHomeScore,
          pkEventUpdatedEntity.stepAwayScore,
          pkEventUpdatedEntity,
        );
        addEvent(event);
      }
    });
  }

  Map<String, Offset> getPositions(CompetitionVenueEntity competitionVenue) {
    return competitionVenue.toJson().keys.fold(<String, Offset>{}, (p, e) {
      if (e.contains("Home") || e.contains("Away")) {
        List<String> json = competitionVenue.toJson()[e];
        var nextInt = Random().nextInt(json.length);
        var lucky = json[nextInt];
        var split = lucky.split('|');
        p[e] = (Offset(double.parse(split[0]), double.parse(split[1])));
      }
      return p;
    });
  }

  Offset getMainPos(CompetitionVenueEntity competitionVenue, int playerId,
      bool isHomeTeamPlayer, Map<String, Offset> map) {
    List<PkPlayerUpdatedPlayers> list =
        List.from(isHomeTeamPlayer ? homeTeamPlayerList : awayTeamPlayerList);
    var firstWhere = list.firstWhere((e) => e.playerId == playerId);
    var position = Utils.getPosition(firstWhere.position);
    String key = "${isHomeTeamPlayer ? "Home" : "Away"}$position";
    return map[key]!;
  }

  /// 换人
  void substitutionPlayer(ResponseMessage result) {
    var pkPlayerUpdatedEntity = PkPlayerUpdatedEntity.fromJson(result.payload);
    if (pkPlayerUpdatedEntity.playerId1 == pkPlayerUpdatedEntity.playerId2) {
      return;
    }
    var isHome = battleEntity.homeTeam.teamId == pkPlayerUpdatedEntity.teamId;

    if (isHome) {
      homeTeamPlayerList = pkPlayerUpdatedEntity.players;
    } else {
      awayTeamPlayerList = pkPlayerUpdatedEntity.players;
    }
    update([idPlayers]);
  }

  changeGameSpeed(double speed) {
    if (superSpeedMan) return;
    if (!isGameStart.value) return;
    if (isGameOver.value) return;

    /// 停止所有的动画
    shootAnimationController.stop(canceled: false);
    quarterTimeCountDownAnimationController.stop(canceled: false);
    eventEngine?.cancel();

    /// 修改动画执行速度
    gameSpeed = speed;

    winRateController.setGameSpeed(speed);

    /// 接着之前的进度继续动画
    double lastValue = quarterTimeCountDownAnimationController.value.value;
    var time = getQuarterTotalTime(quarter.value);
    shootAnimationController = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds: (shootAnimationDuration / gameSpeed).toInt()));
    quarterTimeCountDownAnimationController.controller
        .removeStatusListener(quarterStatusListener);
    quarterTimeCountDownAnimationController.controller
        .removeListener(quarterListener);
    quarterTimeCountDownAnimationController = EasyAnimationController(
        vsync: this,
        begin: lastValue,
        end: 0,
        duration:
            Duration(milliseconds: (lastValue / 40 * time / gameSpeed).toInt()))
      ..controller.addStatusListener(quarterStatusListener)
      ..controller.addListener(quarterListener);
    quarterTimeCountDownAnimationController.forward(from: 0);
    // var time = (((40 * 1000) /
    //         (eventCacheMap[Utils.getSortWithInt(quarter.value)]?.length ??
    //             40)) /
    //     gameSpeed);
    // eventEngine = Timer.periodic(Duration(milliseconds: time.toInt()), (t) {
    //   sendToScreen();
    // });
    sendToScreen();
  }

  void quarterListener() {
    quarterGameCountDown.value =
        quarterTimeCountDownAnimationController.animation.value;
  }

  void quarterStatusListener(status) {
    if (status == AnimationStatus.completed) {
      if (quarter.value >= 4) {
        //比赛结束
        SoundServices.to.playSound(Assets.soundBattleEnd);
        eventEngine?.cancel();
        isGameOver.value = true;
        normalDanMaKuTimer?.cancel();
        winRateController.addLast();
        gameSpeed = 1;
        update([idBattleMain]);
        print(
            'cache length: ${eventCacheMap.values.fold(0, (p, e) => p + e.length)}');
        return;
      }
      SoundServices.to.playSound(Assets.soundTimeOut);
      Future.delayed(const Duration(milliseconds: 300));
      EasyLoading.showToast("Next Quarter",
          toastPosition: EasyLoadingToastPosition.center,
          maskType: EasyLoadingMaskType.clear);

      Future.delayed(Duration(milliseconds: (max(1200,3 * 1000 / gameSpeed)).toInt()),
          () {
        startGame();
      });
    }
  }

  reStart() {
    if (isGameOver.value) {
      isGameOver.value = false;
    }
    isGameStart.value = false;
    quarter.value = 0;
    eventOnScreenMap.clear();
    // checkShowDialog();
  }

  /// 获取单节总时长:ms
  double getQuarterTotalTime(int quarter) {
    var key = Utils.getSortWithInt(quarter);
    var events = eventCacheMap[key] ?? [];
    double count = 0;
    for (int i = 0; i < events.length; i++) {
      var event = events[i];
      var gameEvent = getGameEvent(event.pkEventUpdatedEntity.eventId);
      count += (gameEvent?.eventShowTime ?? 0) * 1000;
    }
    return count;
  }

  startGame() {
    SoundServices.to.stopAllSounds();
    if (eventCacheMap.keys.isEmpty) {
      /// 直到开始比赛都没有收到一条数据,则可能出现异常，让用户可以退出
      maybeException.value = true;
      update([idBattleMain]);
      return;
    }
    if (quarter.value == 3 && pkResultUpdatedEntity == null) {
      ///第三节结束还没收到结束事件，直接退出比赛
      EasyLoading.showToast("SERVER ERROR");
      Get.back();
      return;
    }
    if (quarter.value >= 4) {
      return;
    }

    SoundServices.to.playSound(Assets.soundWhistle).then((v) {
      // SoundServices.to.playLoopingSound(Assets.soundGameBgm);
    });

    /// 开启常驻弹幕计时器
    startForeverNormalDanMaKu();
    quarter.value = quarter.value + 1;
    /// 前3节开始超级加速，最后一节普通速度
    if (superSpeedMan && quarter.value == 4) {
      superSpeedMan = false;
      gameSpeed = 1;
    }
    liveTextTabIndex.value = quarter.value - 1;
    update([idLiveText]);
    liveTextScrollController.jumpTo(0);
    quarterTimeCountDownAnimationController.controller
        .removeStatusListener(quarterStatusListener);
    quarterTimeCountDownAnimationController.controller
        .removeListener(quarterListener);
    var time = getQuarterTotalTime(quarter.value);
    print('${quarter.value} quarter time : $time');
    quarterTimeCountDownAnimationController = EasyAnimationController(
        vsync: this,
        begin: 40,
        end: 0,
        duration: Duration(milliseconds: (time / gameSpeed).toInt()))
      ..controller.addStatusListener(quarterStatusListener)
      ..controller.addListener(quarterListener);
    quarterTimeCountDownAnimationController.forward(from: 0);
    eventEngine?.cancel();
    eventCount = 0;
    // var time = (((40 * 1000) /
    //         (eventCacheMap[Utils.getSortWithInt(quarter.value)]?.length ??
    //             40)) /
    //     gameSpeed);
    // eventEngine = Timer.periodic(Duration(milliseconds: time.toInt()), (t) {
    //   sendToScreen();
    // });
    sendToScreen();
  }

  void startForeverNormalDanMaKu() {
    normalDanMaKuTimer?.cancel();
    normalDanMaKuTimer ??= Timer.periodic(const Duration(seconds: 2), (t) {
      var where = CacheApi.danMaKuList.where((e) => e.hudTrigger.contains(0));
      if (where.isNotEmpty) {
        var random = Random();
        for (int i = 0; i < where.length; i++) {
          var item = where.toList()[i];
          var num = random.nextInt(item.hudNum[1]) + 1;
          normalBarrageWallController.send(
              List.generate(num, (_) => generateNormalBullet(item.hudDes)));
        }
      }
    });
  }

  void sendToScreen() {
    if (isGameOver.value) return;
    var key = Utils.getSortWithInt(quarter.value);
    var events = eventCacheMap[key] ?? [];
    var hasData = events.length > eventCount;
    if (!hasData) {
      print('-----------key---:$key');
      return;
    }
    var event = events[eventCount];
    var gameEvent = getGameEvent(event.pkEventUpdatedEntity.eventId);
    if (gameEvent == null) {
      print('gameEvent----null-----');

      /// 找不到事件则跳过，继续下一个事件
      eventCount++;
      sendToScreen();
      return;
    }
    eventEngine?.cancel();
    eventEngine = Timer(
        Duration(
            milliseconds: (gameEvent.eventShowTime * 1000 / gameSpeed).toInt()),
        () {
      sendToScreen();
    });
    checkRoundTransformEvent(event);

    /// 这几个事件的时间设置为
    if (["501", "502", "505", "506"].contains(gameEvent.gameEventType)) {
      if (gameEvent.gameEventType == '502' &&
          gameEvent.gameEventType == '501') {
        /// 比赛开始跳球事件
        event.time = (40 / 40 * 12 * 60).toInt();
      } else {
        event.time = 0;
      }
    } else {
      event.time =
          (quarterTimeCountDownAnimationController.value.value / 40 * 12 * 60)
              .toInt();
    }

    WinInfo winInfo = getWinRate(event);
    // print('winRate: $winRate');
    var offset = Offset(
        (eventCount + getBeforeQuarterEventCount()) * 1.0, winInfo.winRate);
    var offsetEvent = OffsetEvent(event, offset, winInfo.homeWin);
    winRateController.addPoint(offsetEvent);

    if (eventOnScreenMap.containsKey(key)) {
      eventOnScreenMap[key]!.add(event);
    } else {
      eventOnScreenMap[key] = [event];
    }

    if (gameEvent.headLine != "0") {
      /// 高光时刻
      // highLightBarrageWallController.send([generateHighBullet(event)]);
      if(!superSpeedMan) {
        highLightEvent = event;
        update([idHighLightEvent]);
      }
    } else {
      /// 普通弹幕
      // normalBarrageWallController.send([
      //   generateHightButlle(insertPlayerName(
      //       gameEvent?.eventDescripition ?? "", pkEventUpdatedEntity))
      // ]);
    }

    if (event.mainOffset != null) {
      if (event.shooting) {
        shoot(event);
      } else {
        addToShootHistory(mainOffset = ShootHistory(
            !event.isHomePlayer, transitionPos(event), event.score));
        update([idPlayersLocation]);
      }
    }
    gameLeaderController.setEvent(event);
    teamStatsController.setEvent(event);

    handlerDanMaKu(event);
    update([idLiveText, idGameScore, idPlayers, idQuarterScore, idReadiness]);
    Future.delayed(Duration.zero, () {
      if (!isClosed && (liveTextTabIndex.value + 1) == quarter.value) {
        liveTextScrollController.animateTo(
            ((eventOnScreenMap[key] ?? []).length * 44.w),
            duration: Duration(milliseconds: (800 / gameSpeed).toInt()),
            curve: Curves.easeInOut);
      }
    });
    eventCount++;
  }

  /// 检查回合动画
  void checkRoundTransformEvent(GameEvent event) {
    var roundEventIds = [502, 202, 22, 23];
    var gameEvent = getGameEvent(event.pkEventUpdatedEntity.eventId);
    if (gameEvent != null &&
        (roundEventIds.contains(int.parse(gameEvent.gameEventType)) ||
            isScoreType(gameEvent.gameEventType, event.pkEventUpdatedEntity))) {
      var key = Utils.getSortWithInt(quarter.value);
      var events = eventCacheMap[key] ?? [];
      var next = eventCount + 1;
      var hasData = events.length > next;
      if (hasData) {
        var nextEvent = events[next];
        leftRound = nextEvent.isHomePlayer;

        /// 只播放我方的回合动画
        if (leftRound == true) {
          update([idRoundTransform]);
        }
      }
    }
  }

  WinInfo getWinRate(GameEvent event, {double? time}) {
    var t = time ??
        ((40 - quarterTimeCountDownAnimationController.value.value) +
            (quarter.value - 1) * 40);
    var homeScoreDiff = (event.homeScore - event.awayScore);
    var awayScoreDiff = (event.awayScore - event.homeScore);
    // print('winRate---awayScoreDiff:$homeScoreDiff,$awayScoreDiff');
    var home = (event.pkEventUpdatedEntity.homeCurrentStrength /
        (event.pkEventUpdatedEntity.homeCurrentStrength +
            event.pkEventUpdatedEntity.awayCurrentStrength));
    var away = (event.pkEventUpdatedEntity.awayCurrentStrength /
        (event.pkEventUpdatedEntity.homeCurrentStrength +
            event.pkEventUpdatedEntity.awayCurrentStrength));
    // print('winRate---home:$home,$away');
    double a = 0.2;
    int allTime = 40 * 4;
    var homeEma = a * homeScoreDiff + (1 - a) * lastHomeScoreDiff;
    var awayEma = a * awayScoreDiff + (1 - a) * lastAwayScoreDiff;
    lastHomeScoreDiff = homeScoreDiff.toDouble();
    lastAwayScoreDiff = awayScoreDiff.toDouble();
    // print('winRate---ema:$homeEma,$awayEma');
    var homeScoreValue =
        (1 / (1 + exp(-15 * homeEma / sqrt(allTime - t + 0.1)))) * t / allTime;
    var awayScoreValue =
        (1 / (1 + exp(-15 * awayEma / sqrt(allTime - t + 0.1)))) * t / allTime;
    // print('winRate---homeScoreValue:$homeScoreValue,$awayScoreValue');
    var homePowerValue = 0.3 * home * (1 - t / allTime);
    var awayPowerValue = 0.3 * away * (1 - t / allTime);
    // print('winRate---homePowerValue:$homePowerValue,$awayPowerValue');
    var homeValue = homeScoreValue + homePowerValue;
    var awayValue = awayScoreValue + awayPowerValue;
    // print('winRate---homeValue:$homeValue,$awayValue');
    var result = WinInfo(
        homeValue > awayValue ? homeValue : -awayValue, homeValue > awayValue);
    return result;
  }

  double generateRandomValue(double t) {
    // 定义常量
    const double base = 1;
    const double decayRate = -0.1;

    // 计算范围的绝对值
    double range = base * exp(decayRate * t);

    // 随机生成 [-range, range] 的值
    Random random = Random();
    return random.nextDouble() * 2 * range - range;
  }

  double getR() {
    var r = (Utils.getMaxWidth(Get.context!) - 18.w) / 357.w;
    return r;
  }

  /// 投篮动画
  shoot(GameEvent event) {
    if(superSpeedMan) return;
    if (shootAnimationController.isAnimating) {
      return;
    }
    shootPathOffsets.clear();
    shootPathOffsets.refresh();
    // 球场宽高比例：716/184
    // width 的最大值 375.w
    //start x 取值范围 right：9.w ~ width-9.w ; left : 9.w ~ width-9.w
    //start y 取值范围 right：9.w ~ width-9.w ; left : 9.w ~ width-9.w
    start = transitionPos(event);

    isSuccess = event.score;
    var isAway = !event.isHomePlayer;

    shootPathColor = isAway ? AppColors.cD60D20 : AppColors.c1F8FE5;
    addToShootHistory(mainOffset = ShootHistory(isAway, start, isSuccess));
    update([idPlayersLocation]);
    end = isAway
        ? Offset(22.w, 49.w * getR())
        : Offset(
            Utils.getMaxWidth(Get.context!) - 22.w - 18.w - 6.w, 49.w * getR());
    // 随机生成最高点
    // peak = Offset(
    //     (start.dx + end.dx) / 2, Random().nextDouble() * min(start.dy, end.dy));
    var d = (sqrt(pow((end.dx - start.dx), 2) + pow((end.dy - start.dy), 2)));
    peak = Offset(
        (start.dx + end.dx) / 2, max(15.w, max(start.dy, end.dy) - d.abs()));

    // 计算抛物线参数
    calculateParabola();

    isSecondAnimationRunning = false;
    shootAnimation?.removeListener(shootAnimationListener);
    shootAnimation?.removeListener(shootIIAnimationListener);
    shootAnimation = CurvedAnimation(
        parent: shootAnimationController, curve: const Cubic(0.1, 0.5, 0.7, 2))
      ..addListener(shootAnimationListener);
    shootAnimationDuration = 1200;
    shootAnimationController.duration =
        Duration(milliseconds: (shootAnimationDuration / gameSpeed).toInt());
    shootAnimationController.forward(from: 0);
  }

  addToShootHistory(ShootHistory item) {
    // print('shootHistory.length--00--:${shootHistory.length}');
    shootHistory.add(item);
    var list = shootHistory;
    if (list.length > 2) {
      shootHistory.removeAt(0);
    }
    // var list = shootHistory.where((e) => e.isAway == item.isAway).toList();
    // if (list.length > 5) {
    //   var lastWhere =
    //       shootHistory.firstWhereOrNull((e) => e.isAway == item.isAway);
    //   shootHistory.remove(lastWhere);
    // }
  }

  double getRandom(num max, [num minValue = 0]) {
    return minValue +
        Random().nextDouble() * (max - minValue + (minValue == 0 ? 0 : 1));
  }

  shootSuccessAnimation() {
    shootAnimation?.removeListener(shootAnimationListener);
    shootAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: shootAnimationController, curve: Curves.bounceOut));
    shootAnimation?.addListener(shootIIAnimationListener);
    shootAnimationController.forward(from: 0);
  }

  shootFailedAnimation() {
    start = Offset(end.dx, end.dy);
    if (end.dx == 22.w) {
      //右边投篮
      // end =
      //     Offset(Random().nextDouble() * 50 + end.dx + 10, end.dy + end.dy / 2);
      // end = isAway ? Offset(22.w, 49.w) : Offset(375.w - 22.w - 18.w - 6.w, 49.w);

      end = Offset(10.w, 35.w * getR());
    } else {
      //左边投篮
      // end =
      //     Offset(end.dx - Random().nextDouble() * 50 - 10, end.dy + end.dy / 2);
      end = Offset(Utils.getMaxWidth(Get.context!) - 22.w - 18.w - 6.w + 12.w,
          35.w * getR());
    }
    // 随机生成最高点
    peak = Offset((start.dx + end.dx) / 2, peak.dy - 5);

    // 计算抛物线参数
    calculateParabola();
    shootAnimation?.removeListener(shootAnimationListener);
    shootAnimation = Tween(begin: start, end: end).animate(CurvedAnimation(
        parent: shootAnimationController, curve: Curves.easeOut));
    shootAnimation?.addListener(shootIIAnimationListener);
    shootAnimationController.forward(from: 0);
  }

  shootIIAnimationListener() {
    if (isSuccess) {
      var t = shootAnimation!.value;
      var offset = Offset(end.dx, end.dy + (end.dy / 2 * t));
      shootOffset.value = offset;

      shootPathOffsets.add(offset);
    } else {
      // double t = shootAnimation!.value; // 当前动画进度
      // final x = start.dx + (end.dx - start.dx) * t;
      // final y = calculateY(x);
      var offset = shootAnimation!.value;
      shootOffset.value = offset;
      shootPathOffsets.add(offset);
    }
  }

  shootAnimationListener() {
    double t = shootAnimation!.value; // 当前动画进度
    if (t > 1) {
      shootAnimationController.stop();
      isSecondAnimationRunning = true;
      shootAnimationDuration = 200;
      shootAnimationController.duration =
          Duration(milliseconds: (shootAnimationDuration / gameSpeed).toInt());
      // if (gameSpeed == 1) {
      if (isSuccess) {
        // shootSuccessAnimation();
      } else {
        shootFailedAnimation();
      }
      // }
      return;
    }
    final x = start.dx + (end.dx - start.dx) * t;
    final y = calculateY(x);
    var offset = Offset(x, y);
    shootOffset.value = offset;
    if (t <= 1) {
      shootPathOffsets.add(offset);
    }
  }

  List<Bullet> getNormalBullets() {
    var random = Random();
    List<Bullet> bullets = List<Bullet>.generate(10, (i) {
      final showTime = random.nextInt(6000);
      var text = [
        "DAMN IT !!!",
        "holly shit !!!",
        "what the fuck !!!"
      ][random.nextInt(3)];
      var size = calculateTextSize(
          text,
          12.w4(
              color: AppColors.c000000,
              height: 1,
              fontFamily: FontFamily.fRobotoRegular));
      return Bullet(
          child: Container(
            width: size.width + 12.w * 2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(14.w),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.cDEDEDE,
                      offset: Offset(3.w, 3.w),
                      blurRadius: 3.w)
                ]),
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            height: 21.w,
            child: Text(
              text,
              style: 12.w4(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoRegular),
            ),
          ),
          showTime: showTime);
    });
    return bullets;
  }

  Bullet generateNormalBullet(String text) {
    var size = calculateTextSize(
        text,
        12.w4(
            color: AppColors.c000000,
            height: 1,
            fontFamily: FontFamily.fRobotoRegular));
    return Bullet(
      child: Container(
        width: size.width + 12.w * 2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(14.w),
            boxShadow: [
              BoxShadow(
                  color: AppColors.cDEDEDE,
                  offset: Offset(3.w, 3.w),
                  blurRadius: 3.w)
            ]),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        height: 21.w,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: 12.w4(
                color: AppColors.c000000,
                height: 1,
                fontFamily: FontFamily.fRobotoRegular),
          ),
        ),
      ),
    );
  }

  Bullet generateHighBullet(GameEvent event) {
    var size = calculateTextSize(
        event.text,
        12.w5(
            color: AppColors.c000000,
            height: 1,
            fontFamily: FontFamily.fRobotoMedium));
    return Bullet(
      child: Container(
        width: size.width + 12.w + 4.w + 20.w + 7.w,
        decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(14.w),
            boxShadow: [
              BoxShadow(
                  color: AppColors.cDEDEDE,
                  offset: Offset(3.w, 3.w),
                  blurRadius: 3.w)
            ]),
        padding: EdgeInsets.only(left: 4.w, right: 12.w),
        height: 28.w,
        child: Row(
          children: [
            SizedBox(
              width: 20.w,
              height: 20.w,
              child: Center(
                child: ImageWidget(
                  url: Utils.getPlayUrl(event.playerId),
                  imageFailedPath: Assets.iconUiDefault05,
                  borderRadius: BorderRadius.circular(10.w),
                  width: 20.w,
                  height: 20.w,
                ),
              ),
            ),
            7.hGap,
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Builder(builder: (context) {
                  var list = Utils.subColorString(event.text);
                  return Text.rich(
                      TextSpan(
                          children: List.generate(list.length, (index) {
                        var colorString = list[index];
                        return TextSpan(
                            text: "${colorString.text} ",
                            style: colorString.isMatch
                                ? TextStyle(
                                    color: event.isHomePlayer
                                        ? AppColors.c1F8FE5
                                        : AppColors.cD60D20)
                                : null);
                      })),
                      maxLines: 3,
                      softWrap: true,
                      style: 12.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fRobotoMedium,
                      ));
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 计算文本尺寸
  Size calculateTextSize(String value, TextStyle style) {
    final TextPainter painter = TextPainter(
      text: TextSpan(text: value, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(); // 调用 layout() 进行布局计算
    return Size(painter.width, painter.height);
  }

  // 根据起点、最高点、终点计算抛物线参数
  void calculateParabola() {
    final matrix = [
      [pow(start.dx, 2), start.dx, 1],
      [pow(peak.dx, 2), peak.dx, 1],
      [pow(end.dx, 2), end.dx, 1],
    ];

    final results = [start.dy, peak.dy, end.dy];
    final coefficients = solveLinearSystem(matrix, results);

    a = coefficients[0];
    b = coefficients[1];
    c = coefficients[2];
  }

  // 计算抛物线上的y坐标
  double calculateY(double x) {
    return a * pow(x, 2) + b * x + c;
  }

  // 计算行列式
  num determinant(List<List<num>> matrix) {
    return matrix[0][0] *
            (matrix[1][1] * matrix[2][2] - matrix[2][1] * matrix[1][2]) -
        matrix[0][1] *
            (matrix[1][0] * matrix[2][2] - matrix[2][0] * matrix[1][2]) +
        matrix[0][2] *
            (matrix[1][0] * matrix[2][1] - matrix[2][0] * matrix[1][1]);
  }

// 解线性方程组
  List<double> solveLinearSystem(List<List<num>> matrix, List<num> results) {
    final det = determinant(matrix);

    if (det == 0) throw Exception('Matrix is singular and cannot be solved.');

    replaceColumn(int index) {
      return List<List<num>>.generate(
        3,
        (row) => List<num>.from(matrix[row])..[index] = results[row],
      );
    }

    final detA = determinant(replaceColumn(0));
    final detB = determinant(replaceColumn(1));
    final detC = determinant(replaceColumn(2));

    return [detA / det, detB / det, detC / det];
  }

  @override
  void onClose() {
    release();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  release() {
    normalBarrageWallController.dispose();
    highLightBarrageWallController.dispose();
    shootAnimationController.dispose();
    _timer?.cancel();
    normalDanMaKuTimer?.cancel();
    subscription.cancel();
    eventEngine?.cancel();
    quarterTimeCountDownAnimationController.dispose();
    Get.delete<WinRateController>();
    Get.delete<GameLeaderController>();
    Get.delete<TeamStatsController>();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    /// app退到后台则直接返回
    if (!kIsWeb && state == AppLifecycleState.paused && !isGameOver.value) {
      // isGameOver.value = true;
      Get.back();
    }
    super.didChangeAppLifecycleState(state);
  }

  gameOver() {
    _timer?.cancel();
    isGameOver.value = !isGameOver.value;
  }

  List<PkPlayerUpdatedPlayers> getHomeTeamPlayerList() {
    var list = homeTeamPlayerList.where((e) => e.position != 0).toList();
    return list;
  }

  List<PkPlayerUpdatedPlayers> getAwayTeamPlayerList() {
    var list = awayTeamPlayerList.where((e) => e.position != 0).toList();
    return list;
  }

  GameEventEntity? getGameEvent(int eventId) {
    return CacheApi.gameEvents
        .firstWhereOrNull((e) => e.constantId == eventId.toString());
  }

  CompetitionVenueEntity? getCompetitionVenue(
      String gameEventType, int senderPlayerId, bool isHomePlayer) {
    var data = isHomePlayer ? homeTeamPlayerList : awayTeamPlayerList;
    var info = data.firstWhereOrNull((e) => e.playerId == senderPlayerId);
    if (info == null) {
      print('firstWhereOrNull--------------:$gameEventType,$senderPlayerId');
      return null;
    }
    var list = CacheApi.competitionVenues
        .where((e) =>
            e.gameEventType.contains(gameEventType) &&
            e.actor.toLowerCase() ==
                Utils.getPosition(info.position).toLowerCase())
        .toList();
    if (list.isEmpty) {
      print(
          'competitionVenue---null--------------------:$gameEventType,${info.position}');
      return null;
    }
    var nextInt = Random().nextInt(list.length);
    return list[nextInt];
  }

  String insertParamValue(String text, PkEventUpdatedEntity event) {
    String result = text
        .replaceAll("[0]", Utils.getPlayBaseInfo(event.senderPlayerId).elname)
        .replaceAll(
            "[1]", Utils.getPlayBaseInfo(event.senderOtherPlayerId).elname)
        .replaceAll("[2]", Utils.getPlayBaseInfo(event.receivePlayerId).elname);
    var matchAsPrefix = result.indexOf('{0}');
    if (matchAsPrefix != -1) {
      result = result.replaceFirst(
          "{0}", event.getFreeThrowSuccessCount().toString());
      result = result.replaceFirst("{0}", event.getFreeThrowCount().toString());
    }
    return result;
  }

  void addEvent(GameEvent event) {
    var key = Utils.getSortWithInt(event.quarter);
    if (eventCacheMap.containsKey(key)) {
      eventCacheMap[key]!.add(event);
    } else {
      eventCacheMap[key] = [event];
    }
  }

  static String get idPlayersLocation => "id_players_location";

  static String get idLiveText => "id_live_text";

  static String get idGameScore => "id_game_score";

  static String get idPlayers => "id_players";

  static String get idQuarterScore => "id_quarter_score";

  static String get idReadiness => "id_readiness";

  static String get idBattleMain => "id_battle_main";

  static String get idRoundTransform => "id_round_transform";

  static String get idHighLightEvent => "id_high_light_event";

  List<GameEvent> getQuarterEvents({int? quarterValue}) {
    return eventOnScreenMap[
            Utils.getSortWithInt(quarterValue ?? quarter.value)] ??
        [];
  }

  seeAll() {
    BottomTipDialog.showWithSound(
        isScrollControlled: true,
        backgroundColor: AppColors.cTransparent,
        context: Get.context!,
        builder: (context) {
          return const LiveTextDialogWidget();
        });
  }

  Offset transitionPos(GameEvent event) {
    Offset o = event.mainOffset!;
    double x = o.dx;
    double y = o.dy;
    double regionWidth = Utils.getMaxWidth(Get.context!) - 18.w;
    double regionHeight = regionWidth / 716 * 184;
    var offset = Offset(
        (regionWidth / 600) * x +
            (event.isHomePlayer ? 0 : regionWidth / 2) +
            20.w,
        y * (regionHeight / 320) - regionHeight / 2 - 38.w);
    return toTopRight(offset);
  }

  // 十字坐标系 -> 右上顶点坐标系
  Offset toTopRight(Offset crossCoordinate) {
    double screenWidth = Utils.getMaxWidth(Get.context!) - 18.w;
    double regionHeight = screenWidth / 716 / 184;
    double x = screenWidth / 2 - crossCoordinate.dx;
    double y = regionHeight / 2 - crossCoordinate.dy;
    return Offset(x, y);
  }

  bool isShootType(String type) {
    // 投篮事件类型
    List<int> shootTypes = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      31,
      32
    ];
    return shootTypes.contains(int.parse(type));
  }

  bool isScoreType(String type, PkEventUpdatedEntity pkEventUpdatedEntity) {
    if (type == "200" && pkEventUpdatedEntity.getFreeThrowSuccessCount() > 0) {
      return true;
    }
    //得分事件类型
    List<int> scoreTypes = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      11,
      12,
      13,
      14,
      24,
      26,
      27,
      30,
      31,
      32
    ];
    return scoreTypes.contains(int.parse(type));
  }

  void changeBuff() {
    showBuff.value = true;
    Future.delayed(const Duration(seconds: 3), () {
      showBuff.value = false;
    });
  }

  double getBuff(int playerId) {
    var startUpdatedEntity =
        Get.find<TeamBattleController>().pkStartUpdatedEntity;
    var bool = startUpdatedEntity?.pokerWinner == playerId;
    return bool
        ? (startUpdatedEntity?.pokerRate ?? 0) * 100
        : -(startUpdatedEntity?.pokerRate ?? 0) * 100;
  }

  Color getBuffColor(int playerId) {
    var startUpdatedEntity =
        Get.find<TeamBattleController>().pkStartUpdatedEntity;
    var bool = startUpdatedEntity?.pokerWinner == playerId;
    return bool ? AppColors.c10A86A : AppColors.cE72646;
  }

  double getBuffAngle(int playerId) {
    var startUpdatedEntity =
        Get.find<TeamBattleController>().pkStartUpdatedEntity;
    var bool = startUpdatedEntity?.pokerWinner == playerId;
    return bool ? -90 : 90;
  }

  void jumpGame() {
    if(superSpeedMan) return;
    if (!isGameStart.value) return;
    if (isGameOver.value) {
      Get.back();
      return;
    }
    if (!isPkResultUpdated) {
      EasyLoading.showToast("Wait a moment");
      return;
    }
    BottomTipDialog.show(
        context: Get.context!,
        onTap: confirmJumpGame,
        desc: LangKey.gameTipsSkip.tr);
  }

  confirmJumpGame() {
    Get.back();

    quarterTimeCountDownAnimationController.stop();
    eventOnScreenMap = eventCacheMap;

    quarter.value = 4;
    var event = eventOnScreenMap[Utils.getSortWithInt(quarter.value)]!.last;
    gameLeaderController.setEvent(event);
    teamStatsController.setEvent(event);

    List<GameEvent> fold = eventOnScreenMap.keys.fold([], (p, e) {
      p.addAll(eventOnScreenMap[e]!);
      return p;
    });
    List<OffsetEvent> oes = [];
    var step = 160 / fold.length;
    for (int i = 0; i < fold.length; i++) {
      var gameEvent = fold[i];
      var winInfo = getWinRate(gameEvent, time: i * step);
      var offset = Offset(i.toDouble(), winInfo.winRate);
      oes.add(OffsetEvent(gameEvent, offset, winInfo.homeWin));
    }
    winRateController.jumpGame(oes);

    quarterGameCountDown.value = 0;
    eventEngine?.cancel();
    isGameOver.value = true;
    normalDanMaKuTimer?.cancel();
    gameSpeed = 1;
    update([
      // idLiveText,
      // idGameScore,
      // idPlayers,
      // idQuarterScore,
      // idReadiness,
      idBattleMain
    ]);
  }

  /// 获取之前小结事件总数
  int getBeforeQuarterEventCount() {
    int count = 0;
    for (int i = 1; i < quarter.value; i++) {
      var list = eventCacheMap[Utils.getSortWithInt(i)];
      if (list != null && list.isNotEmpty) {
        count += list.length;
      }
    }
    return count;
  }

  bool isSystemEvent(GameEvent event) {
    var systemEventIds = [501, 502, 503, 504, 505, 506];
    return systemEventIds.contains(int.parse(
        getGameEvent(event.pkEventUpdatedEntity.eventId)?.gameEventType ??
            '0'));
  }

  void handlerDanMaKu(GameEvent event) {
    var where = CacheApi.danMaKuList.where((e) => e.hudTrigger.contains(
        int.parse(
            getGameEvent(event.pkEventUpdatedEntity.eventId)?.gameEventType ??
                '0')));
    if (where.isNotEmpty) {
      var random = Random();
      for (int i = 0; i < where.length; i++) {
        var item = where.toList()[i];
        var num = random.nextInt(item.hudNum[1]) + 1;
        normalBarrageWallController.send(List.generate(
            num,
            (_) => generateNormalBullet(
                insertParamValue(item.hudDes, event.pkEventUpdatedEntity))));
      }
    }
  }

  /// 获取单节的有效事件总数
  int getQuarterAvailableEventTotalCount(int quarter) {
    var key = Utils.getSortWithInt(quarter);
    if (!eventCacheMap.containsKey(key)) {
      return 0;
    }
    var list = eventCacheMap[key]!;
    var where =
        list.where((e) => getGameEvent(e.pkEventUpdatedEntity.eventId) != null);
    return where.length;
  }
}

class GameEvent {
  final int quarter; //小节
  final int playerId;
  final String text;
  final int homeScore;
  final int awayScore;
  final bool isHomePlayer;
  int time = -1;

  // 是否执行投篮动画
  final bool shooting;

  // 是否得分
  final bool score;

  //此事件所有球员的位置
  final Map<String, Offset>? playerOffsets;

  // 主角的位置
  final Offset? mainOffset;
  final int quarterHomeScore;
  final int quarterAwayScore;
  final PkEventUpdatedEntity pkEventUpdatedEntity;

  GameEvent(
    this.quarter,
    this.playerId,
    this.text,
    this.homeScore,
    this.awayScore,
    this.isHomePlayer,
    this.shooting,
    this.score,
    this.playerOffsets,
    this.mainOffset,
    this.quarterHomeScore,
    this.quarterAwayScore,
    this.pkEventUpdatedEntity,
  );

  @override
  String toString() {
    return 'GameEvent{quarter: $quarter, playerId: $playerId, text: $text, homeScore: $homeScore, awayScore: $awayScore, isHomePlayer: $isHomePlayer, time: $time}';
  }
}

class OffsetEvent {
  final GameEvent event;
  final Offset offset;
  final bool homeWin;

  OffsetEvent(this.event, this.offset, this.homeWin);
}

class WinInfo {
  final double winRate;
  final bool homeWin;

  WinInfo(this.winRate, this.homeWin);
}
