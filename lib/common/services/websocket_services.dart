import 'dart:async';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/mission_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_mission_entity.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_prop_list.dart';
import 'package:arm_chair_quaterback/common/entities/web_socket/web_socket_entity.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/award_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/top_toast_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/2/7/17:16

class WebsocketServices extends GetxService {
  final List<ToastItem> _queue = [];
  ToastItem? _showing;
  StreamSubscription<ResponseMessage>? subscription;

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
      )));
    }
  }

  propUpdated(List<TeamPropList> result) async {
    await CacheApi.getPropDefine();

    for (int i = 0; i < result.length; i++) {
      TeamPropList teamProp = result[i];
      var isBall = teamProp.propId == 306;
      //todo 后端需要给是不是增加的逻辑判断
      var isLuckyCoin = teamProp.propId == 201;
      var isMoney = teamProp.propId == 102;
      var isBetCoin = teamProp.propId == 103;
      if (isBall) {
        try {
          var ballNum = Get.find<TrainingController>().ballNum.value;
          if (ballNum < teamProp.num!) {
            addProp(teamProp,"${teamProp.num!-ballNum}",EventType.ball);
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
          addProp(teamProp,"${teamProp.num!-money}k",EventType.moneyTick);
        }
      }
      if (isBetCoin) {
        var betCoin =
            Get.find<HomeController>().userEntiry.teamLoginInfo!.getCoin();
        if (betCoin < teamProp.num!) {
          addProp(teamProp,"${teamProp.num!-betCoin}",EventType.betCoin);
        }
      }
    }
    var hasBall = result.where((e) => e.propId == 306).isNotEmpty;
    var hasLuckyCoin = result.where((e) => e.propId == 201).isNotEmpty;
    var hasMoney = result.where((e) => e.propId == 102).isNotEmpty;
    var hasBetCoin = result.where((e) => e.propId == 103).isNotEmpty;
    if (hasBall) {
      try {
        Get.find<TrainingController>().getData();
      } catch (e) {
        print('TrainingController not init');
      }
    }

    if (hasMoney || hasBetCoin) {
      Get.find<HomeController>().refreshMoneyCoinWidget();
    }
  }

  void addProp(TeamPropList teamProp, String n,EventType type) {
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
      type: type
    ));
  }

  onEnd() {
    // print('websocket-services--onEnd-----');
    _showing = null;
    next();
  }

  void next() {
    if (_queue.isNotEmpty && _showing == null) {
      _showing = _queue.removeAt(0);
      // print('websocket-services--show-----');
      show(_showing!);
    }
  }

  void add(ToastItem item) {
    if (item.type != null) {
      _queue.removeWhere((e) => e.type == item.type);
    }
    _queue.add(item);
    next();
  }

  void show(ToastItem item) {
    showTopToastDialog(
        needBg: false,
        duration: const Duration(seconds: 2),
        onEnd: onEnd,
        child: Container(
            margin: EdgeInsets.only(top: 44.w),
            child: InkWell(
              onTap: () => Get.toNamed(RouteNames.mineDailyTask),
              child: Center(
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
              ),
            )));
  }

  @override
  void onClose() {
    subscription?.cancel();
    super.onClose();
  }
}

class ToastItem {
  final Widget widget;
  final EventType? type;

  ToastItem({required this.widget, this.type});
}

enum EventType {
  moneyTick,
  betCoin,
  luckyCoin,
  ball,
}
