import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/place_holder_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/play_already_start/view.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/play_not_start/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LeagueDetailV2Page extends GetView<LeagueDetailV2Controller> {
  LeagueDetailV2Page(this.item, {this.gameId, super.key});

  ScoresEntity? item;
  final int? gameId;

  @override
  String? get tag => (item?.gameId ?? gameId).toString();

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
      child: GetBuilder<LeagueDetailV2Controller>(
        init: LeagueDetailV2Controller(item, gameId: gameId),
        tag: (item?.gameId ?? gameId).toString(),
        builder: (_) {
          return BlackAppWidget(
            const UserInfoBar(
              showPop: true,
            ),
            bodyWidget: Expanded(child: Obx(() {
              if (controller.loadStatus.value != LoadDataStatus.success) {
                return Center(
                  child: LoadStatusWidget(
                    loadDataStatus: controller.loadStatus.value,
                  ),
                );
              }

              var headerWidget = Container(
                color: AppColors.cFFFFFF,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(child: SizedBox.shrink()),
                        SizedBox(
                          height: 81.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PlaceHolderWidget(
                                width: 34.w,
                                borderRadius: BorderRadius.circular(17.w),
                                showChild: controller.item?.homeTeamId != null,
                                child: MtInkWell(
                                  onTap: () => Get.toNamed(
                                      RouteNames.teamDetailPage,
                                      arguments: controller.item?.homeTeamId),
                                  child: ImageWidget(
                                    url: Utils.getTeamUrl(
                                        controller.item?.homeTeamId),
                                    width: 34.w,
                                  ),
                                ),
                              ),
                              2.vGap,
                              PlaceHolderWidget(
                                width: 20,
                                height: 10,
                                showChild: controller.item != null,
                                child: Text(
                                  "${controller.item?.homeTeamWL}",
                                  style: 10.w4(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            11.hGap,
                            if (controller.isGameStart)
                              SizedBox(
                                height: 34.w,
                                child: PlaceHolderWidget(
                                  width: 30,
                                  height: 24,
                                  showChild: controller.item != null,
                                  child: Text(
                                    "${controller.item?.homeTeamScore}",
                                    style: 24.w7(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fOswaldBold),
                                  ),
                                ),
                              ),
                            14.hGap,
                            Obx(() {
                              return SizedBox(
                                height: 81.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PlaceHolderWidget(
                                      width: 50,
                                      height: 21,
                                      showChild: controller.item != null,
                                      child: Text(
                                        "VS",
                                        style: 21.w7(
                                            color: AppColors.cB3B3B3,
                                            height: 1,
                                            fontFamily: FontFamily.fOswaldBold),
                                      ),
                                    ),
                                    7.vGap,
                                    PlaceHolderWidget(
                                      width: 50,
                                      height: 12,
                                      showChild: controller.item != null,
                                      child: Text(
                                        controller.gameStartTimeStr.value,
                                        style: 12.w4(
                                            color: controller.item?.status == 1
                                                ? AppColors.c10A86A
                                                : AppColors.c000000,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fRobotoRegular),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                            14.hGap,
                            if (controller.isGameStart)
                              SizedBox(
                                height: 34.w,
                                child: PlaceHolderWidget(
                                  width: 30,
                                  height: 24,
                                  showChild: controller.item != null,
                                  child: Text(
                                    "${controller.item?.awayTeamScore}",
                                    style: 24.w7(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fOswaldBold),
                                  ),
                                ),
                              ),
                            11.hGap,
                          ],
                        ),
                        SizedBox(
                          height: 81.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PlaceHolderWidget(
                                width: 34.w,
                                showChild: controller.item != null,
                                borderRadius: BorderRadius.circular(17.w),
                                child: MtInkWell(
                                  onTap: () => Get.toNamed(
                                      RouteNames.teamDetailPage,
                                      arguments: controller.item?.awayTeamId),
                                  child: ImageWidget(
                                    url: Utils.getTeamUrl(
                                        controller.item?.awayTeamId),
                                    width: 34.w,
                                  ),
                                ),
                              ),
                              2.vGap,
                              PlaceHolderWidget(
                                width: 20,
                                height: 10,
                                showChild: controller.item != null,
                                child: Text(
                                  "${controller.item?.awayTeamWL}",
                                  style: 10.w4(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox.shrink()),
                      ],
                    )
                  ],
                ),
              );
              return controller.isGameStart
                  ? LeagueDetailPlayPage(
                      controller.item!,
                      header: headerWidget,
                    )
                  : PlayNotStartPage(
                      controller.item!,
                      header: headerWidget,
                    );
            })),
          );
        },
      ),
    );
  }
}
