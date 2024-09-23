import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:get/get.dart';

import 'index.dart';

class ReciveRwardController extends GetxController {
  ReciveRwardController();

  List<List<ReciveAwardEntity>> guessHistoryList = [];
  final state = ReciveRwardState();

  NewsDefineEntity? newsDefineEntity;

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    _initData();
    PicksApi.getNewsDefine().then((result) {
      newsDefineEntity = result;
    });
  }

  void _initData() {
    PicksApi.getGuessInfos().then((result) {
      /// 剔除status为1（未开奖）的数据项
      guessHistoryList = result
          .where((e) =>
              (e.where((f) => f.guessData[0].status != 1).toList().isNotEmpty))
          .toList();
      update();
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

  /// 一键领取所有奖励
  getGuessAllAward() {
    PicksApi.getGuessAllAward().then((result){
      _initData();
    });
  }
}
