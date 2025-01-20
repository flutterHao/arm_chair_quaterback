import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller.dart';

class SeasonRewardsWidget extends StatefulWidget {
  const SeasonRewardsWidget({super.key});

  @override
  State<SeasonRewardsWidget> createState() => _SeasonRewadsWidgetState();
}

class _SeasonRewadsWidgetState extends State<SeasonRewardsWidget> {
  SeaonRankController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 9.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 21.w),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4.5.w)),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'SEASON REWARDS',
                  style: 24.w5(fontFamily: FontFamily.fOswaldMedium),
                ),
                const Spacer(),
                _detailButton()
              ],
            ),
            19.vGap,
            _rewardsWidget()
          ],
        ),
      ),
    );
  }

  Widget _rewardsWidget() {
    var cupReward = "1_101_300,1_503_2,1_604_5";

    ///赛季奖励数据转list
    List<String> cupRewardList = cupReward.split(',');
    return Container(
      padding: EdgeInsets.all(13.w),
      decoration: BoxDecoration(
          color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This season reached: ${controller.getCupDefineItem(controller.teamSimpleEntity.value.cupRankId).backUp}',
            style: 12.w5(fontFamily: FontFamily.fRobotoRegular),
          ),
          10.vGap,
          Row(
            children: [
              ...cupRewardList.map((cupItem) {
                int propId = int.tryParse(cupItem.split('_')[1]) ?? 0;
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.w),
                  height: 57.w,
                  child: Column(
                    children: [
                      Expanded(
                          child: IconWidget(
                              iconWidth: 41.w,
                              iconHeight: 41.w,
                              fit: BoxFit.contain,
                              fieldPath: Assets.managerUiManagerGift00,
                              icon: Utils.getPropIconUrl(propId))),
                      Text(
                          controller
                              .formatToK(int.parse(cupItem.split('_')[2])),
                          style: 14.w5(fontFamily: FontFamily.fOswaldRegular))
                    ],
                  ),
                );
              }),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 7.w),
                child: MtInkWell(
                    onTap: () {
                      Get.back();
                      TeamIndexController teamIndexController = Get.find();
                      teamIndexController.scroToMatch();
                    },
                    child: Container(
                      width: 60.w,
                      height: 40.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.w),
                          border: Border.all(color: AppColors.c666666)),
                      child: Text(
                        'go to'.toUpperCase(),
                        style: 16.w5(fontFamily: FontFamily.fOswaldMedium),
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _detailButton() {
    return MtInkWell(
      onTap: () => controller.goSeasonRewardDialog(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "DETAIL",
            style: TextStyle(
              fontSize: 12.sp,
              decoration: TextDecoration.underline,
              // textBaseline: TextBaseline.ideographic,
              color: AppColors.c000000,
              height: 1,
              fontFamily: FontFamily.fRobotoMedium,
            ),
          ),
          6.hGap,
          IconWidget(
            iconWidth: 9.w,
            icon: Assets.iconUiIconArrows04,
            rotateAngle: -90,
            iconColor: Colors.black,
          )
        ],
      ),
    );
  }
}
