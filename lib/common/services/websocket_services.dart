import 'dart:async';

import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/team_mission_entity.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_prop_list.dart';
import 'package:arm_chair_quaterback/common/entities/web_socket/web_socket_entity.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/top_toast_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box_simple/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/2/7/17:16

class WebsocketServices extends GetxService {
  static final List<ToastItem> _queue = [];
  static ToastItem? _showing;
  late StreamSubscription<ResponseMessage> subscription;
  static late AppLifecycleListener appLifecycleListener;
  static AppLifecycleState appLifecycleState = AppLifecycleState.resumed;
  static bool _resumed = true;

  @override
  void onInit() {
    super.onInit();
    subscription = WSInstance.stream.listen((result) {
      if (result.serviceId == Api.wsTeamPropUpdated) {
        print('HomeController--event--wsTeamPropUpdated-----------');
        List<TeamPropList> list = (result.payload as List)
            .map((e) => TeamPropList.fromJson(e))
            .toList();
        propUpdated(list);
      }
      if (result.serviceId == Api.wsMissionUpdate) {
        return;
        print('HomeController--event--wsMissionUpdate-----------');
        TeamMissionEntity teamMissionEntity =
            TeamMissionEntity.fromJson(result.payload);
        missionUpdated(teamMissionEntity);
      }
      if (result.serviceId == Api.wsTeamPlayerBatchUpdated) {
        print('HomeController--event--wsTeamPlayerBatchUpdated-----------');
      }
      if (result.serviceId == Api.wsTeamPlayerUpdated) {
        print('HomeController--event--wsTeamPlayerUpdated-----------');
        // TeamController.to.initData();
      }
    });
    appLifecycleListener =
        AppLifecycleListener(onStateChange: (AppLifecycleState state) {
      print('WebsocketServices App $state');
      appLifecycleState = state;
      if (state == AppLifecycleState.resumed) {
        /// 页面可见状态下，激活队列
        _next();
      }
    });
  }

  missionUpdated(TeamMissionEntity teamMissionEntity) async {
    await CacheApi.getMissionDefine();
    var missionDefineEntity = CacheApi.missionDefineList.firstWhereOrNull(
        (e) => e.missionDefineId == teamMissionEntity.missionDefineId);
    if (missionDefineEntity == null) {
      return;
    }

    ///刷新首页任务完成状态
    Get.find<HomeController>().getOngoingDailyTaskList();
    if (teamMissionEntity.status == 2) {
      add(ToastItem(
          widget: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              13.hGap,
              IconWidget(iconWidth: 43.w, icon: Assets.commonUiCommonIconTask),
              13.hGap,
              Expanded(
                  child: Text(
                "${missionDefineEntity.desc} is Completed",
                maxLines: 2,
                textAlign: TextAlign.start,
                style: 18.w5(
                  color: AppColors.c000000,
                  height: 1,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: FontFamily.fOswaldMedium,
                ),
              )),
              40.hGap,
              IconWidget(
                iconWidth: 7.w,
                icon: Assets.commonUiCommonIconSystemJumpto,
                iconColor: AppColors.c000000,
              ),
              16.hGap,
            ],
          ),
          canTap: true));
    }
  }

  propUpdated(List<TeamPropList> result) async {
    await CacheApi.getPropDefine();
    TrainingController trainingCtrl = Get.find<TrainingController>();

    for (int i = 0; i < result.length; i++) {
      TeamPropList teamProp = result[i];
      var isBall = teamProp.propId == Constant.propBallId;
      var isLuckyCoin = teamProp.propId == Constant.propLuckyCoinId;
      var isMoney = teamProp.propId == Constant.propMoneyTickId;
      var isBetCoin = teamProp.propId == Constant.propBetCoinId;
      var isPlayer = CacheApi.propDefineMap[teamProp.propId]?.propType == 2;

      ///如果在slot并且不是球员卡包，取消推送奖励表达
      if (trainingCtrl.isPlaying.value && !isPlayer) return;
      // if (isLuckyCoin) {
      //   try {
      //     var luckyCoinNum = Get.find<HomeController>()
      //         .userEntiry
      //         .teamLoginInfo!
      //         .getLuckyCoin();
      //     if (luckyCoinNum < teamProp.num!) {
      //       addProp(teamProp, "${teamProp.num! - luckyCoinNum}",
      //           EventType.luckyCoin);
      //     }
      //   } catch (e) {
      //     print('TrainingController not init');
      //   }
      // }
      if (isBall) {
        try {
          var ballNum =
              Get.find<HomeController>().userEntiry.teamLoginInfo!.getBall();
          if (ballNum < teamProp.num!) {
            addProp(teamProp, "${teamProp.num! - ballNum}", EventType.ball);
          }
        } catch (e) {
          print('TrainingController not init');
        }
      }
      if (isMoney) {
        var money =
            Get.find<HomeController>().userEntiry.teamLoginInfo!.getMoney();
        print('teamProp:${teamProp.toJson()},$money');
        if (money < teamProp.num!) {
          addProp(teamProp, "${teamProp.num! - money}k", EventType.moneyTick);
        }
      }
      // if (isBetCoin) {
      //   var betCoin =
      //       Get.find<HomeController>().userEntiry.teamLoginInfo!.getCoin();
      //   if (betCoin < teamProp.num!) {
      //     addProp(teamProp, "${teamProp.num! - betCoin}", EventType.betCoin);
      //   }
      // }

      ///球员卡包 暂时去掉
      // if (isPlayer && teamProp.num! > 0) {
      //   if (!Get.isRegistered<OpenBoxSimpleController>()) {
      //     Get.put(OpenBoxSimpleController());
      //   }
      //   OpenBoxSimpleController controller = Get.find();
      //   await controller.toOpenBoxPage(teamProp.propId!);
      // }
    }
    var hasBall =
        result.where((e) => e.propId == Constant.propBallId).isNotEmpty;
    var hasLuckyCoin =
        result.where((e) => e.propId == Constant.propLuckyCoinId).isNotEmpty;
    var hasMoney =
        result.where((e) => e.propId == Constant.propMoneyTickId).isNotEmpty;
    var hasBetCoin =
        result.where((e) => e.propId == Constant.propBetCoinId).isNotEmpty;
    if (hasBall) {
      try {
        int ballNum =
            result.where((e) => e.propId == Constant.propBallId).first.num!;
        Get.find<TrainingController>().ballNum.value = ballNum;
        Get.find<TrainingController>().trainingInfo.prop.num = ballNum;
      } catch (e) {
        print('TrainingController not init');
      }
    }

    if (hasMoney || hasBetCoin || hasLuckyCoin || hasBall) {
      // Get.find<HomeController>().refreshMoneyCoinWidget();
    }
  }

  void addProp(TeamPropList teamProp, String n, EventType type) {
    var propItem =
        CacheApi.propDefineList!.firstWhere((e) => e.propId == teamProp.propId);
    String text = "YOU GOT $n ${propItem.propName}";
    add(ToastItem(
        widget: Row(
          children: [
            IconWidget(
                iconWidth: 34.w, icon: Utils.getImageByPropId(propItem.propId)),
            16.hGap,
            Text(
              text,
              style: 18.w5(
                color: AppColors.c000000,
                height: 1,
                fontFamily: FontFamily.fOswaldMedium,
              ),
            )
          ],
        ),
        type: type));
  }

  static void _onEnd() {
    // print('websocket-services--onEnd-----');
    _showing = null;
    _next();
  }

  static void _next() {
    ///页面非可见状态下不提示
    if (appLifecycleState != AppLifecycleState.resumed) {
      return;
    }
    if (!_resumed) {
      return;
    }
    if (_queue.isNotEmpty && _showing == null) {
      _showing = _queue.removeAt(0);
      // print('websocket-services--show-----');
      _show(_showing!);
    }
  }

  void add(ToastItem item) {
    if (item.type != null) {
      _queue.removeWhere((e) => e.type == item.type);
    }
    _queue.add(item);
    _next();
  }

  static void _show(ToastItem item) {
    SoundServices.to.playSound(Assets.soundNotfication);
    Widget child = Center(
      child: Container(
        height: 61.w,
        width: 355.w,
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        margin: EdgeInsets.only(bottom: 9.w),
        decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(9.w),
            boxShadow: [
              BoxShadow(
                color: AppColors.c000000.withOpacity(0.2),
                offset: Offset.zero,
                blurRadius: 4.w,
                spreadRadius: 4.w,
              )
            ]),
        child: item.widget,
      ),
    );
    if (item.canTap == true) {
      child = InkWell(
        onTap: () {
          if (!Get.isRegistered<TeamBattleController>()) {
            Get.toNamed(RouteNames.mineDailyTask);
          }
        },
        child: child,
      );
    }
    if (item.type != null) {
      Get.find<HomeController>().refreshMoneyCoinWidget();
    }
    showTopToastDialog(
        needBg: false,
        duration: const Duration(seconds: 2),
        onEnd: _onEnd,
        child: Container(margin: EdgeInsets.only(top: 44.w), child: child));
  }

  /// 启动
  static void resumed() {
    _resumed = true;
    _next();
  }

  /// 暂停
  static void pause() {
    _resumed = false;
  }

  @override
  void onClose() {
    subscription.cancel();
    appLifecycleListener.dispose();
    super.onClose();
  }
}

class ToastItem {
  final Widget widget;
  final EventType? type;
  final bool canTap;

  ToastItem({required this.widget, this.type, this.canTap = false});
}

enum EventType {
  moneyTick,
  betCoin,
  luckyCoin,
  ball,
}
