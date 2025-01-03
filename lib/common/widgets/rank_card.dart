/*
 * @Description: 排行卡片
 * @Author: lihonghao
 * @Date: 2025-01-03 
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankCard extends StatelessWidget {
  const RankCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.name,
    this.shortTeamName,
    required this.rankType,
    required this.rankValue,
    required this.onTap,
  });
  final String title;
  final String imageUrl;
  final String name;
  final String? shortTeamName;
  final String rankType;
  final String rankValue;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 24.w),
        width: double.infinity,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      16.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.9),
                ),
                13.vGap,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 55.w,
                      height: 74.w,
                      decoration: BoxDecoration(
                        color: AppColors.cF2F2F2,
                        borderRadius: BorderRadius.circular(6.w),
                      ),
                      child: ImageWidget(
                        url: imageUrl,
                        borderRadius: BorderRadius.circular(6.w),
                        width: 55.w,
                      ),
                    ),
                    15.5.hGap,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        6.vGap,
                        Row(
                          children: [
                            Text(
                              // player.ename,
                              name,
                              style: 14.w4(
                                fontFamily: FontFamily.fRobotoRegular,
                                height: 0.9,
                              ),
                            ),
                            10.5.hGap,
                            if (ObjectUtil.isNotEmpty(shortTeamName))
                              Text(
                                shortTeamName!,
                                style: 12.w4(
                                  fontFamily: FontFamily.fRobotoRegular,
                                  color: AppColors.c4D4D4D,
                                  height: 0.9,
                                ),
                              )
                          ],
                        ),
                        20.vGap,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              rankValue,
                              style: 35.w4(
                                fontFamily: FontFamily.fOswaldBold,
                                height: 0.9,
                              ),
                            ),
                            12.hGap,
                            Text(
                              rankType,
                              style: 10.w4(
                                  fontFamily: FontFamily.fRobotoRegular,
                                  height: 0.9,
                                  color: AppColors.c000000),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Expanded(child: Container()),
            IconWidget(
              iconWidth: 14.w,
              icon: Assets.iconUiIconArrows04,
              rotateAngle: -90,
              iconColor: AppColors.c000000,
            )
          ],
        ),
      ),
    );
  }
}
