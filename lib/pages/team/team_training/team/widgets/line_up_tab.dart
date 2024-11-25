import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_scroll_physics.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/border_container.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/linear_progress_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/my_team_list.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/recover_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LineUpTab extends StatefulWidget {
  const LineUpTab({super.key});

  @override
  State<LineUpTab> createState() => _LineUpTabState();
}

class _LineUpTabState extends State<LineUpTab>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<TeamController>();
  Widget _blackContainer({required double width, required Widget child}) {
    return Container(
      width: width,
      height: 70.w,
      padding: EdgeInsets.only(top: 11.w, left: 9.w, right: 9.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var scrollController = ScrollController();
    return GetBuilder<TeamController>(builder: (_) {
      return SingleChildScrollView(
        controller: scrollController,
        physics: OneBoundaryScrollPhysics(scrollController: scrollController),
        child: Column(
          children: [
            12.vGap,

            ///头部卡片
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _blackContainer(
                    width: 70.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.myTeamEntity.oVR}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: 16.w7(color: AppColors.cF2F2F2, height: 1),
                        ),
                        10.vGap,
                        Text(
                          "Team Power",
                          style: 12.w4(height: 1, color: AppColors.c666666),
                        ),
                      ],
                    )),
                4.hGap,
                _blackContainer(
                  width: 109.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                Utils.formatMoney(
                                    controller.myTeamEntity.salary),
                                style:
                                    19.w4(color: AppColors.cF2F2F2, height: 1)),
                            SizedBox(height: 4.h),
                            Text(
                                "/${Utils.formatMoney(controller.myTeamEntity.salaryCap)}",
                                style:
                                    10.w4(color: AppColors.cF2F2F2, height: 1)),
                          ]),
                      SizedBox(height: 6.h),
                      CustomLinearProgressBar(
                          width: 91.w,
                          progressColor: AppColors.cF2F2F2,
                          backgroundColor: AppColors.c666666,
                          progress: controller.myTeamEntity.salary /
                              controller.myTeamEntity.salaryCap),
                      12.vGap,
                      Text(
                        "SALARY",
                        style: 12.w4(height: 1, color: AppColors.c666666),
                      ),
                    ],
                  ),
                ),
                4.hGap,
                InkWell(
                  onTap: () {
                    showDialog(
                        context: Get.context!,
                        builder: (context) {
                          return const RecoverDialog();
                        });
                  },
                  child: _blackContainer(
                      width: 156.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${(controller.myTeamEntity.powerP * 100 / 100).toStringAsFixed(0)}%",
                                    style: 19.w4(
                                        color: AppColors.cF2F2F2, height: 1)),
                                4.hGap,
                                Text("Team Rest ",
                                    style: 10.w4(
                                        color: AppColors.cF2F2F2, height: 1)),
                                1.hGap,
                                Obx(() {
                                  return Text(controller.remainString.value,
                                      style: 10.w4(
                                          color: AppColors.c10A86A, height: 1));
                                }),
                              ]),
                          SizedBox(height: 6.h),
                          CustomLinearProgressBar(
                            width: 138.w,
                            progress: controller.myTeamEntity.powerP.toDouble(),
                            progressColor: Utils.getProgressColor(
                                controller.myTeamEntity.powerP),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "TEAM condition",
                                  style: 12
                                      .w4(height: 1, color: AppColors.c666666),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              8.hGap,
                              BorderContainer(
                                height: 22.w,
                                width: 22.w,
                                borderColor: AppColors.cB3B3B3,
                                child: IconWidget(
                                  iconWidth: 11.w,
                                  icon: Assets.iconUiIconPlus,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                )
              ],
            ),
            SizedBox(height: 25.h),

            ///球员列表
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                16.hGap,
                Text(
                  "Main",
                  style: 19.w7(color: AppColors.cF1F1F1),
                ),
                // 8.hGap,
                // Text(
                //   "expend more stamina",
                //   style: 10.w7(color: AppColors.cB3B3B3),
                // ),
                // Expanded(child: Container()),
                //  Text(
                //   "Cancel",
                //   style: 19.w7(color: AppColors.cF1F1F1),
                // ),
              ],
            ),
            // ignore: prefer_const_constructors
            MainPlayerList(),
            8.vGap,
            Row(
              children: [
                16.hGap,
                Text(
                  "Substitute",
                  style: 19.w7(color: AppColors.cF1F1F1),
                ),
                // 8.hGap,
                // Text(
                //   "expend less stamina",
                //   style: 10.w7(color: AppColors.cB3B3B3),
                // ),
              ],
            ),
            // ignore: prefer_const_constructors
            SubPlayerList(),
          ],
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
