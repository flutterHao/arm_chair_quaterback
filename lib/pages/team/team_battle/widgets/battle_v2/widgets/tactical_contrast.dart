import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/11/29/18:30

class TacticalContrast extends StatelessWidget {
  const TacticalContrast({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: InkWell(
          onTap: () => Navigator.pop(context),
        )),
        Container(
          width: double.infinity,
          height: Utils.getDialogHeight(),
          decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              25.vGap,
              Text(
                "TACTICAL CONTRAST",
                style: 30.w7(
                    color: AppColors.c262626,
                    height: 1,
                    fontFamily: FontFamily.fOswaldBold),
              ),
              22.vGap,
              Expanded(
                  child: Stack(
                children: [
                  Image.asset(
                    Assets.managerUiManagerTacticsBg,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    top: 16.w,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        buildInfo(),
                        20.vGap,
                        buildInfo(),
                        79.vGap,
                        Text(
                          "MY TACTICS",
                          style: 16.w5(
                              color: AppColors.c262626,
                              height: 1,
                              fontFamily: FontFamily.fOswaldMedium),
                        ),
                        8.vGap,
                        Divider(
                          color: AppColors.cE6E6E,
                          height: 1.w,
                        ),
                        11.vGap,
                        SizedBox(
                          width: 263.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(5, (index) {
                              if (index == 4) {
                                return buildEmpty(
                                    AppColors.cF2F2F2, AppColors.ccccccc);
                              }
                              return Column(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.c000000
                                                .withOpacity(0.2),
                                            offset: const Offset(1, 1),
                                            blurRadius: 5,
                                          )
                                        ],
                                      ),
                                      child: TacticCard(
                                        num: 10 + index,
                                        color: index,
                                        width: 43.w,
                                        buff: TrainingInfoBuff(),
                                      )),
                                  5.vGap,
                                  SizedBox(
                                    height: 17.w,
                                    width: 43.w,
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Text(
                                          "x10",
                                          style: 10.w5(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fRobotoMedium),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Text(
                                            "-1",
                                            style: 10.w5(
                                                color: AppColors.cD60D20,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fRobotoMedium),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ],
    );
  }

  Row buildInfo() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          width: 60.w,
          height: 58.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.w),
                    border: Border.all(color: AppColors.cD60D20, width: 1.w)),
                child: ImageWidget(
                  url: "url",
                  width: 35.w,
                  height: 35.w,
                  imageFailedPath: Assets.teamUiHead01,
                  borderRadius: BorderRadius.circular(17.5.w),
                ),
              ),
              4.vGap,
              Text(
                "Player Name",
                style: 12.w4(
                    color: AppColors.cFFFFFF,
                    height: 1,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: FontFamily.fOswaldRegular),
              )
            ],
          ),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            if (index == 4) {
              return buildEmpty(
                  AppColors.c333333, AppColors.cFFFFFF.withOpacity(0.15));
            }
            return IconWidget(
                iconWidth: 43.w,
                iconHeight: 58.w,
                icon: Assets.managerUiManagerTacticsCardback);
          }),
        )),
        16.hGap,
      ],
    );
  }

  Widget buildEmpty(Color bgColor, Color iconColor) {
    return Container(
      width: 43.w,
      height: 58.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        color: bgColor,
      ),
      child: IconWidget(
        iconWidth: 18.w,
        icon: Assets.managerUiManagerTacticsIconEmpty,
        iconColor: iconColor,
      ),
    );
  }
}
