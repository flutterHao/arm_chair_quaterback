import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:extended_image/extended_image.dart';
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
    Assets.uiHead_01Png,
    Assets.uiHead_02Png,
    Assets.uiHead_03Png,
    Assets.uiHead_04Png,
    Assets.uiHead_05Png,
    Assets.uiHead_06Png,
    Assets.uiHead_07Png,
    Assets.uiHead_08Png,
    Assets.uiHead_09Png,
    Assets.uiHead_10Png,
    Assets.uiHead_11Png,
    Assets.uiHead_12Png,
  ];

  late String meAvatar;
  late String opponentAvatar;
  var breakingNewsBreaking = false.obs;
  double ovr = 75;

  late BattleEntity battleEntity;

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

  teamMatch(){
    var startMatchTimeMs = DateTime.now().millisecondsSinceEpoch;
    var minMatchTimeMs = 3000;
    TeamApi.teamMatch().then((result){
      battleEntity = result;
      var currentMs = DateTime.now().millisecondsSinceEpoch;
      var diff = currentMs - startMatchTimeMs;
      if(diff >= minMatchTimeMs){
        nextStep();
      }else{
        Future.delayed(Duration(milliseconds: minMatchTimeMs-diff), () {
          nextStep();
        });
      }
    },onError: (e){
      EasyLoading.showToast("MATCH FAILED");
      Get.back();
    });
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
}
