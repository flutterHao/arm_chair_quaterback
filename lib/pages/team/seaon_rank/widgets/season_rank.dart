import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SeasonRankWidget extends StatefulWidget {
  const SeasonRankWidget({super.key});

  @override
  State<SeasonRankWidget> createState() => _SeasonRankWidgetState();
}

class _SeasonRankWidgetState extends State<SeasonRankWidget> {
  SeaonRankController seasonRankCtr = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 9.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.w),
          decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.circular(4.5.w)),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'SEASON RANK',
                    style: 24.w5(fontFamily: FontFamily.fOswaldMedium),
                  ),
                  const Spacer(),
                  _detailButton(),
                  22.hGap
                ],
              ),
              30.vGap,
              Container(
                height: 190.w,
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  children: [
                    _secondSeasonWidget(),
                    11.hGap,
                    _firstSeasonWidget(),
                    11.hGap,
                    _thirdSeasonWidget()
                  ],
                ),
              ),
              42.vGap,
              MtInkWell(
                onTap: () {
                  seasonRankCtr.goSeasonRankDialog();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.cF2F2F2,
                      borderRadius: BorderRadius.circular(6.w)),
                  padding: EdgeInsets.symmetric(vertical: 11.5.w),
                  alignment: Alignment.center,
                  child: Text(
                    'My rank:   50+'.toUpperCase(),
                    style: 18.w5(fontFamily: FontFamily.fOswaldMedium),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _secondSeasonWidget() {
    return Expanded(
        child: Container(
      child: Column(
        children: [
          43.vGap,
          Expanded(
              child: Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [AppColors.cDFEAFB, AppColors.cFFFFFF],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(9.w)),
            child: Column(
              children: [
                15.vGap,
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        top: -12.w,
                        left: 14.w,
                        child: IconWidget(
                            iconWidth: 20.5.w,
                            iconColor: AppColors.cCEE0F8,
                            icon: Assets.managerUiManagerGameRankCrown)),
                    Container(
                      width: 51.w,
                      height: 51.w,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.cFFFFFF, width: 2.5.w),
                          image: const DecorationImage(
                              image: AssetImage(Assets.teamUiHead01)),
                          color: Colors.white,
                          // boxShadow: const [
                          //   BoxShadow(color: AppColors.c212021, blurRadius: 9)
                          // ],
                          shape: BoxShape.circle),
                    ),
                  ],
                ),
                9.vGap,
                Text(
                  'USER NAME',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: 14.w5(fontFamily: FontFamily.fOswaldMedium),
                ),
                8.vGap,
                Text(
                  '2',
                  style: 18.w5(
                      color: AppColors.cCEE0F8,
                      fontFamily: FontFamily.fOswaldBold),
                )
              ],
            ),
          )),
          10.vGap
        ],
      ),
    ));
  }

  Widget _firstSeasonWidget() {
    return Expanded(
        child: Container(
      child: Column(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [AppColors.cFFF4D8, AppColors.cFFFFFF],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(9.w)),
            child: Column(
              children: [
                15.vGap,
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        top: -12.w,
                        left: 14.w,
                        child: IconWidget(
                            iconWidth: 20.5.w,
                            iconColor: AppColors.cF2DDB1,
                            icon: Assets.managerUiManagerGameRankCrown)),
                    Container(
                      width: 51.w,
                      height: 51.w,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.cFFFFFF, width: 2.5.w),
                          image: const DecorationImage(
                              image: AssetImage(Assets.teamUiHead01)),
                          color: Colors.white,
                          shape: BoxShape.circle),
                    ),
                  ],
                ),
                9.vGap,
                Text(
                  'USER NAME',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: 14.w5(fontFamily: FontFamily.fOswaldMedium),
                ),
                8.vGap,
                Text(
                  '1',
                  style: 18.w5(
                      color: AppColors.cF2DDB1,
                      fontFamily: FontFamily.fOswaldBold),
                )
              ],
            ),
          )),
          53.vGap
        ],
      ),
    ));
  }

  Widget _thirdSeasonWidget() {
    return Expanded(
        child: Container(
      child: Column(
        children: [
          53.vGap,
          Expanded(
              child: Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    // D6CFC5
                    colors: [AppColors.cD6CFC5, AppColors.cFFFFFF],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(9.w)),
            child: Column(
              children: [
                15.vGap,
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        top: -12.w,
                        left: 14.w,
                        child: IconWidget(
                            iconWidth: 20.5.w,
                            iconColor: AppColors.cC9B99F,
                            icon: Assets.managerUiManagerGameRankCrown)),
                    Container(
                      width: 51.w,
                      height: 51.w,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.cFFFFFF, width: 2.5.w),
                          image: const DecorationImage(
                              image: AssetImage(Assets.teamUiHead01)),
                          color: Colors.white,
                          // boxShadow: const [
                          //   BoxShadow(color: AppColors.c212021, blurRadius: 9)
                          // ],
                          shape: BoxShape.circle),
                    ),
                  ],
                ),
                9.vGap,
                Text(
                  'USER NAME',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: 14.w5(fontFamily: FontFamily.fOswaldMedium),
                ),
                8.vGap,
                Text(
                  '3',
                  style: 18.w5(
                      color: AppColors.cC9B99F,
                      fontFamily: FontFamily.fOswaldBold),
                )
              ],
            ),
          )),
        ],
      ),
    ));
  }

  Widget _detailButton() {
    return MtInkWell(
      onTap: () => seasonRankCtr.goSeasonRankDialog(),
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
