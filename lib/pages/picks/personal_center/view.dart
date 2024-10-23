import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_background.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/widgets/game/game.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/widgets/recive_award_pick_page/recive_award_picks_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PersonalCenterPage extends GetView<PersonalCenterController> {
  const PersonalCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var teamId = (ModalRoute.of(context)?.settings.arguments as Map)["teamId"];
    return HorizontalDragBackWidget(
      child: GetBuilder<PersonalCenterController>(
        id: PersonalCenterController.idPersonalCenterMain,
        builder: (_) {
          return BlackAppWidget(
            const AppBarWidget(
              title: "PERSONAL CENTER",
            ),
            totalScreenBuilder: (context, appBarHeight) {
              return controller.teamSimpleEntity == null
                  ? Center(
                      child: Obx(() {
                        return LoadStatusWidget(
                            loadDataStatus: controller.loadStatus.value,
                            onRefreshTap: controller.getData());
                      }),
                    )
                  : Stack(
                      children: [
                        TabBarView(
                            physics: const BouncingScrollPhysics(),
                            controller: controller.tabController,
                            children: [
                              const Game(),
                              ReciveAwardPicksPage(
                                  teamId, controller.teamSimpleEntity!),
                              // const Center(child: LoadStatusWidget()),
                            ]),
                        Positioned(
                            left: 13.w,
                            right: 13.w,
                            top: appBarHeight + 88.w + 14.w,
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 400.w),
                              height: 34.w,
                              decoration: BoxDecoration(
                                  color: AppColors.cEFEFEF,
                                  borderRadius: BorderRadius.circular(17.w),
                                  border: Border.all(
                                      width: 1, color: AppColors.cB3B3B3)),
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                var itemWidth = (constraints.maxWidth - 8.w) /
                                    controller.tabController.length;

                                return TLBuildWidget(
                                    controller: controller.tabController,
                                    builder: (current, next, progress,
                                        totalProgress) {
                                      return Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Positioned(
                                            left: totalProgress * itemWidth,
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(left: 4.w),
                                              height: 26.w,
                                              width: itemWidth,
                                              decoration: BoxDecoration(
                                                  color: AppColors.c262626,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          26.w)),
                                            ),
                                          ),
                                          Row(
                                            children: List.generate(
                                                controller.titles.length,
                                                (index) => Expanded(
                                                      child: InkWell(
                                                          onTap: () =>
                                                              controller
                                                                  .tabController
                                                                  .animateTo(
                                                                      index),
                                                          child: Center(
                                                              child: Text(
                                                                  controller
                                                                          .titles[
                                                                      index],
                                                                  style: 13.w4(
                                                                    color: current ==
                                                                            index
                                                                        ? Color.lerp(
                                                                            AppColors
                                                                                .cF2F2F2,
                                                                            AppColors
                                                                                .c666666,
                                                                            progress)!
                                                                        : next ==
                                                                                index
                                                                            ? Color.lerp(
                                                                                AppColors.c666666,
                                                                                AppColors.cF2F2F2,
                                                                                progress)!
                                                                            : AppColors.c666666,
                                                                  )))),
                                                    )),
                                          )
                                        ],
                                      );
                                    });
                              }),
                            )),
                        Container(
                          height: 88.w + appBarHeight,
                          decoration: BoxDecoration(
                            color: AppColors.c262626,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.w),
                                bottomRight: Radius.circular(16.w)),
                          ),
                          padding: EdgeInsets.only(
                              top: 4.w + appBarHeight,
                              bottom: 6.w,
                              right: 23.w,
                              left: 23.w),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 10.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.cF2F2F2,
                                      borderRadius: BorderRadius.circular(8.w)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.w),
                                    child: ImageWidget(
                                      color: AppColors.cFFFFFF,
                                      url: Utils.getTeamUrl(
                                          controller.teamSimpleEntity!.teamId),
                                      width: 48.w,
                                    ),
                                  )),
                              10.hGap,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 12.w,
                                      width: 30.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: AppColors.cE7B6DF,
                                          borderRadius:
                                              BorderRadius.circular(6.w)),
                                      child: Text(
                                        "KOI",
                                        style: 10.w4(
                                            color: AppColors.cFFFFFF,
                                            height: 1),
                                      ),
                                    ),
                                    4.vGap,
                                    Text(
                                      controller.teamSimpleEntity!.teamName,
                                      style: 16.w4(
                                          color: AppColors.cE6E6E6, height: 1),
                                    ),
                                    9.vGap,
                                    InkWell(
                                      onTap: () {
                                        Clipboard.setData(
                                            const ClipboardData(text: "text"));
                                        EasyLoading.showToast("COPY SUCCESS",
                                            toastPosition:
                                                EasyLoadingToastPosition.bottom,
                                            maskType: EasyLoadingMaskType.none);
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            "UID:${controller.teamSimpleEntity!.teamId}",
                                            style: 10.w4(
                                                color: AppColors.c666666,
                                                height: 1),
                                          ),
                                          7.hGap,
                                          InkWell(
                                              child: IconWidget(
                                            iconWidth: 10.w,
                                            icon: Assets.uiIconCopyPng,
                                            iconColor: AppColors.c666666,
                                          )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _showMoreDialog(context);
                                },
                                child: Container(
                                  width: 29.w,
                                  height: 29.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.w),
                                      border: Border.all(
                                          color: AppColors.c666666, width: 1)),
                                  child: IconWidget(
                                    iconWidth: 16.w,
                                    icon: Assets.uiIconMorePng,
                                    iconColor: AppColors.cB3B3B3,
                                  ),
                                ),
                              ),
                              9.hGap,
                              Container(
                                width: 29.w,
                                height: 29.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.w),
                                    border: Border.all(
                                        color: AppColors.c666666, width: 1)),
                                child: IconWidget(
                                  iconWidth: 16.w,
                                  icon: Assets.uiIconAddPng,
                                  iconColor: AppColors.cB3B3B3,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
            },
          );
        },
      ),
    );
  }

  void _showMoreDialog(BuildContext context) {
    showModalBottomSheet(
        context: Get.context!,
        builder: (context) {
          return SizedBox(
            height: 351.h,
            child: DialogBackground(
                frontColor: AppColors.cE6E6E6,
                child: Column(
                  children: [
                    12.vGap,
                    Container(
                      width: 64.w,
                      height: 4.w,
                      decoration: BoxDecoration(
                          color: AppColors.cB3B3B3,
                          borderRadius: BorderRadius.circular(2.w)),
                    ),
                    24.vGap,
                    Container(
                      height: 51.w,
                      padding: EdgeInsets.only(left: 26.w, right: 24.w),
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                          color: AppColors.cF2F2F2,
                          borderRadius: BorderRadius.circular(16.w)),
                      child: Row(
                        children: [
                          IconWidget(
                            iconWidth: 22.w,
                            icon: Assets.uiIconInformPng,
                            iconColor: AppColors.cFF7954,
                          ),
                          7.hGap,
                          Expanded(
                              child: Text(
                            "Unreported",
                            style: 14.w4(color: AppColors.c262626),
                          )),
                          IconWidget(
                            iconWidth: 13.w,
                            icon: Assets.uiIconArrowsPng,
                            iconColor: AppColors.c666666,
                          )
                        ],
                      ),
                    ),
                    9.vGap,
                    Container(
                      height: 51.w,
                      padding: EdgeInsets.only(left: 26.w, right: 24.w),
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                          color: AppColors.cF2F2F2,
                          borderRadius: BorderRadius.circular(16.w)),
                      child: Row(
                        children: [
                          IconWidget(
                            iconWidth: 22.w,
                            icon: Assets.uiIconBlockPng,
                            iconColor: AppColors.cFF7954,
                          ),
                          7.hGap,
                          Expanded(
                              child: Text(
                            "Blacklist",
                            style: 14.w4(color: AppColors.c262626),
                          )),
                          IconWidget(
                            iconWidth: 13.w,
                            icon: Assets.uiIconArrowsPng,
                            iconColor: AppColors.c666666,
                          )
                        ],
                      ),
                    ),
                    9.vGap,
                    Container(
                      height: 51.w,
                      padding: EdgeInsets.only(left: 26.w, right: 24.w),
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                          color: AppColors.cF2F2F2,
                          borderRadius: BorderRadius.circular(16.w)),
                      child: Row(
                        children: [
                          IconWidget(
                            iconWidth: 22.w,
                            icon: Assets.iconSharePng,
                            iconColor: AppColors.cFF7954,
                          ),
                          7.hGap,
                          Expanded(
                              child: Text(
                            "Transpond",
                            style: 14.w4(color: AppColors.c262626),
                          )),
                          IconWidget(
                            iconWidth: 13.w,
                            icon: Assets.uiIconArrowsPng,
                            iconColor: AppColors.c666666,
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
