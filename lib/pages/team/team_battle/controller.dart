import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/pk_start_updated_entity.dart';
import 'package:arm_chair_quaterback/common/entities/web_socket/web_socket_entity.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class TeamBattleController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TeamBattleController();

  /// step :
  ///   0 初始状态
  ///   1 扫描
  ///   2 匹配成功
  ///   3 队伍百分比数据,各位置球员 & 突发新闻,比赛
  ///   4 结算
  ///
  var step = 0.obs;

  static bool _canPop = false;

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
    Assets.teamUiHead11,
  ];

  late String meAvatar;
  late String opponentAvatar;
  var breakingNewsBreaking = false.obs;
  double ovr = 75;

  late BattleEntity battleEntity;

  StreamSubscription<ResponseMessage>? subscription;
  PkStartUpdatedEntity? pkStartUpdatedEntity;

  Timer? _timer;

  // late TeamInfoEntity teamInfoEntity;
  @override
  void onInit() {
    super.onInit();
    step.value = 2;
    _canPop = false;
    meAvatar = totalAvatars[Random().nextInt(totalAvatars.length - 1)];
    totalAvatars.remove(meAvatar);
    opponentAvatar = totalAvatars[Random().nextInt(totalAvatars.length - 1)];

    ///todo 测试代码
    // Future.delayed(const Duration(milliseconds: 3000), () {
    //   nextStep();
    // });
    // teamMatch();
  }

  Future<bool> teamMatchV2() {
    Completer<bool> completer = Completer();
    Future.wait([
      CacheApi.getGameEvent(),
      CacheApi.getCompetitionVenue(),
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getNBATeamDefine(),
      // PicksApi.getTeamInfo(),
      CacheApi.getCupDefine(),
      CacheApi.getDanMaKu(),
    ]).then((result) {
      _timer?.cancel();
      _timer = Timer(const Duration(seconds: 3), (){
        completer.completeError("MATCH FAILED");
        _timer?.cancel();
      });
      subscription = WSInstance.teamMatch().listen((result) {
        // developer.log('result.serviceId--${result.serviceId}--:${result.payload}');
        // print('result.serviceId--${result.serviceId}--:${result.payload}');
        if (result.serviceId == Api.wsJazminError && step.value == 1) {
          print('result.serviceId--${result.serviceId}--:${result.payload}');
          completer.completeError(result.payload);
          _timer?.cancel();
          ErrorUtils.toast(result.payload);
          Get.back();
          return;
        }
        if (result.serviceId == Api.wsPkStartUpdated) {
          pkStartUpdatedEntity = PkStartUpdatedEntity.fromJson(result.payload);
        }
        if (result.serviceId == Api.wsTeamMatch) {
          _timer?.cancel();
          battleEntity = BattleEntity.fromJson(result.payload);
          _initBattleController();
          completer.complete(true);
        }
      });
    }, onError: (e) {
      _timer?.cancel();
      completer.completeError(e);
    });
    return completer.future;
  }

  teamMatch() async {
    var startMatchTimeMs = DateTime.now().millisecondsSinceEpoch;
    var minMatchTimeMs = 2000;
    await Future.wait([
      CacheApi.getGameEvent(),
      CacheApi.getCompetitionVenue(),
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getNBATeamDefine(),
      // PicksApi.getTeamInfo(),
      CacheApi.getCupDefine(),
      CacheApi.getDanMaKu(),
    ]).then((result) {
      // teamInfoEntity = result[4];
      _timer?.cancel();
      _timer = Timer(const Duration(seconds: 5), timeout);
      subscription = WSInstance.teamMatch().listen((result) {
        // developer.log('result.serviceId--${result.serviceId}--:${result.payload}');
        // print('result.serviceId--${result.serviceId}--:${result.payload}');
        if (result.serviceId == Api.wsJazminError && step.value == 1) {
          print('result.serviceId--${result.serviceId}--:${result.payload}');
          _timer?.cancel();
          ErrorUtils.toast(result.payload);
          Get.back();
          return;
        }
        var str = jsonEncode(result.payload["homeTeamCup"]);
        if (result.serviceId == Api.wsPkStartUpdated) {
          pkStartUpdatedEntity = PkStartUpdatedEntity.fromJson(result.payload);
        }
        if (result.serviceId == Api.wsTeamMatch) {
          _timer?.cancel();
          battleEntity = BattleEntity.fromJson(result.payload);
          _initBattleController();
          var currentMs = DateTime.now().millisecondsSinceEpoch;
          var diff = currentMs - startMatchTimeMs;
          if (diff >= minMatchTimeMs) {
            nextStep();
          } else {
            Future.delayed(Duration(milliseconds: minMatchTimeMs - diff), () {
              nextStep();
            });
          }
        }
      });
    }, onError: (e) {
      ErrorUtils.toast(e);
      Get.back();
    });

    // var startMatchTimeMs = DateTime.now().millisecondsSinceEpoch;
    // var minMatchTimeMs = 3000;
    // TeamApi.teamMatch().then((result) {
    //   battleEntity = result;
    //   var currentMs = DateTime.now().millisecondsSinceEpoch;
    //   var diff = currentMs - startMatchTimeMs;
    //   if (diff >= minMatchTimeMs) {
    //     nextStep();
    //   } else {
    //     Future.delayed(Duration(milliseconds: minMatchTimeMs - diff), () {
    //       nextStep();
    //     });
    //   }
    // }, onError: (e) {
    //   EasyLoading.showToast("MATCH FAILED");
    //   Get.back();
    // });
  }

  void timeout() {
    print('timeout------');
    EasyLoading.showToast("MATCH FAILED");
    _timer?.cancel();
    Get.back();
  }

  _initBattleController() {
    Get.put(TeamBattleV2Controller());
  }

  /// 是否有突发新闻
  bool havaBreakingNews() {
    return battleEntity.news != null;
  }

  void onBreakingNewsStart() {
    ovr = 70;
    breakingNewsBreaking.value = true;
  }

  void nextStep() {
    step.value = step.value + 1;
    print('nextStep-------: ${step.value}');
    if (step.value == 4) {
      breakingNewsBreaking.value = false;
    }
    if (step.value == 5) {
      _canPop = true;
      update(['team_battle']);
    }
  }

  static get canPop => _canPop;

  @override
  void onClose() {
    subscription?.cancel();
    _timer?.cancel();
    Get.delete<TeamBattleV2Controller>();
    super.onClose();
  }
}
