/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-25 11:48:38
 * @LastEditTime: 2025-01-13 16:02:27
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-12 16:53:47
 * @LastEditTime: 2024-09-24 10:57:13
 */
import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/team_mission_entity.dart';
import 'package:arm_chair_quaterback/common/entities/web_socket/web_socket_entity.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/mine.dart';
import 'package:arm_chair_quaterback/common/net/index.dart';
import 'package:arm_chair_quaterback/common/services/websocket_services.dart';
import 'package:arm_chair_quaterback/common/utils/platform_file_manager.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/getx_builder_ids.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/tab_item_info.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/user_entiry.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/user.dart';
import 'package:arm_chair_quaterback/common/services/services.dart';
import 'package:arm_chair_quaterback/common/store/user.dart';
import 'package:arm_chair_quaterback/common/utils/device_utils.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/inbox/index.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/view.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/index.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/view.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  late PageController pageController;
  RxInt tabIndex = 2.obs;
  Map<int, GlobalKey<NavigatorState>?> navigatorKeys = {
    0: GlobalNestedKey.PicksTabGlobalKey,
    1: GlobalNestedKey.LEAGUESTabGlobalKey,
    2: GlobalNestedKey.NewsTabGlobalKey,
    3: GlobalNestedKey.TeamTabGlobalKey,
    4: GlobalNestedKey.TRADETabGlobalKey,
  };

  UserEntity userEntiry = UserEntity();

  /// 未完成任务列表(进行中的任务)
  List<TeamMissionEntity> ongoingTaskList = [];

  refreshMoneyCoinWidget() async {
    await refreshUserEntity();
    update([GetXBuilderIds.idMoneyAndCoinWidget]);
  }

  GlobalKey<NavigatorState>? getCurrentTabGlobalKey() {
    return navigatorKeys[tabIndex.value];
  }

  List<TabItemInfo> tabItems = [
    TabItemInfo(
      LangKey.gameTabNews.tr,
      Assets.commonUiCommonTabBottom01Off,
      Assets.commonUiCommonTabBottom01On,
      const NewsPage(),
    ),
    TabItemInfo(
      LangKey.gametabScores.tr,
      Assets.commonUiCommonTabBottom02Off,
      Assets.commonUiCommonTabBottom02On,
      const LeaguePage(),
    ),
    TabItemInfo(
      LangKey.gameTabManager.tr,
      Assets.commonUiCommonTabBottom03,
      Assets.commonUiCommonTabBottom03,
      const TeamIndexPage(),
    ),
    TabItemInfo(
      LangKey.gametabPicks.tr,
      Assets.commonUiCommonTabBottom04Off,
      Assets.commonUiCommonTabBottom04On,
      const PicksIndex(),
    ),
    TabItemInfo(
      LangKey.gameTabInbox.tr,
      Assets.commonUiCommonTabBottom05Off,
      Assets.commonUiCommonTabBottom05On,
      const InboxPage(),
    ),
  ];

  /*List<TabItemInfo> tabItems = [
    TabItemInfo(
      "Picks",
      Assets.commonUiCommonTabBottom01Off,
      Assets.commonUiCommonTabBottom01On,
      const PicksIndex(),
    ),
    TabItemInfo(
      "Scores",
      Assets.commonUiCommonTabBottom02Off,
      Assets.commonUiCommonTabBottom02On,
      const LeaguePage(),
    ),
    TabItemInfo(
      "NBA",
      Assets.commonUiCommonTabBottom03,
      Assets.commonUiCommonTabBottom03,
      const NewsPage(),
    ),
    TabItemInfo(
      "Manager",
      Assets.commonUiCommonTabBottom04Off,
      Assets.commonUiCommonTabBottom04On,
      const TeamIndexPage(),
    ),
    TabItemInfo(
      "Portfolio",
      Assets.commonUiCommonTabBottom05Off,
      Assets.commonUiCommonTabBottom05On,
      const TradeIndex(),
    ),
  ];*/

  RxBool isHide = false.obs;

  @override
  void onInit() {
    super.onInit();
    // auth();
    pageController = PageController(initialPage: 2);
    // 监听 TabController 的页面改变，更新 tabIndex
    // tabController.addListener(() {
    //   tabIndex.value = tabController.index;
    //   tabController.animateTo(tabController.index);
    //   update();
    // });
  }

  @override
  void onReady() {
    super.onReady();
    // UserStore.to.setToken("");
    login();
    CacheApi.init();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onTap(v) {
    tabIndex.value = v;
    pageController.jumpToPage(v);
    update();
  }

  Future<UserEntity> refreshUserEntity() async {
    var teamLoginInfo = await UserApi.getTeamLoginInfo();
    userEntiry = UserEntity(teamLoginInfo: teamLoginInfo);
    return userEntiry;
  }

  ///鉴权、获取用户信息
  Future login() async {
    await UserStore.to.setToken("");
    String accountName = await getUid();
    int serviceId = 0;
    String userIp = "192.168.12.46";
    int id = 7;
    String v = await UserApi.auth(
      accountName: accountName,
      serviceId: serviceId,
      userIp: userIp,
      id: id,
    );
    await UserStore.to.setToken(v);
    Log.d("用户=$accountName ，鉴权获取到token=$v，开始游客登陆");
    userEntiry = await UserApi.visitorLogin();
    WSInstance.init();
    getOngoingDailyTaskList();
    update([GetXBuilderIds.idGlobalUserEntityRefresh]);
  }

  Future<String> getUid() async {
    String accountName = StorageService.to.getString(Constant.deviceId);
    // accountName = await DeviceUtils.getDeviceId();
    if (ObjectUtil.isEmpty(accountName)) {
      accountName = (await PlatformFileManager.readUuid()) ?? "";
      if (ObjectUtil.isEmpty(accountName)) {
        accountName = await DeviceUtils.getDeviceId();
      }
    }

    Log.d("deviceId=$accountName");
    return accountName;
  }

  PropDefineEntity? getPropInfo(int id) {
    if (CacheApi.propDefineList!.where((e) => e.propId == id).isEmpty) {
      return null;
    }
    PropDefineEntity? item =
        CacheApi.propDefineList?.where((e) => e.propId == id).first;
    return item;
  }

  updateTeamProp() async {
    await UserApi.getTeamProp().then((v) {
      HomeController.to.userEntiry.teamLoginInfo!.teamPropList = v;
      HomeController.to.update([GetXBuilderIds.idMoneyAndCoinWidget]);
    });
  }

  void updateMoney() async {
    // for (var element
    //     in HomeController.to.userEntiry.teamLoginInfo!.teamPropList!) {
    //   if (element.propId == 102) {
    //     element.num = element.num! + change;
    //   }
    // }
    updateTeamProp();
  }

  // bool updateCashAndChips(int change) {
  //   for (var element
  //       in HomeController.to.userEntiry.teamLoginInfo!.teamPropList!) {
  //     if (element.propId == 103) {
  //       if (change < 0 && element.num! < change.abs()) {
  //         EasyLoading.showToast("Not enough coins");
  //         return false;
  //       }
  //     } else if (element.propId == 102) {
  //       if (change < 0 && element.num! < change.abs()) {
  //         EasyLoading.showToast("Not enough cash");
  //         return false;
  //       }
  //     }
  //   }
  //   updateTeamProp();
  //   return true;
  // }

  int getTeamId() {
    int teamId = HomeController.to.userEntiry.teamLoginInfo?.team?.teamId ?? 0;
    return teamId;
  }

  Future<void> getOngoingDailyTaskList() async {
    var result = await Future.wait([
      MineApi.getTeamMissionList(2),
      MineApi.getTeamMissionList(3),
    ]);
    List<TeamMissionEntity> list = [...result[0], ...result[1]];
    ongoingTaskList = list.where((e) => e.status != 3).toList();
    update([GetXBuilderIds.idGlobalUserEntityRefresh]);
  }
}
