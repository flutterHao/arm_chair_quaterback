import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/11/10:58

class LiveTextWidget extends StatefulWidget {
  const LiveTextWidget({super.key, this.isGameOverStatus = false, this.needTopMargin = true});

  final bool isGameOverStatus;
  final bool needTopMargin;

  @override
  State<LiveTextWidget> createState() => _LiveTextWidgetState();
}

class _LiveTextWidgetState extends State<LiveTextWidget> {
  late bool isGameOverStatus;

  late TeamBattleV2Controller controller;
  ScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    isGameOverStatus = widget.isGameOverStatus;
    controller = Get.find();
    if (isGameOverStatus) {
      scrollController = ScrollController();
      Future.delayed(Duration.zero, () {
        scrollController?.jumpTo(scrollController!.position.maxScrollExtent);
      });
    }
  }

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 329.w,
      margin: EdgeInsets.only(top: widget.needTopMargin?9.w:0),
      padding: EdgeInsets.only(bottom: 5.w),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          Container(
            height: 59.w,
            padding: EdgeInsets.only(left: 16.w),
            child: Obx(() {
              return Row(
                children:
                    List.generate(max(1, controller.quarter.value), (index) {
                  return Obx(() {
                    bool active = index == controller.liveTextTabIndex.value;
                    return TweenAnimationBuilder(
                        // 定义动画起始值和结束值
                        tween: Tween<double>(begin: 0.0, end: 1.0),
                        duration: const Duration(seconds: 2), // 动画时长
                        builder: (BuildContext context, double value,
                            Widget? child) {
                          return Opacity(
                            opacity: value,
                            child: Container(
                              width: 82.w,
                              height: 28.w,
                              margin: EdgeInsets.only(right: 5.w),
                              decoration: BoxDecoration(
                                  color: active
                                      ? AppColors.c000000
                                      : AppColors.cFFFFFF,
                                  borderRadius: BorderRadius.circular(14.w),
                                  border: Border.all(
                                      color: AppColors.c666666, width: 1.w)),
                              alignment: Alignment.center,
                              child: MtInkwell(
                                onTap: () {
                                  if (controller.liveTextTabIndex.value !=
                                      index) {
                                    controller.liveTextTabIndex.value = index;
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    Utils.getSortWithInt(index + 1),
                                    style: active
                                        ? 16.w5(
                                            color: AppColors.cFFFFFF,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fOswaldMedium)
                                        : 16.w4(
                                            color: AppColors.c000000,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fOswaldRegular),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  });
                }),
              );
            }),
          ),
          Divider(
            color: AppColors.cD1D1D1,
            height: 1.w,
          ),
          SizedBox(
            height: 44.w * 5,
            child: GetBuilder<TeamBattleV2Controller>(
                id: TeamBattleV2Controller.idLiveText,
                builder: (_) {
                  return Obx(() {
                    var value = controller.liveTextTabIndex.value;
                    var list =
                        controller.getQuarterEvents(quarterValue: value + 1);
                    var itemCount = list.length;
                    var currentTabIsLast =
                        (value + 1) == controller.quarter.value;
                    var addSize =
                        (currentTabIsLast && !controller.isGameOver.value
                            ? 1
                            : 0);
                    return MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: itemCount + addSize,
                          reverse: true,
                          controller: isGameOverStatus
                              ? scrollController
                              : currentTabIsLast
                                  ? controller.liveTextScrollController
                                  : ScrollController(),
                          itemBuilder: (context, i) {
                            if (i == 0 &&
                                currentTabIsLast &&
                                !controller.isGameOver.value) {
                              if (itemCount == 0) {
                                return SizedBox(
                                  height: 44.w * 5,
                                  child: const Center(
                                    child: LoadStatusWidget(
                                      loadDataStatus: LoadDataStatus.noData,
                                      text: "DATA COMING ...",
                                    ),
                                  ),
                                );
                              }
                              return SizedBox(height: 44.w * 5);
                            }
                            int index = i - addSize;
                            GameEvent item = list[index];
                            int time = item.time;
                            if (item.time == -1) {
                              double step = 40 / list.length;
                              var generateTime =
                                  (((list.length - index) * step) /
                                          40 *
                                          12 *
                                          60)
                                      .toInt();
                              time = generateTime;
                            }
                            return Container(
                              height: 44.w,
                              margin: EdgeInsets.symmetric(horizontal: 16.w),
                              padding: EdgeInsets.only(left: 1.w, right: 5.w),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: AppColors.cE6E6E6,
                                          width: 1.w))),
                              child: Row(
                                children: [
                                  Text(
                                    MyDateUtils.formatMS(time),
                                    style: 10.w4(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fRobotoRegular),
                                  ),
                                  10.hGap,
                                  Container(
                                    width: 28.w,
                                    height: 28.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.5.w),
                                        border: Border.all(
                                            color: controller.isSystemEvent(item)
                                                ? AppColors.cTransparent
                                                : item.isHomePlayer
                                                    ? AppColors.c1F8FE5
                                                    : AppColors.cD60D20,
                                            width: 1.5.w)),
                                    child: controller.isSystemEvent(item)
                                        ? IconWidget(
                                            iconWidth: 20.w,
                                            icon: Assets.commonUiCommonProp03)
                                        : ImageWidget(
                                            url:
                                                Utils.getPlayUrl(item.playerId),
                                            width: 28.w,
                                            height: 28.w,
                                            borderRadius:
                                                BorderRadius.circular(14.w),
                                            imageFailedPath:
                                                Assets.teamUiHead03,
                                          ),
                                  ),
                                  13.hGap,
                                  Expanded(child: Builder(builder: (context) {
                                    var list = Utils.subColorString(item.text);
                                    return Text.rich(
                                      TextSpan(
                                          children: List.generate(list.length,
                                              (index) {
                                        var colorString = list[index];
                                        return TextSpan(
                                            text: "${colorString.text} ",
                                            style: colorString.isMatch
                                                ? TextStyle(
                                                    color: item.isHomePlayer
                                                        ? AppColors.c1F8FE5
                                                        : AppColors.cD60D20)
                                                : null);
                                      })),
                                      maxLines: 3,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: item.score
                                              ? FontWeight.w500
                                              : FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
                                          color: item.score
                                              ? AppColors.c000000
                                              : AppColors.c4D4D4D,
                                          height: 1,
                                          fontFamily: item.score
                                              ? FontFamily.fRobotoMedium
                                              : FontFamily.fRobotoRegular),
                                    );
                                  })),
                                  Container(
                                    width: 50.w,
                                    alignment: Alignment.center,
                                    child: !item.score
                                        ? const SizedBox.shrink()
                                        : Text.rich(
                                            TextSpan(children: [
                                              TextSpan(
                                                  text: "${item.homeScore}",
                                                  style: TextStyle(
                                                    color: item.score &&
                                                            item.isHomePlayer
                                                        ? AppColors.c1F8FE5
                                                        : AppColors.c4D4D4D,
                                                  )),
                                              const TextSpan(text: "-"),
                                              TextSpan(
                                                  text: "${item.awayScore}",
                                                  style: TextStyle(
                                                    color: item.score &&
                                                            !item.isHomePlayer
                                                        ? AppColors.cD60D20
                                                        : AppColors.c4D4D4D,
                                                  )),
                                            ]),
                                            style: 12.w4(
                                                color: AppColors.c4D4D4D,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fRobotoRegular),
                                          ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  });
                }),
          ),
          MtInkwell(
            onTap: () => controller.seeAll(),
            child: Container(
              height: 44.w,
              margin: EdgeInsets.only(right: 20.w),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "SEE ALL",
                    style: 16.w7(
                        color: AppColors.c262626,
                        height: 1,
                        fontFamily: FontFamily.fOswaldBold),
                  ),
                  6.hGap,
                  IconWidget(
                    iconWidth: 5.w,
                    icon: Assets.commonUiCommonIconSystemJumpto,
                    iconColor: AppColors.c000000,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
