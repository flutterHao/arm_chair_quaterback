import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/player_card_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/box_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallPlayerCard extends StatelessWidget {
  const SmallPlayerCard(
      {super.key, required this.playerId, this.breakThroughGrade});

  final int playerId;
  final int? breakThroughGrade;

  @override
  Widget build(BuildContext context) {
    var player = Utils.getPlayBaseInfo(playerId);
    // item.isSelect.value = true;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          getSmallCardImage(player.grade),
          width: 98.w,
          fit: BoxFit.fill,
        ),
        Positioned(
          // top: 19.w,
          // top: 5.5.w,
          bottom: 20.5.w,
          child: ImageWidget(
            url: Utils.getPlayUrl(player.playerId),
            alignment: Alignment.bottomCenter,
            // width: 125.w,
            width: 86.5.w,
            height: 96.5.w,
            fit: BoxFit.fitHeight,
            borderRadius: BorderRadius.circular(7.5.w),
          ),
        ),
        Positioned(
          left: 9.5.w,
          top: 9.5.w,
          child: OutlinedText(
            text: player.grade,
            textStyle: 26.w4(height: 0.8, fontFamily: FontFamily.fRobotoBlack),
          ),
        ),
        if (breakThroughGrade != null)
          Positioned(
              top: 34.w,
              left: 5.5.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IconWidget(
                      iconWidth: 21.w, icon: Assets.managerUiManagerPlayerstar),
                  Container(
                    margin: EdgeInsets.only(bottom: 2.w),
                    child: Text(
                      "$breakThroughGrade",
                      style: 10.w4(
                          color: AppColors.cFFFFFF,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular),
                    ),
                  )
                ],
              )),
        Positioned(
          top: 11.w,
          right: 10.w,
          child: OutlinedText(
            text: player.playerScore.toString(),
            strokeWidth: 1.5.w,
            textStyle:
                16.w4(height: 0.8, fontFamily: FontFamily.fOswaldRegular),
          ),
        ),
        Positioned(
          top: 119.w,
          child: Text(
            // textAlign: TextAlign.left,
            player.ename,
            style: 14.w4(
              height: 0.8,
              fontFamily: FontFamily.fOswaldMedium,
              color: AppColors.cFFFFFF,
            ),
          ),
        )
      ],
    );
  }
}
