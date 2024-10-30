import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class LeaguePage extends StatelessWidget {
  const LeaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalNestedKey.LEAGUESTabGlobalKey,
      initialRoute: RouteNames.league,
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case RouteNames.league:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                page: () => const LeagueIndexPage(),
                binding: LeagueBinding());
          case RouteNames.mineMineInfo:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                page: () => const MineInfoPage(),
                binding: MineInfoBinding());
          case RouteNames.mineMineSetting:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                page: () => const MineSettingPage(),
                binding: MineSettingBinding());
          case RouteNames.mineMineAccount:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                page: () => const MineAccountPage(),
                binding: MineAccountBinding());
        }
      },
    );
  }
}

class LeagueIndexPage extends GetView<LeagueController> {
  const LeagueIndexPage({super.key});

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeagueController>(builder: (_) {
      return const BlackAppWidget(
        UserInfoBar(
          title: "COMMUNITIES",
          routeId: GlobalNestedKey.LEAGUES,
        ),
        bodyWidget: Expanded(
          child: Center(
            child: LoadStatusWidget(
              text: "COMING SOON...",
            ),
          ),
        ),
      );
    });
  }
}
