import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/competition_venue_entity.dart';
import 'package:arm_chair_quaterback/common/entities/game_event_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pk_event_updated_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pk_player_updated_entity.dart';
import 'package:arm_chair_quaterback/common/entities/web_socket/web_socket_entity.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/index.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/thrid_lib/flutter_barrage.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/battle_animation_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_leader/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/live_text_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/tactical_contrast/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/tactical_contrast/tactical_contrast.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/team_stat/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/win_rate/controller.dart';
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
    with GetTickerProviderStateMixin {
  TeamBattleV2Controller(this.context);

  final BuildContext context;
  late BarrageWallController normalBarrageWallController =
      BarrageWallController();
  late BarrageWallController highLightBarrageWallController =
      BarrageWallController();

  late AnimationController shootAnimationController;
  Animation? shootAnimation;
  var shootOffset = Offset.infinite.obs;

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

  //左边
  var redScore = 0.obs;

  //右边
  var blueScore = 0.obs;

  var isGameOver = false.obs;
  Timer? _timer;

  late StreamSubscription<ResponseMessage> subscription;

  late EasyAnimationController<double> quarterTimeCountDownAnimationController;
  var quarter = 0.obs;
  Map<String, List<GameEvent>> eventCacheMap = {}; //缓存所有的事件，等待事件引擎调用
  Timer? eventEngine; //事件引擎,1s产生一个事件
  int eventCount = 0;
  Map<String, List<GameEvent>> eventOnScreenMap = {}; //正在播放的事件

  //游戏速度 默认 1
  double gameSpeed = 1;

  List<TeamPlayerList> homeTeamPlayerList = [];
  List<TeamPlayerList> awayTeamPlayerList = [];
  late BattleEntity battleEntity;

  ScrollController liveTextScrollController = ScrollController();

  var showBuff = false.obs;

  late GameLeaderController gameLeaderController;
  late TeamStatsController teamStatsController;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    gameLeaderController = Get.put(GameLeaderController());
    teamStatsController = Get.put(TeamStatsController());
    battleEntity = Get.find<TeamBattleController>().battleEntity;
    homeTeamPlayerList = battleEntity.homeTeamPlayerList;
    awayTeamPlayerList = battleEntity.awayTeamPlayerList;
    shootAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: (1200 / gameSpeed).toInt()));
    quarterTimeCountDownAnimationController = EasyAnimationController(
        vsync: this,
        begin: 40,
        end: 0,
        duration: Duration(milliseconds: (40 * 1000 / gameSpeed).toInt()))
      ..controller.addStatusListener(quarterStatusListener);

    subscription = WSInstance.stream.listen((result) {
      if (result.serviceId == Api.wsPkPlayerUpdated) {
        ///换人
        substitutionPlayer(result);
      }
      if (result.serviceId == Api.wsPkStopUpdated) {
        ///比赛结束
      }
      if (result.serviceId == Api.wsPkResultUpdated) {
        ///比赛结果
      }
      if (result.serviceId == Api.wsPkEventUpdated) {
        PkEventUpdatedEntity pkEventUpdatedEntity =
            PkEventUpdatedEntity.fromJson(result.payload);
        var gameEvent = getGameEvent(pkEventUpdatedEntity.eventId);
        var text = insertPlayerName(
            gameEvent?.eventDescripition ?? "", pkEventUpdatedEntity);
        var firstWhereOrNull = homeTeamPlayerList.firstWhereOrNull(
            (e) => e.teamId == pkEventUpdatedEntity.senderTeamId);
        bool isHomePlayer = false;
        if (firstWhereOrNull != null) {
          isHomePlayer = true;
        }
        var competitionVenue = getCompetitionVenue(gameEvent!.gameEventType,
            pkEventUpdatedEntity.senderPlayerId, isHomePlayer);
        if (competitionVenue == null) {
          return;
        }
        var positions = getPositions(competitionVenue);
        var mainPos = getMainPos(competitionVenue,
            pkEventUpdatedEntity.senderPlayerId, isHomePlayer, positions);
        var event = GameEvent(
          pkEventUpdatedEntity.stepId,
          pkEventUpdatedEntity.senderPlayerId,
          text,
          pkEventUpdatedEntity.homeScore,
          pkEventUpdatedEntity.awayScore,
          isHomePlayer,
          isShootType(gameEvent.gameEventType),
          isScoreType(gameEvent.gameEventType),
          positions,
          mainPos,
          pkEventUpdatedEntity.stepHomeScore,
          pkEventUpdatedEntity.stepAwayScore,
          pkEventUpdatedEntity,
        );
        addEvent(event);
        if (gameEvent.headLine == "1") {
          /// 高光时刻
          highLightBarrageWallController.send([generateHightButlle(text)]);
        } else {
          /// 普通弹幕
          // normalBarrageWallController.send([
          //   generateHightButlle(insertPlayerName(
          //       gameEvent?.eventDescripition ?? "", pkEventUpdatedEntity))
          // ]);
        }
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
    List<TeamPlayerList> list =
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
    var isHome =
        homeTeamPlayerList.first.teamId == pkPlayerUpdatedEntity.teamId;
    var list = isHome ? homeTeamPlayerList : awayTeamPlayerList;
    var indexWhere =
        list.indexWhere((e) => e.playerId == pkPlayerUpdatedEntity.playerId1);
    var indexWhere2 =
        list.indexWhere((e) => e.playerId == pkPlayerUpdatedEntity.playerId2);
    list[indexWhere2].position = list[indexWhere].position;
    list[indexWhere].position = 0;
    if (isHome) {
      homeTeamPlayerList = list;
    } else {
      awayTeamPlayerList = list;
    }
    update([idPlayers]);
  }

  @override
  void onReady() {
    super.onReady();

    checkShowDialog();
  }

  void checkShowDialog() {
    /// 双方都没有buffer时不显示buffer弹框
    if (battleEntity.homeTeamBuff.isNotEmpty ||
        battleEntity.awayTeamBuff.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        showTactical();
      });
    }
  }

  changeGameSpeed(double speed) {
    if (isGameOver.value) return;
    gameSpeed = speed;

    /// 接着之前的进度继续动画
    double lastValue = quarterTimeCountDownAnimationController.value.value;
    shootAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: (1200 / gameSpeed).toInt()));
    quarterTimeCountDownAnimationController.controller
        .removeStatusListener(quarterStatusListener);
    quarterTimeCountDownAnimationController = EasyAnimationController(
        vsync: this,
        begin: lastValue,
        end: 0,
        duration:
            Duration(milliseconds: (lastValue * 1000 / gameSpeed).toInt()))
      ..controller.addStatusListener(quarterStatusListener);
    quarterTimeCountDownAnimationController.forward(from: 0);
    eventEngine?.cancel();
    eventEngine =
        Timer.periodic(Duration(milliseconds: (1000 / gameSpeed).toInt()), (t) {
      sendToScreen();
    });
  }

  void quarterStatusListener(status) {
    if (status == AnimationStatus.completed) {
      if (quarter.value >= 4) {
        //比赛结束
        eventEngine?.cancel();
        isGameOver.value = true;
        gameSpeed = 1;
        print(
            'cache length: ${eventCacheMap.values.fold(0, (p, e) => p + e.length)}');
        return;
      }
      EasyLoading.showToast("Next Quarter",
          toastPosition: EasyLoadingToastPosition.center,
          maskType: EasyLoadingMaskType.clear);
      Future.delayed(const Duration(seconds: 1), () {
        startGame();
      });
    }
  }

  reStart() {
    if (isGameOver.value) {
      isGameOver.value = false;
    }
    quarter.value = 0;
    eventOnScreenMap.clear();
    checkShowDialog();
  }

  startGame() {
    quarter.value = quarter.value + 1;
    update([idLiveText]);
    liveTextScrollController.jumpTo(0);
    quarterTimeCountDownAnimationController.controller
        .removeStatusListener(quarterStatusListener);
    quarterTimeCountDownAnimationController = EasyAnimationController(
        vsync: this,
        begin: 40,
        end: 0,
        duration: Duration(milliseconds: (40 * 1000 / gameSpeed).toInt()))
      ..controller.addStatusListener(quarterStatusListener);
    quarterTimeCountDownAnimationController.forward(from: 0);
    eventEngine?.cancel();
    eventCount = 0;
    eventEngine =
        Timer.periodic(Duration(milliseconds: (1000 / gameSpeed).toInt()), (t) {
      sendToScreen();
    });
  }

  void sendToScreen() {
    var key = Utils.getSortWithInt(quarter.value);
    var events = eventCacheMap[key] ?? [];
    var hasData = events.length > eventCount;
    if (!hasData) {
      print('-----------key---:$key');
      return;
    }
    var event = events[eventCount];
    event.time =
        (quarterTimeCountDownAnimationController.value.value / 40 * 12 * 60)
            .toInt();
    if (eventOnScreenMap.containsKey(key)) {
      eventOnScreenMap[key]!.add(event);
    } else {
      eventOnScreenMap[key] = [event];
    }

    if (event.shooting) {
      shoot(event);
    } else {
      addToShootHistory(mainOffset =
          ShootHistory(!event.isHomePlayer, transitionPos(event), event.score));
      update([idPlayersLocation]);
    }
    gameLeaderController.setEvent(event);
    teamStatsController.setEvent(event);
    update([idLiveText, idGameScore, idPlayers, idQuarterScore]);
    Future.delayed(Duration.zero, () {
      liveTextScrollController.animateTo(
          ((eventOnScreenMap[key] ?? []).length * 44.w),
          duration: Duration(milliseconds: (800 / gameSpeed).toInt()),
          curve: Curves.easeInOut);
    });
    eventCount++;
  }

  shoot(GameEvent event) {
    if (shootAnimationController.isAnimating) {
      return;
    }
    // 球场宽高比例：716/184
    // width 的最大值 375.w
    //start x 取值范围 right：9.w ~ width-9.w ; left : 9.w ~ width-9.w
    //start y 取值范围 right：9.w ~ width-9.w ; left : 9.w ~ width-9.w
    start = transitionPos(event);

    isSuccess = event.score;
    var isAway = !event.isHomePlayer;

    addToShootHistory(mainOffset = ShootHistory(isAway, start, isSuccess));
    update([idPlayersLocation]);
    end = isAway ? Offset(22.w, 49.w) : Offset(375.w - 22.w - 18.w - 6.w, 49.w);
    // 随机生成最高点
    peak = Offset(
        (start.dx + end.dx) / 2, Random().nextDouble() * min(start.dy, end.dy));

    // 计算抛物线参数
    calculateParabola();

    isSecondAnimationRunning = false;
    shootAnimation?.removeListener(shootAnimationListener);
    shootAnimation?.removeListener(shootIIAnimationListener);
    shootAnimation = CurvedAnimation(
        parent: shootAnimationController, curve: const Cubic(0.1, 0.5, 0.7, 2))
      ..addListener(shootAnimationListener);
    shootAnimationController.forward(from: 0);
  }

  addToShootHistory(ShootHistory item) {
    // print('shootHistory.length--00--:${shootHistory.length}');
    shootHistory.add(item);
    var list = shootHistory.where((e) => e.isAway == item.isAway).toList();
    if (list.length > 5) {
      var lastWhere =
          shootHistory.firstWhereOrNull((e) => e.isAway == item.isAway);
      shootHistory.remove(lastWhere);
    }
    // print('shootHistory.length--111--:${shootHistory.length}');
  }

  double getRandom(num max, [num minValue = 0]) {
    return minValue +
        Random().nextDouble() * (max - minValue + (minValue == 0 ? 0 : 1));
  }

  static String get idPlayersLocation => "id_players_location";

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
      end =
          Offset(Random().nextDouble() * 50 + end.dx + 10, end.dy + end.dy / 2);
    } else {
      //左边投篮
      end =
          Offset(end.dx - Random().nextDouble() * 50 - 10, end.dy + end.dy / 2);
    }
    // 随机生成最高点
    peak = Offset((start.dx + end.dx) / 2, peak.dy - 5);

    // 计算抛物线参数
    calculateParabola();
    shootAnimation?.removeListener(shootAnimationListener);
    shootAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: shootAnimationController, curve: Curves.bounceOut));
    shootAnimation?.addListener(shootIIAnimationListener);
    shootAnimationController.forward(from: 0);
  }

  shootIIAnimationListener() {
    if (isSuccess) {
      var t = shootAnimation!.value;
      shootOffset.value = Offset(end.dx, end.dy + (end.dy / 2 * t));
    } else {
      double t = shootAnimation!.value; // 当前动画进度
      final x = start.dx + (end.dx - start.dx) * t;
      final y = calculateY(x);
      shootOffset.value = Offset(x, y);
    }
  }

  shootAnimationListener() {
    double t = shootAnimation!.value; // 当前动画进度
    if (t > 1) {
      shootAnimationController.stop();
      isSecondAnimationRunning = true;
      var last = shootHistory.last;
      if (last.isAway) {
        ///todo
        blueScore += last.isSuccess ? 3 : 0;
      } else {
        ///todo
        redScore += last.isSuccess ? 3 : 0;
      }
      if (isSuccess) {
        shootSuccessAnimation();
      } else {
        shootFailedAnimation();
      }
    }
    final x = start.dx + (end.dx - start.dx) * t;
    final y = calculateY(x);
    shootOffset.value = Offset(x, y);
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
      var size = calculateTextSize(text, 12.sp, 0, FontWeight.w400);
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

  List<Bullet> getHighLightBullets() {
    var random = Random();
    List<Bullet> bullets = List<Bullet>.generate(1, (i) {
      final showTime = random.nextInt(6000);
      var text = "Kyrie Irving makes free throw 1of 2";
      return generateHightButlle(text, showTime: showTime);
    });
    return bullets;
  }

  Bullet generateHightButlle(String text, {int showTime = 0}) {
    var size = calculateTextSize(text, 12.sp, 0, FontWeight.w500);
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
              ImageWidget(
                url: "",
                imageFailedPath: Assets.testTestTeamLogo,
                borderRadius: BorderRadius.circular(10.w),
                width: 20.w,
                height: 20.w,
              ),
              7.hGap,
              Text(
                text,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.visible,
                style: 12.w5(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fRobotoMedium),
              ),
            ],
          ),
        ),
        showTime: showTime);
  }

  /// 计算文本尺寸
  Size calculateTextSize(
    String value,
    double fontSize,
    double strokeWidth,
    FontWeight fontWeight,
  ) {
    TextPainter painter = TextPainter(
      // locale: Localizations.localeOf(context),
      maxLines: 1,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: value,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          // letterSpacing: letterSpacing,
          overflow: TextOverflow.visible,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..strokeCap = StrokeCap.round
            ..strokeJoin = StrokeJoin.round
            ..color = Colors.black,
        ),
      ),
    );
    painter.layout();

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
    super.onClose();
  }

  release() {
    normalBarrageWallController.dispose();
    highLightBarrageWallController.dispose();
    shootAnimationController.dispose();
    _timer?.cancel();
    subscription.cancel();
    eventEngine?.cancel();
    quarterTimeCountDownAnimationController.dispose();
    Get.delete<GameLeaderController>();
    Get.delete<TeamStatsController>();

  }

  @override
  void dispose() {
    release();
    super.dispose();
  }

  gameOver() {
    _timer?.cancel();
    isGameOver.value = !isGameOver.value;
  }

  showTactical() async {
    await showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.cTransparent,
        isScrollControlled: true,
        builder: (context) {
          return TacticalContrast();
        });
    Get.delete<TacticalContrastController>();
  }

  List<TeamPlayerList> getHomeTeamPlayerList() {
    var list = homeTeamPlayerList.where((e) => e.position != 0).toList();
    return list;
  }

  List<TeamPlayerList> getAwayTeamPlayerList() {
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
      return null;
    }
    var list = CacheApi.competitionVenues
        .where((e) =>
            e.gameEventType.contains(gameEventType) &&
            e.actor.toLowerCase() ==
                Utils.getPosition(info.position).toLowerCase())
        .toList();
    if (list.isEmpty) {
      return null;
    }
    var nextInt = Random().nextInt(list.length);
    return list[nextInt];
  }

  String insertPlayerName(String text, PkEventUpdatedEntity event) {
    String result = text
        .replaceAll("[0]", Utils.getPlayBaseInfo(event.senderPlayerId).elname)
        .replaceAll(
            "[1]", Utils.getPlayBaseInfo(event.senderOtherPlayerId).elname)
        .replaceAll("[2]", Utils.getPlayBaseInfo(event.receivePlayerId).elname);
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

  static String get idLiveText => "id_live_text";

  static String get idGameScore => "id_game_score";

  static String get idPlayers => "id_players";

  static String get idQuarterScore => "id_quarter_score";

  List<GameEvent> getQuarterEvents() {
    return eventOnScreenMap[Utils.getSortWithInt(quarter.value)] ?? [];
  }

  seeAll() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: AppColors.cTransparent,
        context: context,
        builder: (context) {
          return const LiveTextDialogWidget();
        });
  }

  Offset transitionPos(GameEvent event) {
    Offset o = event.mainOffset;
    double x = o.dx;
    double y = o.dy;
    var size = MediaQuery.of(context).size;
    double regionWidth = size.width - 18.w;
    double regionHeight = regionWidth / 716 * 184;
    var offset = Offset(
        (regionWidth / 600) * x + (event.isHomePlayer ? 0 : regionWidth / 2),
        y * (regionHeight / 320) - regionHeight / 2);
    return toTopRight(offset);
  }

  // 十字坐标系 -> 右上顶点坐标系
  Offset toTopRight(Offset crossCoordinate) {
    var size = MediaQuery.of(context).size;
    double screenWidth = size.width - 18.w;
    double regionHeight = screenWidth / 716 / 184;
    double x = screenWidth / 2 - crossCoordinate.dx;
    double y = regionHeight / 2 - crossCoordinate.dy;
    return Offset(x, y);
  }

  bool isShootType(String type) {
    // 投篮事件类型
    List<int> shootTypes = [1, 3, 5, 6, 7, 9, 11, 12, 13, 14, 15, 16, 20];
    return shootTypes.contains(int.parse(type));
  }

  bool isScoreType(String type) {
    //得分事件类型
    List<int> scoreTypes = [1, 2, 3, 4, 5, 6, 7, 8, 11, 12, 13, 14];
    return scoreTypes.contains(int.parse(type));
  }

  void changeBuff() {
    showBuff.value = true;
    Future.delayed(const Duration(seconds: 3), () {
      showBuff.value = false;
    });
  }

  String getBuff(int playerId) {
    var startUpdatedEntity =
        Get.find<TeamBattleController>().pkStartUpdatedEntity;
    var bool = startUpdatedEntity?.pokerWinner == playerId;
    return bool
        ? "+${startUpdatedEntity?.pokerRate}%"
        : "-${startUpdatedEntity?.pokerRate}%";
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
}

class GameEvent {
  final int quarter; //小节
  final int playerId;
  final String text;
  final int homeScore;
  final int awayScore;
  final bool isHomePlayer;
  int time = 0;

  // 是否执行投篮动画
  final bool shooting;

  // 是否得分
  final bool score;

  //此事件所有球员的位置
  final Map<String, Offset> playerOffsets;

  // 主角的位置
  final Offset mainOffset;
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
