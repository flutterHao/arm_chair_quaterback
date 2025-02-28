/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-12 16:53:47
 * @LastEditTime: 2025-02-28 11:58:50
 */
import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/team_mission_entity.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/mine.dart';
import 'package:arm_chair_quaterback/common/widgets/scroll_hide_bottom_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/getx_builder_ids.dart';
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
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/view.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/view.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:common_utils/common_utils.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  late PageController pageController;
  ScrollHideBottomBarController scrollHideBottomBarController =
      ScrollHideBottomBarController();
  RxInt tabIndex = 2.obs;
  RxBool isAbsorbPointer = false.obs;

  UserEntity userEntiry = UserEntity();

  /// 未完成任务列表(进行中的任务)
  List<TeamMissionEntity> ongoingTaskList = [];
  RxDouble bottomBarY = 0.0.obs;

  refreshMoneyCoinWidget() async {
    await refreshUserEntity();
    update([GetXBuilderIds.idMoneyAndCoinWidget]);
  }

  List<TabItemInfo> tabItems = [
    TabItemInfo(
      LangKey.gameTabNews,
      Assets.commonUiCommonTabBottom01Off,
      Assets.commonUiCommonTabBottom01On,
      const NewsPage(),
    ),
    TabItemInfo(
      LangKey.gametabScores,
      Assets.commonUiCommonTabBottom02Off,
      Assets.commonUiCommonTabBottom02On,
      const LeaguePage(),
    ),
    TabItemInfo(
      LangKey.gameTabManager,
      Assets.commonUiCommonTabBottom03,
      Assets.commonUiCommonTabBottom03,
      const TeamIndexPage(),
    ),
    TabItemInfo(
      LangKey.gametabPicks,
      Assets.commonUiCommonTabBottom04Off,
      Assets.commonUiCommonTabBottom04On,
      const PicksIndex(),
    ),
    TabItemInfo(
      LangKey.gameTabInbox,
      Assets.commonUiCommonTabBottom05Off,
      Assets.commonUiCommonTabBottom05On,
      const InboxPage(),
    ),
  ];

  RxBool isHide = false.obs;

  late AppLifecycleListener _appLifecycleListener;

  @override
  void onInit() {
    super.onInit();
    // auth();
    // if (!Get.isRegistered<TeamController>()) {
    //   Get.put(TeamController(), permanent: true);
    // }
    // if (!Get.isRegistered<BeautyController>()) {
    //   Get.put(BeautyController(), permanent: true);
    // }
    // if (!Get.isRegistered<TrainingController>()) {
    //   Get.put(TrainingController(), permanent: true);
    // }
    // if (!Get.isRegistered<IllustratiionsController>()) {
    //   Get.put(IllustratiionsController(), permanent: true);
    // }
    Get.lazyPut(() => BeautyController());
    Get.lazyPut(() => TeamController());
    Get.lazyPut(() => TrainingController());
    Get.lazyPut(() => IllustratiionsController());
    pageController = PageController(initialPage: 2);
    // 监听 TabController 的页面改变，更新 tabIndex
    // tabController.addListener(() {
    //   tabIndex.value = tabController.index;
    //   tabController.animateTo(tabController.index);
    //   update();
    // });
    _appLifecycleListener = AppLifecycleListener(
      onResume: () {
        scrollHideBottomBarController.changeHideStatus(false);
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    // UserStore.to.setToken("");
    // login();
    CacheApi.init();
    WSInstance.init();
  }

  @override
  void onClose() {
    pageController.dispose();
    _appLifecycleListener.dispose();
    super.onClose();
  }

  void goto(int value) {
    tabIndex.value = value;
    pageController.jumpToPage(value);
    update();
  }

  void onTap(v) {
    if (v == tabIndex.value) {
      onSameItemTap();
      return;
    }
    tabIndex.value = v;
    pageController.jumpToPage(v);
    update();
  }

  void onSameItemTap() {
    if (tabIndex.value == 0) {
      Get.find<NewListController>().scrollToTop();
    } else if (tabIndex.value == 1) {
      Get.find<LeagueController>().scrollToTop();
    } else if (tabIndex.value == 2) {
      Get.find<TeamIndexController>().scrollToTop();
    } else if (tabIndex.value == 3) {
      Get.find<PicksIndexController>().scrollToTop();
    } else {
      Get.find<InboxController>().scrollToTop();
    }
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
    update([GetXBuilderIds.idGlobalUserEntityRefresh]);

    if (kReleaseMode) {
      /// 关联用户id
      FirebaseCrashlytics.instance
          .setUserIdentifier("${userEntiry.teamLoginInfo?.team?.teamId}");
    }
    getOngoingDailyTaskList();
  }

  Future<String> getUid() async {
    String accountName = StorageService.to.getString(Constant.deviceId);
    // accountName = await DeviceUtils.getDeviceId();
    if (ObjectUtil.isEmpty(accountName)) {
      accountName = await DeviceUtils.getDeviceId();
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
