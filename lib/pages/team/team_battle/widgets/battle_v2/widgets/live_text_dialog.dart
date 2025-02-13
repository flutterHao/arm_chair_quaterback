import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_scroll_physics.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/4/20:23

class LiveTextDialogWidget extends StatefulWidget {
  const LiveTextDialogWidget({super.key});

  @override
  State<LiveTextDialogWidget> createState() => _LiveTextDialogState();
}

class _LiveTextDialogState extends State<LiveTextDialogWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: InkWell(
          onTap: () => Navigator.pop(context),
        )),
        Container(
          height: Utils.getDialogHeight(),
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
          child: Obx(() {
            var teamBattleV2Controller = Get.find<TeamBattleV2Controller>();
            return DefaultTabController(
              length: teamBattleV2Controller.quarter.value,
              child: Builder(builder: (context) {
                var tabController = DefaultTabController.of(context);
                return Column(
                  children: [
                    8.vGap,
                    Center(
                      child: Container(
                        width: 44.w,
                        height: 4.w,
                        decoration: BoxDecoration(
                            color: AppColors.c000000.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(2.w)),
                      ),
                    ),
                    3.vGap,
                    Container(
                      height: 58.w,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: TLBuildWidget(
                          controller: tabController,
                          builder: (int current, int next, double progress,
                              double totalProgress) {
                            return Row(
                              children: List.generate(4, (index) {
                                Color bgColor = index == current
                                    ? Color.lerp(AppColors.c000000,
                                        AppColors.cFFFFFF, progress)!
                                    : index == next
                                        ? Color.lerp(AppColors.cFFFFFF,
                                            AppColors.c000000, progress)!
                                        : AppColors.cFFFFFF;
                                Color color = index == current
                                    ? Color.lerp(AppColors.cFFFFFF,
                                        AppColors.c000000, progress)!
                                    : index == next
                                        ? Color.lerp(AppColors.c000000,
                                            AppColors.cFFFFFF, progress)!
                                        : AppColors.c000000;
                                return Expanded(
                                  child: index > tabController.length - 1
                                      ? const SizedBox.shrink()
                                      : MtInkWell(
                                          onTap: () {
                                            if (tabController.index != index) {
                                              tabController.animateTo(index);
                                            }
                                          },
                                          child: Container(
                                            height: 28.w,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2.5.w),
                                            decoration: BoxDecoration(
                                                color: bgColor,
                                                borderRadius:
                                                    BorderRadius.circular(14.w),
                                                border: Border.all(
                                                    color: AppColors.c666666,
                                                    width: 1)),
                                            child: Center(
                                              child: Text(
                                                Utils.getSortWithInt(index + 1),
                                                style: 16.w4(
                                                    color: color,
                                                    height: 1,
                                                    fontFamily: FontFamily
                                                        .fOswaldMedium),
                                              ),
                                            ),
                                          ),
                                        ),
                                );
                              }).toList(),
                            );
                          }),
                    ),
                    Divider(
                      color: AppColors.cD1D1D1,
                      height: 1.w,
                    ),
                    Expanded(
                        child: TabBarView(
                            controller: tabController,
                            children:
                                List.generate(tabController.length, (index) {
                              return GetBuilder<TeamBattleV2Controller>(
                                  id: TeamBattleV2Controller.idLiveText,
                                  builder: (logic) {
                                    var key = Utils.getSortWithInt(index + 1);
                                    var teamBattleV2Controller =
                                        Get.find<TeamBattleV2Controller>();
                                    var list = teamBattleV2Controller
                                            .eventOnScreenMap[key] ??
                                        [];
                                    if (list.isEmpty) {
                                      return const Center(
                                        child: LoadStatusWidget(
                                          loadDataStatus: LoadDataStatus.noData,
                                        ),
                                      );
                                    }
                                    ScrollController sc = ScrollController();
                                    return MediaQuery.removePadding(
                                      removeTop: true,
                                      context: context,
                                      child: ListView.builder(
                                          controller: sc,
                                          key: PageStorageKey(key),
                                          itemCount: list.length,
                                          // reverse: true,
                                          itemBuilder: (context, index) {
                                            GameEvent item = list[index];
                                            bool lastIndex =
                                                index == list.length - 1;
                                            int time = item.time;
                                            if (item.time == -1) {
                                              double step = 40 / list.length;
                                              var generateTime =
                                                  (((list.length - index) *
                                                              step) /
                                                          40 *
                                                          12 *
                                                          60)
                                                      .toInt();
                                              var gameEvent = Get.find<
                                                      TeamBattleV2Controller>()
                                                  .getGameEvent(item
                                                      .pkEventUpdatedEntity
                                                      .eventId);
                                              time = generateTime;
                                              if (["501", "502"].contains(
                                                  gameEvent?.gameEventType)) {
                                                time = 12 * 60;
                                              }
                                              if (["505", "506"].contains(
                                                  gameEvent?.gameEventType)) {
                                                time = 0;
                                              }
                                            }
                                            return Container(
                                              // height: 44.w,
                                              margin: EdgeInsets.only(
                                                  left: 16.w,
                                                  right: 16.w,
                                                  bottom: lastIndex ? 20.w : 0),
                                              padding: EdgeInsets.only(
                                                  left: 1.w,
                                                  right: 24.w,
                                                  top: 5.w,
                                                  bottom: 5.w),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color:
                                                              AppColors.cE6E6E6,
                                                          width: 1.w))),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    MyDateUtils.formatMS(time),
                                                    style: 10.w4(
                                                        color:
                                                            AppColors.c000000,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fRobotoRegular),
                                                  ),
                                                  10.hGap,
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    15.5.w),
                                                        border: Border.all(
                                                            color: teamBattleV2Controller
                                                                    .isSystemEvent(
                                                                        item)
                                                                ? AppColors
                                                                    .cTransparent
                                                                : item
                                                                        .isHomePlayer
                                                                    ? AppColors
                                                                        .c1F8FE5
                                                                    : AppColors
                                                                        .cD60D20,
                                                            width: 1.5.w)),
                                                    child: teamBattleV2Controller
                                                            .isSystemEvent(item)
                                                        ? IconWidget(
                                                            iconWidth: 20.w,
                                                            icon: Assets
                                                                .commonUiCommonProp03)
                                                        : ImageWidget(
                                                            url: Utils
                                                                .getPlayUrl(item
                                                                    .playerId),
                                                            width: 28.w,
                                                            height: 28.w,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14.w),
                                                            imageFailedPath:
                                                                Assets
                                                                    .teamUiHead03,
                                                          ),
                                                  ),
                                                  13.hGap,
                                                  Expanded(child: Builder(
                                                      builder: (context) {
                                                    var list =
                                                        Utils.subColorString(
                                                            item.text);
                                                    return Text.rich(
                                                      TextSpan(
                                                          children:
                                                              List.generate(
                                                                  list.length,
                                                                  (index) {
                                                        var colorString =
                                                            list[index];
                                                        return TextSpan(
                                                            text:
                                                                "${colorString.text} ",
                                                            style: colorString
                                                                    .isMatch
                                                                ? TextStyle(
                                                                    color: item
                                                                            .isHomePlayer
                                                                        ? AppColors
                                                                            .c1F8FE5
                                                                        : AppColors
                                                                            .cD60D20)
                                                                : null);
                                                      })),
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight: item.score
                                                              ? FontWeight.w500
                                                              : FontWeight.w400,
                                                          color: item.score
                                                              ? AppColors
                                                                  .c000000
                                                              : AppColors
                                                                  .c4D4D4D,
                                                          height: 1,
                                                          fontFamily: item.score
                                                              ? FontFamily
                                                                  .fRobotoMedium
                                                              : FontFamily
                                                                  .fRobotoRegular),
                                                    );
                                                  })),
                                                  Container(
                                                    width: 50.w,
                                                    alignment: Alignment.center,
                                                    child: !item.score
                                                        ? const SizedBox
                                                            .shrink()
                                                        : Text.rich(
                                                            TextSpan(children: [
                                                              TextSpan(
                                                                  text:
                                                                      "${item.homeScore}",
                                                                  style:
                                                                      TextStyle(
                                                                    color: item.score &&
                                                                            item
                                                                                .isHomePlayer
                                                                        ? AppColors
                                                                            .c1F8FE5
                                                                        : AppColors
                                                                            .c4D4D4D,
                                                                  )),
                                                              const TextSpan(
                                                                  text: "-"),
                                                              TextSpan(
                                                                  text:
                                                                      "${item.awayScore}",
                                                                  style:
                                                                      TextStyle(
                                                                    color: item.score &&
                                                                            !item
                                                                                .isHomePlayer
                                                                        ? AppColors
                                                                            .cD60D20
                                                                        : AppColors
                                                                            .c4D4D4D,
                                                                  )),
                                                            ]),
                                                            style: 12.w4(
                                                                color: AppColors
                                                                    .c4D4D4D,
                                                                height: 1,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .fRobotoRegular),
                                                          ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    );
                                  });
                            })))
                  ],
                );
              }),
            );
          }),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
