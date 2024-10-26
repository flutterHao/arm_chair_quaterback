import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HistoryController extends GetxController {
  HistoryController(this.playerId);

  final int playerId;


  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> tileKeys = List.generate(10, (index) => GlobalKey());
  final List<String> items = List.generate(10, (index) => "Item $index");


  Map<String ,List> data = {};

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
  }

  getData(int season){
    var futures = <dynamic>[
      PicksApi.getNBAPlayerSeasonGameData(playerId, season, 1, 60)
    ];
    futures.add(CacheApi.getNBATeamDefine(getList: true));
    Future.wait(futures as Iterable<Future>).then((result){

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
