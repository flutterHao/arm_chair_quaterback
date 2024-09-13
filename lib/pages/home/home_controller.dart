/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-12 16:53:47
 * @LastEditTime: 2024-09-13 17:26:35
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/tab_item_info.dart';
import 'package:arm_chair_quaterback/common/net/apis/user.dart';
import 'package:arm_chair_quaterback/common/store/user.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/view.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/net/index.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxInt tabIndex = 0.obs;
  Map<int, GlobalKey<NavigatorState>?> navigatorKeys = {
    0: GlobalNestedKey.NewsTabGlobalKey,
    1: GlobalNestedKey.PicksTabGlobalKey,
  };

  GlobalKey<NavigatorState>? getCurrentTabGlobalKey() {
    return navigatorKeys[tabIndex.value];
  }

  List<TabItemInfo> tabItems = [
    TabItemInfo(
      "NEWS",
      Assets.news_2Png,
      Assets.new_1Png,
      const NewsPage(),
    ),
    TabItemInfo(
      "PICKS",
      Assets.slot_2Png,
      Assets.slot_1Png,
      const PicksIndex(),
    ),
    TabItemInfo(
      "TRAINING",
      Assets.trade_2Png,
      Assets.trade_1Png,
      Container(),
    ),
    TabItemInfo(
      "TEAM",
      Assets.ball_2Png,
      Assets.ball_1Png,
      const PicksIndex(),
    ),
    TabItemInfo(
      "LEAGUES",
      Assets.trade_2Png,
      Assets.trade_1Png,
      const PicksIndex(),
    ),
  ];

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: tabItems.length, vsync: this);
    // 监听 TabController 的页面改变，更新 tabIndex
    // tabController.addListener(() {
    //   tabIndex.value = tabController.index;
    //   tabController.animateTo(tabController.index);
    //   update();
    // });
  }

  void onTap(v) {
    tabIndex.value = v;
    tabController.animateTo(v);
    update();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void auth() {
    UserApi.auth().then((v) {
      UserStore().setToken(v);
    });
  }
}
