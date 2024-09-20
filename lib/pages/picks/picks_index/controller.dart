import 'package:arm_chair_quaterback/common/entities/guess_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PicksIndexController extends GetxController {
  PicksIndexController();

  final state = PicksIndexState();
  late ScrollController scrollController = ScrollController();
  final GlobalKey targetKey = GlobalKey(); // 用来标记目标 widget
  var isSelfInfoFloatShow = false.obs; //竞猜榜单自己的信息浮窗是否显示

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  // 滚动监听器
  void _scrollListener() {
    // 获取目标 widget 的 RenderObject
    final targetContext = targetKey.currentContext;
    if (targetContext != null) {
      final box = targetContext.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero); // 获取目标在屏幕中的位置
      final targetOffset = position.dy;

      final screenHeight = Get.height;

      // 比较目标的相对位置和滚动位置，确保检测到精确的进入和离开时机
      if (targetOffset <= screenHeight) {
        if (!isSelfInfoFloatShow.value) {
          isSelfInfoFloatShow.value = true;
          update();
          print('已经到达目标 Widget');
        }
      } else {
        if (isSelfInfoFloatShow.value) {
          isSelfInfoFloatShow.value = false;
          update();
          print('离开目标 Widget');
        }
      }
    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);

    Future.wait([
      PicksApi.getGuessInfos(),
      PicksApi.getNBAPlayerInfo(),
      PicksApi.getNewsDefine()
    ]).then((results) {
      GuessInfosEntity guessInfosEntity = results[0] as GuessInfosEntity;
      NbaPlayerInfosEntity nbaPlayerInfosEntity =
          results[1] as NbaPlayerInfosEntity;
      NewsDefineEntity newsDefineEntity = results[2] as NewsDefineEntity;
      for (GuessInfosGuessInfos e in guessInfosEntity.guessInfos) {}
    });
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
}

// class PicksPlayer {
//   NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList baseInfoList;
//   NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList dataAvgList;
//   List<String>? cBetData;
//   List<String>? pfBetData;
//   List<String>? pgBetDate;
//   List<String>? sfBetData;
//   List<String>? sgBetData;
// }
