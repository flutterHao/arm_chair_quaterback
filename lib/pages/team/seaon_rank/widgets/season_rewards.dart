import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
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
  SeaonRankController seasonRankCtr = Get.find();
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
    return Container(
      padding: EdgeInsets.all(13.w),
      decoration: BoxDecoration(
          color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This season reached: Legendary Manager 4',
            style: 12.w5(fontFamily: FontFamily.fRobotoRegular),
          ),
          10.vGap,
          Row(
            children: [
              ...List.generate(
                  3,
                  (cupIndex) => Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 2.w),
                        height: 57.w,
                        child: Column(
                          children: [
                            Expanded(
                              child: Expanded(
                                  child: cupIndex == 0
                                      ? IconWidget(
                                          iconWidth: 41.w,
                                          iconHeight: 41.w,
                                          fit: BoxFit.contain,
                                          icon: Assets.managerUiManagerGift01)
                                      : cupIndex == 1
                                          ? IconWidget(
                                              iconWidth: 40.w,
                                              iconHeight: 32.w,
                                              fit: BoxFit.contain,
                                              icon: Assets.commonUiCommonProp05)
                                          : IconWidget(
                                              iconWidth: 34.w,
                                              iconHeight: 34.w,
                                              fit: BoxFit.contain,
                                              icon: Assets
                                                  .commonUiCommonIconCurrency02)),
                            ),
                            Text('$cupIndex k',
                                style: 14
                                    .w5(fontFamily: FontFamily.fOswaldRegular))
                          ],
                        ),
                      )),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 7.w),
                child: MtInkWell(
                    onTap: () => seasonRankCtr.goSeasonRewardDialog(),
                    child: Container(
                      width: 60.w,
                      height: 40.w,
                      alignment: Alignment.center,
                      // padding:
                      //     EdgeInsets.symmetric(horizontal: 11.w, vertical: 12.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.w),
                          border: Border.all(color: AppColors.c666666)),
                      child: Text(
                        'go to'.toUpperCase(),
                        style: 16.w5(fontFamily: FontFamily.fOswaldMedium),
                      ),
                      // child: IconWidget(
                      //     iconWidth: 17.w,
                      //     iconColor: AppColors.c000000,
                      //     icon: Assets.commonUiCommonIconSystemExchange),
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
      onTap: () {
        seasonRankCtr.goSeasonRewardDialog();
      },
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
