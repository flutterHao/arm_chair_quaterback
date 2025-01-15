import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameLogWidget extends StatefulWidget {
  const GameLogWidget({super.key});

  @override
  State<GameLogWidget> createState() => _GameLogWidgetState();
}

class _GameLogWidgetState extends State<GameLogWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 9.w),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(4.5.w)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              alignment: Alignment.centerLeft,
              child: Text(
                'GAME LOG',
                style: 24.w5(fontFamily: FontFamily.fOswaldMedium),
              ),
            ),
            Container(height: 1, color: AppColors.cD4D4D4),
            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 66.w,
                        child: Column(
                          children: [
                            21.vGap,
                            Container(
                                width: 36.w,
                                height: 36.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.c1F8FE5, width: 1.5.w),
                                    image: const DecorationImage(
                                        image: AssetImage(Assets.teamUiHead01)),
                                    color: Colors.white,
                                    shape: BoxShape.circle)),
                            4.vGap,
                            Text(
                              'Player Name',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  12.w5(fontFamily: FontFamily.fOswaldMedium),
                            ),
                            18.vGap
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20.w),
                        child: Text(
                          '198',
                          style: 24.w5(fontFamily: FontFamily.fOswaldBold),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        child: Column(
                          children: [
                            33.vGap,
                            Text(
                              'VS',
                              style: 18.w5(
                                  fontFamily: FontFamily.fOswaldMedium,
                                  color: AppColors.cB3B3B3),
                            ),
                            15.vGap,
                            MtInkWell(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    MyDateUtils.formatDate(DateTime.now(),
                                        format: DateFormats.PARAM_M_D_H_M_S),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      decoration: TextDecoration.underline,
                                      // textBaseline: TextBaseline.ideographic,
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular,
                                    ),
                                  ),
                                  2.hGap,
                                  IconWidget(
                                    iconWidth: 9.w,
                                    icon: Assets.iconUiIconArrows04,
                                    rotateAngle: -90,
                                    iconColor: Colors.black,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                      Container(
                        padding: EdgeInsets.only(top: 20.w),
                        child: Text(
                          '186',
                          style: 24.w5(fontFamily: FontFamily.fOswaldBold),
                        ),
                      ),
                      SizedBox(
                        width: 66.w,
                        child: Column(
                          children: [
                            21.vGap,
                            Container(
                                width: 36.w,
                                height: 36.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.cD60D20, width: 1.5.w),
                                    image: const DecorationImage(
                                        image: AssetImage(Assets.teamUiHead01)),
                                    color: Colors.white,
                                    shape: BoxShape.circle)),
                            4.vGap,
                            Text(
                              'Player Name',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  12.w5(fontFamily: FontFamily.fOswaldMedium),
                            ),
                            18.vGap
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                  color: AppColors.cD4D4D4,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
