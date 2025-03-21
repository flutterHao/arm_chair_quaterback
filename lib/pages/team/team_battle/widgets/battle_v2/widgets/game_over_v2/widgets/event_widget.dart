import 'dart:async';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/constant/getx_builder_ids.dart';
import 'package:arm_chair_quaterback/common/entities/receive_prop_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/services/websocket_services.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/money_income_animation.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/3/19/14:58

class EventWidget extends StatefulWidget {
  const EventWidget(
      {super.key, required this.type, this.onEnd, this.home = false});

  /// eventType : 1 偷钱 2 偷球员
  final int type;

  final bool? home;

  /// success：偷球员/发钞票完成
  final Function(bool finish)? onEnd;

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget>
    with SingleTickerProviderStateMixin {
  bool finish = false;
  GlobalKey? globalKey;
  OverlayEntry? overlayEntry;
  ReceivePropEntity? receivePropEntity;

  @override
  void initState() {
    super.initState();
    if (widget.type == 1) {
      globalKey = GlobalKey();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MtInkWell(
      onTap: () async {
        if(!Utils.canOperate()) return;
        if (finish) return;
        if (widget.type == 2) {
          SoundServices.to.playSound(Assets.soundStealPlayer);
          finish = await Get.toNamed(RouteNames.stealPlayer);
          SoundServices.to.stopAllSounds();
          widget.onEnd?.call(finish);
        } else {
          WebsocketServices.pause();
          finish = await getNewsEventAward();
          if (finish) {
            SoundServices.to.playSound(Assets.soundMoneyGet);
            overlayEntry = OverlayEntry(builder: (BuildContext context) {
              var width = 150;
              var size = MediaQuery.of(context).size;
              var padding = MediaQuery.of(context).padding;
              var top = padding.top + 47 / 2.w - 11.w;
              Offset offset = widget.home == true
                  ? Offset(16.w + 36.w + 14.w, top)
                  : Offset(size.width - 16.w - 14.w - 50.w, top);
              return SizedBox(
                child: MoneyIncomeAnimation(
                  randRect: Rect.fromLTWH(
                      (size.width - width.w) / 2, 300.h, width.w, width.w),
                  childSize: Size(28.w, 22.w),
                  targetPosition: offset,
                  count: 50,
                  childWidget: IconWidget(
                      iconWidth: 28.w,
                      fit: BoxFit.fitWidth,
                      iconHeight: 22.w,
                      icon: Assets.commonUiCommonProp05),
                  onEnd: () async {
                    print('onEnd------------');
                    if (overlayEntry != null) {
                      var homeController = Get.find<HomeController>();
                      homeController.userEntiry.teamLoginInfo?.setMoney(
                          (homeController.userEntiry.teamLoginInfo
                                          ?.getMoney() ??
                                      0)
                                  .toInt() +
                              (receivePropEntity?.num ?? 0));
                      homeController
                          .update([GetXBuilderIds.idMoneyAndCoinWidget]);
                      await Future.delayed(Duration(milliseconds: 500));
                      overlayEntry?.remove();
                      overlayEntry = null;
                      widget.onEnd?.call(finish);
                    }
                  },
                ),
              );
            });
            Overlay.of(Get.context!).insert(overlayEntry!);
          }
          Future.delayed(const Duration(seconds: 3)).then((v) {
            WebsocketServices.resumed();
          });
        }
      },
      child: Row(
        children: [
          Container(
            width: 105.w,
            height: 71.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.w),
                color: AppColors.c000000),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              alignment: Alignment.center,
              children: [
                OutlinedText(
                  text: "EVENT",
                  textStyle: 42.w5(
                      color: AppColors.c000000,
                      fontFamily: FontFamily.fOswaldMedium),
                  strokeColor: AppColors.c4c4c4c,
                  strokeWidth: 1.w,
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: IconWidget(
                      icon: Assets.managerUiMangerNew22,
                      iconWidth: 33.w,
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: IconWidget(
                      icon: Assets.managerUiMangerNew21,
                      iconWidth: 33.w,
                    )),
                SizedBox(
                  key: globalKey,
                  child: IconWidget(
                    icon: widget.type == 1
                        ? Assets.managerUiMangerNew215
                        : Assets.managerUiManagerFreegift01,
                    iconHeight: 46.w,
                  ),
                )
              ],
            ),
          ),
          12.hGap,
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FEATURED UPCOMING EVENTS",
                style: 16.w5(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fOswaldMedium,
                ),
              ),
              7.vGap,
              Text(
                "Click trigger",
                style: 14.w4(
                  color: AppColors.c000000.withOpacity(0.5),
                  height: 1,
                  fontFamily: FontFamily.fRobotoRegular,
                ),
              )
            ],
          )),
          IconWidget(
            iconWidth: 8.w,
            icon: Assets.commonUiCommonIconSystemJumpto,
            iconColor: AppColors.c000000,
          )
        ],
      ),
    );
  }

  Future<bool> getNewsEventAward() {
    Completer<bool> completer = Completer();
    TeamApi.getNewsEventAward().then((res) {
      receivePropEntity = res.first;
      completer.complete(true);
    }, onError: (e) {
      ErrorUtils.toast(e);
      completer.complete(false);
    });
    return completer.future;
  }

  @override
  void dispose() {
    overlayEntry?.remove();
    super.dispose();
  }
}
