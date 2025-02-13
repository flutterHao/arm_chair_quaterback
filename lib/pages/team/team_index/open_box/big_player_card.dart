/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-18 14:27:59
 * @LastEditTime: 2025-01-10 18:40:38
 */
import 'package:arm_chair_quaterback/common/entities/player_card_entity.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/box_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigPlayerCard extends StatelessWidget {
  const BigPlayerCard({super.key, required this.playerId});
  // final PlayerCardEntity item;
  final int playerId;

  @override
  Widget build(BuildContext context) {
    var player = Utils.getPlayBaseInfo(playerId);
    // item.isSelect.value = true;
    // List<String> nameList = player.elname.split(" ");
    return SizedBox(
      width: 174.w,
      height: 267.w,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
              top: 8.w,
              child: Container(
                width: 157.w,
                height: 157.w,
                color: AppColors.cE6E6E,
              )),
          Positioned(
            // top: 19.w,
            // top: 5.5.w,
            // top: 13.w,
            bottom: 108.w,
            child: ImageWidget(
              url: Utils.getPlayUrl(player.playerId),
              alignment: Alignment.bottomCenter,
              // width: 125.w,
              // width: 147.w,
              height: 145.w,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            left: 16.5.w,
            top: 14.5.w,
            child: OutlinedText(
              text: player.grade,
              textStyle:
                  43.w4(height: 0.8, fontFamily: FontFamily.fRobotoMedium),
            ),
          ),
          Positioned(
            top: 16.w,
            right: 16.w,
            child: Column(
              children: [
                OutlinedText(
                  text: player.playerScore.toString(),
                  strokeWidth: 1.5.w,
                  textStyle:
                      20.w4(height: 0.9, fontFamily: FontFamily.fOswaldRegular),
                ),
                3.vGap,
                OutlinedText(
                  text: "OVR",
                  strokeWidth: 1.5.w,
                  textStyle:
                      9.w4(height: 0.8, fontFamily: FontFamily.fOswaldRegular),
                ),
              ],
            ),
          ),
          // Positioned(
          //   top: 119.w,
          //   child: Text(
          //     // textAlign: TextAlign.left,
          //     player.ename,
          //     style: 14.w4(
          //       height: 0.8,
          //       fontFamily: FontFamily.fOswaldMedium,
          //       color: AppColors.cFFFFFF,
          //     ),
          //   ),
          // ),
          Image.asset(
            getBigCardImage(player.grade),
            width: 174.w,
            fit: BoxFit.fill,
          ),
          //球员名字
          Positioned(
              top: 175.w,
              child: Text(
                player.ename.toUpperCase(),
                style: 18.w4(
                  // height: 0.8,
                  fontFamily: FontFamily.fOswaldBold,
                ),
              )),
          Positioned(
            bottom: 34.w,
            right: 99.w,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageWidget(
                  url: Utils.getTeamUrl(player.teamId),
                  height: 25.w,
                  fit: BoxFit.fitHeight,
                ),
                1.hGap,
                Text(
                  '#${player.number}',
                  style:
                      12.w4(fontFamily: FontFamily.fRobotoRegular, height: 1),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40.w,
            left: 99.w,
            child: Text(
              player.position,
              style: 12.w4(
                height: 1,
                fontFamily: FontFamily.fRobotoRegular,
              ),
            ),
          ),
          Positioned(
            left: 23.5.w,
            bottom: 13.w,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "POWER",
                  style: 8.w4(
                    fontFamily: FontFamily.fRobotoRegular,
                  ),
                ),
                6.hGap,
                Text(
                  player.playerStrength.toString(),
                  style: 8.w5(
                    fontFamily: FontFamily.fRobotoMedium,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: 100.w,
              bottom: 13.w,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "SALARY",
                    style: 8.w4(
                      fontFamily: FontFamily.fRobotoRegular,
                    ),
                  ),
                  6.hGap,
                  Text(
                    Utils.formatMoney(player.salary),
                    style: 8.w5(
                      fontFamily: FontFamily.fRobotoMedium,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
