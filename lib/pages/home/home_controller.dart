/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-25 11:48:38
 * @LastEditTime: 2024-11-07 18:17:34
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-12 16:53:47
 * @LastEditTime: 2024-09-24 10:57:13
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
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
import 'package:arm_chair_quaterback/pages/league/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/view.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/index.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/view.dart';
import 'package:arm_chair_quaterback/pages/trade/trade_index/view.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  late PageController pageController;
  RxInt tabIndex = 0.obs;
  Map<int, GlobalKey<NavigatorState>?> navigatorKeys = {
    0: GlobalNestedKey.NewsTabGlobalKey,
    1: GlobalNestedKey.PicksTabGlobalKey,
    2: GlobalNestedKey.TeamTabGlobalKey,
    3: GlobalNestedKey.TRADETabGlobalKey,
    4: GlobalNestedKey.LEAGUESTabGlobalKey,
  };

  UserEntity userEntiry = UserEntity();

  refreshMoneyCoinWidget() async {
    await refreshUserEntity();
    update([GetXBuilderIds.idMoneyAndCoinWidget]);
  }

  GlobalKey<NavigatorState>? getCurrentTabGlobalKey() {
    return navigatorKeys[tabIndex.value];
  }

  List<TabItemInfo> tabItems = [
    TabItemInfo(
      "Picks",
      Assets.uiIconPicks_01Png,
      Assets.uiIconPicks_01Png,
      const PicksIndex(),
    ),
    TabItemInfo(
      "Scores",
      Assets.uiIconTraining_01Png,
      Assets.uiIconTraining_01Png,
      const TradeIndex(),
    ),
    TabItemInfo(
      "NBA",
      Assets.uiIconNews_01Png,
      Assets.uiIconNews_01Png,
      const NewsPage(),
    ),
    TabItemInfo(
      "Manager",
      Assets.uiIconTeam_01Png,
      Assets.uiIconTeam_01Png,
      const TeamIndexPage(),
    ),
    TabItemInfo(
      "Portfolio",
      Assets.uiIconCommunity_01Png,
      Assets.uiIconCommunity_01Png,
      const LeaguePage(),
    ),
  ];

  RxBool isHide = false.obs;

  @override
  void onInit() {
    super.onInit();
    // auth();
    pageController = PageController();
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
    update([GetXBuilderIds.idGlobalUserEntityRefresh]);
  }

  Future<String> getUid() async {
    String accountName = StorageService.to.getString(Constant.deviceId);
    accountName = await DeviceUtils.getDeviceId();
    // if (ObjectUtil.isEmpty(accountName)) {
    //   accountName = await DeviceUtils.getDeviceId();
    // }

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
}
