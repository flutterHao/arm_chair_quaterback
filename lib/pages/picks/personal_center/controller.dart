import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PersonalCenterController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PersonalCenterController(this.teamId);

  final int teamId;


  final state = PersonalCenterState();

  List<String> titles = ["Game", "Picks", "Comments"];

  late TabController tabController;

  TeamSimpleEntity? teamSimpleEntity;
  var loadStatus = LoadDataStatus.loading.obs;

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
    tabController =
        TabController(length: titles.length, vsync: this, initialIndex: 1);
    getData();
  }

  getData() {
    loadStatus.value = LoadDataStatus.loading;
    PicksApi.getTeamSimple(teamId).then((result){
      loadStatus.value = LoadDataStatus.success;
      teamSimpleEntity = result;
      update([idPersonalCenterMain]);
    },onError: (e){
      loadStatus.value = LoadDataStatus.error;
    });
  }

  static String get idPersonalCenterMain => "id_personal_center";

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
