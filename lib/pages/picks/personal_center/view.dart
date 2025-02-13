import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_background.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_page_scroll_physics.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/widgets/game/game.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/widgets/recive_award_pick_page/recive_award_picks_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PersonalCenterPage extends StatefulWidget {
  const PersonalCenterPage({super.key, this.teamId});

  final int? teamId;

  @override
  State<PersonalCenterPage> createState() => _PersonalCenterPageState();
}

class _PersonalCenterPageState extends State<PersonalCenterPage> {
  late PersonalCenterController controller;

  @override
  Widget build(BuildContext context) {
    print('PersonalCenterPage--build---');
    var args = (Get.arguments);
    var teamId = widget.teamId;
    var initTab = 0;
    if (args != null) {
      initTab = args["initTab"] ?? 0;
      teamId = widget.teamId ?? args["teamId"];
    }
    return GetBuilder<PersonalCenterController>(
        init: controller =
            PersonalCenterController(teamId: teamId, initTab: initTab),
        id: PersonalCenterController.idPersonalCenterMain,
        builder: (_) {
          return HorizontalDragBackContainer(
            child: BlackAppWidget(
              AppBarWidget(
                title: "PERSONAL CENTER",
                bottomChild: Container(
                  decoration: BoxDecoration(
                    color: AppColors.c262626,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.w),
                        bottomRight: Radius.circular(16.w)),
                  ),
                  padding:
                      EdgeInsets.only(bottom: 6.w, right: 23.w, left: 23.w),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(RouteNames.mineMineInfo);
                        },
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10.w),
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(8.w)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.w),
                              child: ImageWidget(
                                imageFailedPath: Assets.teamUiHead01,
                                url: Utils.getAvatarUrl(
                                    controller.teamSimpleEntity?.teamLogo),
                                width: 48.w,
                                height: 48.w,
                              ),
                            )),
                      ),
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
                                  borderRadius: BorderRadius.circular(6.w)),
                              child: Text(
                                "KOI",
                                style:
                                    10.w4(color: AppColors.cFFFFFF, height: 1),
                              ),
                            ),
                            4.vGap,
                            Text(
                              controller.teamSimpleEntity?.teamName ?? "--",
                              style: 16.w4(color: AppColors.cE6E6E6, height: 1),
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
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      "UID:${controller.teamSimpleEntity?.teamId ?? "--"}",
                                      style: 10.w4(
                                          color: AppColors.c666666, height: 1),
                                    ),
                                    7.hGap,
                                    InkWell(
                                        child: IconWidget(
                                      iconWidth: 10.w,
                                      icon: Assets.iconUiIconCopy,
                                      iconColor: AppColors.c666666,
                                    )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => _showMoreDialog(context),
                        child: Container(
                          width: 29.w,
                          height: 29.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.w),
                              border: Border.all(
                                  color: AppColors.c666666, width: 1)),
                          child: IconWidget(
                            iconWidth: 16.w,
                            icon: Assets.iconUiIconMore,
                            iconColor: AppColors.cB3B3B3,
                          ),
                        ),
                      ),
                      9.hGap,
                      InkWell(
                        onTap: () {
                          //todo
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
                            icon: Assets.iconUiIconAdd,
                            iconColor: AppColors.cB3B3B3,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              totalScreenBuilder: (context, appBarHeight) {
                return controller.teamSimpleEntity == null
                    ? Center(
                        child: Obx(() {
                          return LoadStatusWidget(
                              loadDataStatus: controller.loadStatus.value);
                        }),
                      )
                    : Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.cD9D9D9,
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(16.w))),
                            padding: EdgeInsets.only(
                              left: 13.w,
                              right: 13.w,
                            ),
                            child: Container(
                              height: 34.w,
                              margin: EdgeInsets.only(
                                  top: appBarHeight + 17.w, bottom: 16.w),
                              decoration: BoxDecoration(
                                color: AppColors.cEFEFEF,
                                borderRadius: BorderRadius.circular(17.w),
                              ),
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
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                                physics: OneBoundaryPageScrollPhysics(
                                    tabController: controller.tabController),
                                controller: controller.tabController,
                                children: [
                                  ReciveAwardPicksPage(
                                      teamId!, controller.teamSimpleEntity!),
                                  const Game(),
                                  // const Center(child: LoadStatusWidget()),
                                ]),
                          ),
                        ],
                      );
              },
            ),
          );
        });
  }

  void _showMoreDialog(BuildContext context) {
    var sizedBox = SizedBox(
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
              InkWell(
                onTap: () {
                  //todo
                },
                child: Container(
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
                        icon: Assets.iconUiIconInform,
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
                        icon: Assets.iconUiIconArrows,
                        iconColor: AppColors.c666666,
                      )
                    ],
                  ),
                ),
              ),
              9.vGap,
              InkWell(
                onTap: () {
                  //todo
                },
                child: Container(
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
                        icon: Assets.iconUiIconBlock,
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
                        icon: Assets.iconUiIconArrows,
                        iconColor: AppColors.c666666,
                      )
                    ],
                  ),
                ),
              ),
              9.vGap,
              InkWell(
                onTap: () {
                  //todo
                },
                child: Container(
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
                        icon: Assets.iconIconShare,
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
                        icon: Assets.iconUiIconArrows,
                        iconColor: AppColors.c666666,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
    BottomTipDialog.showWithSound(
        context: Get.context!,
        builder: (context) {
          return sizedBox;
        });
  }
}
