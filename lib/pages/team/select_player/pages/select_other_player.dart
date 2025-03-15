import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/select_player/widgets/select_bg.dart';
import 'package:arm_chair_quaterback/pages/team/select_player/widgets/select_player_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectOtherPlayerPage extends StatefulWidget {
  const SelectOtherPlayerPage({super.key});

  @override
  State<SelectOtherPlayerPage> createState() => _SelectOtherPlayerPageState();
}

class _SelectOtherPlayerPageState extends State<SelectOtherPlayerPage> {
  int playerId = 1155;

  @override
  void initState() {
    super.initState();
    playerId = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return SelectBgWidget(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 300.w,
          child: Text('select other  player'.toUpperCase(),
              style: 35.w5(fontFamily: FontFamily.fOswaldMedium)),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.only(top: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KEY player'.toUpperCase(),
                  style: 24.w5(fontFamily: FontFamily.fOswaldMedium, height: 1),
                ),
                14.vGap,
                SelectPlayerItemWidget(playerId: playerId, isSelect: true),
                26.vGap,
                Text(
                  'OTHER player'.toUpperCase(),
                  style: 24.w5(height: 1, fontFamily: FontFamily.fOswaldMedium),
                ),
                10.vGap,
                _randomPlayerItem(),
                10.vGap,
                Text(
                  'The team is formed, the opponent is matched, and  the game is played',
                  style: 14.w5(
                      fontFamily: FontFamily.fRobotoRegular,
                      color: AppColors.cB3B3B3),
                ),
              ],
            ),
          ),
        )),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.w),
          child: MtInkWell(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10.w)),
            height: 50.w,
            alignment: Alignment.center,
            child: Text(
              'GO',
              style: 23.w5(
                  color: Colors.white, fontFamily: FontFamily.fOswaldMedium),
            ),
          )),
        )
      ],
    ));
  }

  Widget _randomPlayerItem() {
    return Container(
      height: 218.w,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.cD9D9D9),
          borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          28.vGap,
          Container(
            height: 120.w,
            child: ListView.separated(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              itemBuilder: (context, index) {
                NbaPlayerInfosPlayerBaseInfoList player =
                    Utils.getPlayBaseInfo(playerId);
                return Container(
                    width: 58.w,
                    child: Column(
                      children: [
                        Container(
                          width: 58.w,
                          height: 77.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(9.w),
                              border: Border.all(color: AppColors.cD9D9D9)),
                        ),
                        Text(
                            Utils.getPlayBaseInfo(playerId).ename.toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: 12.w5(
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium)),
                        Text(
                            '${Utils.getTeamInfo(player.teamId).shortEname} · ${player.position} ',
                            style: 10.w4(
                                height: 1,
                                color: AppColors.cB2B2B2,
                                fontFamily: FontFamily.fRobotoRegular)),
                      ],
                    ));
              },
              separatorBuilder: (context, index) => 24.hGap,
            ),
          ),
          MtInkWell(
              onTap: () {},
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      border: Border.all(color: AppColors.c666666)),
                  child: Text('random'.toUpperCase(),
                      style: 23.w5(
                          fontFamily: FontFamily.fOswaldMedium, height: 1))))
        ],
      ),
    );
  }
}
