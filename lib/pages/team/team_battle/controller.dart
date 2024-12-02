import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/web_socket/web_socket_entity.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
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

  ///测试数据，需删除

  @override
  void onInit() {
    super.onInit();
    step.value = 1;
    _canPop = false;
    meAvatar = totalAvatars[Random().nextInt(totalAvatars.length - 1)];
    totalAvatars.remove(meAvatar);
    opponentAvatar = totalAvatars[Random().nextInt(totalAvatars.length - 1)];

    ///todo 测试代码
    // Future.delayed(const Duration(milliseconds: 3000), () {
    //   nextStep();
    // });
    teamMatch();
  }

  teamMatch() {
    subscription = WSInstance.teamMatch().listen((result){
      print('result.serviceId--:${result.serviceId}');
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
    super.onClose();
  }
}
