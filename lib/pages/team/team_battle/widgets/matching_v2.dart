
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spine_flutter/spine_widget.dart';
///
///@auther gejiahui
///created at 2025/3/19/21:10


class MatchingV2 extends GetView<TeamBattleController> {
  const MatchingV2({super.key});

  @override
  Widget build(BuildContext context) {
    final spineController = SpineWidgetController(onInitialized: (controller) {
      // Set the default mixing time between animations
      controller.animationState.getData().setDefaultMix(0.2);
      // Set the portal animation on track 0
      controller.animationState.setAnimationByName(0, "loading", true);
      // Queue the run animation after the portal animation
      // spineController.animationState.addAnimationByName(0, "run", true, 0);
    });
    return GetBuilder<TeamBattleController>(
        id: TeamBattleController.idMatching,
        builder: (logic) {
          return Container(
            color: AppColors.cF2F2F2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: IconWidget(icon: Assets.managerUiMangerNew26)),
                Positioned(
                    bottom: 0,
                    right: 0,
                    width: 150.w,
                    child: IconWidget(icon: Assets.managerUiMangerNew27)),
                Positioned(
                    top: 80.w,
                    child: Text(
                      "MATCH GAME",
                      style: 35.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium,
                      ),
                    )),
                Positioned(
                    top: 287.w,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(39.w),
                                      border: Border.all(
                                          color: AppColors.c2C9AE0, width: 2.w),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: UserAvatarWidget(
                                        url: Utils.getAvatarUrl(
                                            "${Get.find<HomeController>().userEntiry.teamLoginInfo?.team?.teamLogo}"),
                                        width: 78.w,
                                        radius: 39.w,
                                        height: 78.w)),
                                14.vGap,
                                Text(
                                  "${Get.find<HomeController>().userEntiry.teamLoginInfo?.team?.teamName}",
                                  style: 14.w4(
                                    color: AppColors.c000000,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldRegular,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 93.w,
                              height: 78.w,
                              child: Center(
                                child: Text(
                                  "VS",
                                  style: 30.w5(
                                    color: AppColors.c262626,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Builder(builder: (context) {
                                  if (controller.loadStatus ==
                                      LoadDataStatus.loading) {
                                    return Container(
                                      height: 78.w,
                                      width: 78.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.c262626,
                                        borderRadius: BorderRadius.circular(39.w),
                                        border: Border.all(
                                            color: AppColors.c262626, width: 2.w),
                                      ),
                                      child: IconWidget(
                                        icon:
                                        Assets.managerUiManagerTrainingUnknown,
                                        iconWidth: 14.w,
                                      ),
                                    );
                                  }
                                  return Container(
                                      height: 78.w,
                                      width: 78.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(39.w),
                                        border: Border.all(
                                            color: AppColors.cD60D20, width: 2.w),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: UserAvatarWidget(
                                          url: Utils.getAvatarUrl(
                                              "${controller.battleEntity.awayTeam.teamLogo}"),
                                          width: 78.w,
                                          radius: 39.w,
                                          height: 78.w));
                                }),
                                14.vGap,
                                Text(
                                  controller.loadStatus == LoadDataStatus.loading
                                      ? ". . ."
                                      : controller.battleEntity.awayTeam.teamName,
                                  style: 14.w4(
                                    color: AppColors.c000000,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldRegular,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        54.vGap,
                        if (controller.loadStatus == LoadDataStatus.loading)
                          SizedBox(
                              width: 50.w,
                              height: 50.w,
                              child: SpineWidget.fromAsset(
                                  Assets.spineLoadingLoading,
                                  'assets/spine/loading/loading.json',
                                  spineController))
                      ],
                    ))
              ],
            ),
          );
        });
  }
}