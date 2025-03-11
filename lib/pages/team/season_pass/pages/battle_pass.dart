import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/controller.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/widgets/battle_bottom_reward.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/widgets/battle_rewards.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BattlePassPage extends StatefulWidget {
  const BattlePassPage({super.key});

  @override
  State<BattlePassPage> createState() => _BattlePassPageState();
}

class _BattlePassPageState extends State<BattlePassPage> {
  final SeasonPassController controller = Get.find();

  @override
  initState() {
    super.initState();
    controller.updateBattlePassInfo();
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
        child: BlackAppWidget(
      UserInfoBar(showPop: true),
      backgroundColor: Colors.white,
      bodyWidget: Expanded(child: _buildView()),
    ));
  }

  Widget _buildView() {
    return Column(
      children: [
        _battleTopWidget(),
        _levelWidget(),
        Divider(height: 1, color: AppColors.cD1D1D1),
        Expanded(child: BattleRewardsWidget()),
        BattleBottomRewardWidget()
      ],
    );
  }

  /// 等级信息
  Widget _levelWidget() {
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
          child: IntrinsicHeight(
              child: Row(
            children: [
              Container(
                height: 54.w,
                width: 54.w,
                decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    borderRadius: BorderRadius.circular(8.w)),
                child: Column(
                  children: [
                    7.vGap,
                    Text(
                      '${controller.nowReward.value.level}',
                      style:
                          24.w5(fontFamily: FontFamily.fOswaldBold, height: .8),
                    ),
                    6.vGap,
                    Text(
                      'level'.toUpperCase(),
                      style:
                          16.w5(fontFamily: FontFamily.fOswaldBold, height: .8),
                    )
                  ],
                ),
              ),
              14.hGap,
              Expanded(
                  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'CONTESTS Win'.toUpperCase(),
                          style: 13.w4(fontFamily: FontFamily.fRobotoRegular),
                        ),
                        Spacer(),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text:
                                    '${controller.battlePassInfo.value.value > controller.nowReward.value.threshold ? controller.nowReward.value.threshold : controller.battlePassInfo.value.value}',
                                style: 13.w4(
                                    fontFamily: FontFamily.fRobotoRegular,
                                    color: AppColors.c808080)),
                            TextSpan(
                                text: '/${controller.nowReward.value.threshold}'
                                    .toUpperCase(),
                                style: 13.w4(
                                    fontFamily: FontFamily.fRobotoRegular,
                                    color: AppColors.c000000)),
                          ]),
                        ),
                        20.hGap
                      ],
                    ),
                    OutLineProgressWidget(
                      width: 260.w,
                      height: 12.w,
                      progress: controller.battlePassInfo.value.value /
                          controller.nowReward.value.threshold,
                      progressColor: AppColors.c000000,
                      border: Border.all(color: AppColors.c000000, width: 1),
                    ),
                  ],
                ),
              )),
            ],
          )),
        ));
  }

//// 顶部信息
  Widget _battleTopWidget() {
    return Container(
        height: 144.w,
        color: controller.getTeamColor(controller.teamId),
        alignment: Alignment.centerLeft,
        // padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Stack(
          children: [
            Positioned(
                left: -130.w,
                bottom: -110.w,
                child: Opacity(
                  opacity: .05,
                  child: ImageWidget(
                    url: Utils.getTeamUrl(controller.teamId),
                    width: 290.w,
                    height: 290.w,
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.vGap,
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        ImageWidget(
                          url: Utils.getTeamUrl(controller.teamId),
                          width: 124.w,
                          height: 124.w,
                        ),
                        10.hGap,
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            22.vGap,
                            Text(
                              'BATTLT PASS',
                              style: 27.w4(
                                  height: .8,
                                  color: Colors.white,
                                  fontFamily: FontFamily.fOswaldBold),
                            ),
                            4.vGap,
                            Text(
                              'Win the game and get rewards.',
                              style: 12.w4(
                                  color: Colors.white,
                                  fontFamily: FontFamily.fRobotoRegular),
                            ),
                            6.vGap,
                            _remainingTimeWidget()
                          ],
                        )),
                      ],
                    ),
                  ),
                  10.vGap,
                ],
              ),
            ),
          ],
        ));
  }

  /// 赛季倒计时
  Widget _remainingTimeWidget() {
    return Obx(() {
      controller.remaining.value;
      return Row(children: [
        Container(
          width: 34.w,
          height: 37.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: Colors.white.withOpacity(.1)),
          child: Text(
            controller.days,
            style: 20
                .w5(color: Colors.white, fontFamily: FontFamily.fOswaldMedium),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            ':',
            style: 20
                .w5(color: Colors.white, fontFamily: FontFamily.fOswaldMedium),
          ),
        ),
        Container(
          width: 34.w,
          height: 37.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: Colors.white.withOpacity(.1)),
          child: Text(
            controller.hours,
            style: 20
                .w5(color: Colors.white, fontFamily: FontFamily.fOswaldMedium),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            ':',
            style: 20
                .w5(color: Colors.white, fontFamily: FontFamily.fOswaldMedium),
          ),
        ),
        Container(
          width: 34.w,
          height: 37.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: Colors.white.withOpacity(.1)),
          child: Text(
            controller.twoDigitMinutes,
            style: 20
                .w5(color: Colors.white, fontFamily: FontFamily.fOswaldMedium),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            ':',
            style: 20
                .w5(color: Colors.white, fontFamily: FontFamily.fOswaldMedium),
          ),
        ),
        Container(
          width: 34.w,
          height: 37.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: Colors.white.withOpacity(.1)),
          child: Text(
            controller.twoDigitSeconds,
            style: 20
                .w5(color: Colors.white, fontFamily: FontFamily.fOswaldMedium),
          ),
        )
      ]);
    });
  }
}

enum BattleRewardType {
  ///可领取
  canReceived,

  ///已领取
  received,

  ///未达到领取条件
  notReceived
}
