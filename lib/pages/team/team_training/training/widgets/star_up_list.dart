/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-24 18:33:29
 * @LastEditTime: 2025-02-24 20:54:17
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/player_card.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/player_item_widget_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StarUpList extends StatelessWidget {
  const StarUpList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.c1A1A1A,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 0.w,
              left: 0,
              right: 0,
              child: Image.asset(
                Assets.managerUiManagerStar06,
                width: 205.5.w,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            Positioned(
              top: -35.w,
              // left: 10,
              // right: -10,
              child: OutlinedText(
                  strokeColor: AppColors.c217FE0,
                  text: "sparring".toUpperCase(),
                  strokeWidth: 1,
                  textStyle: 94.w4(
                    color: Colors.transparent,
                    height: 1,
                    fontFamily: FontFamily.fOswaldBold,
                  )),
            ),
            Positioned(
              top: 60.5.w,
              left: 17.w,
              child: Text(
                "sparring".toUpperCase(),
                style: 50.w4(
                  fontFamily: FontFamily.fOswaldBold,
                  color: AppColors.cFFFFFF,
                  height: 0.8,
                ),
              ),
            ),
            Positioned(
              top: 116.5.w,
              left: 17.w,
              child: SizedBox(
                width: 151.w,
                child: Text(
                  "Train players to upgrade and  improve power",
                  style: 12.w4(
                    fontFamily: FontFamily.fRobotoRegular,
                    color: AppColors.cD9D9D9,
                    // height: 1,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 194.w,
              left: 0.w,
              right: 0.w,
              child: SizedBox(
                width: 343.w,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => _Item(),
                    separatorBuilder: (context, index) => 19.vGap,
                    itemCount: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    var item = Get.find<TeamController>().myTeamEntity.teamPlayers.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "MAIN",
          style: 19.w4(
            fontFamily: FontFamily.fOswaldMedium,
            color: AppColors.c2B82E4,
            height: 0.8,
          ),
        ),
        PlayerItemNew(item: item)
      ],
    );
  }
}
