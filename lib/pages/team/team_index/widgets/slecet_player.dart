import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlecetPlayerPage extends StatefulWidget {
  const SlecetPlayerPage({super.key});

  @override
  State<SlecetPlayerPage> createState() => _SlecetPlayerPageState();
}

class _SlecetPlayerPageState extends State<SlecetPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cF2F2F2,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300.w,
            child: Text('who’s your  favorite player'.toUpperCase(),
                style: 35.w5(fontFamily: FontFamily.fOswaldMedium)),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 20.w),
            child: ListView.separated(
              itemCount: 6,
              itemBuilder: (context, index) {
                NbaPlayerInfosPlayerBaseInfoList player =
                    Utils.getPlayBaseInfo(3002 + (2 * index));
                return Container(
                  height: 106,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9.w),
                      border: Border.all(color: AppColors.cD9D9D9)),
                  child: Row(
                    children: [
                      Container(
                        width: 106.w,
                        decoration: BoxDecoration(
                            color: AppColors.cD9D9D9,
                            borderRadius: BorderRadius.circular(9.w)),
                      ),
                      18.hGap,
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              Utils.getPlayBaseInfo(3002 + (2 * index))
                                  .ename
                                  .toUpperCase(),
                              style:
                                  24.w5(fontFamily: FontFamily.fOswaldMedium)),
                          Text(
                              '${Utils.getTeamInfo(player.teamId).shortEname} · ${player.position} ',
                              style:
                                  12.w5(fontFamily: FontFamily.fOswaldRegular)),
                        ],
                      ))
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 12.w),
            ),
          )),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.w),
            child: MtInkWell(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.w)),
              height: 50.w,
              alignment: Alignment.center,
              child: Text(
                'CONFIRM',
                style: 23.w5(
                    color: Colors.white, fontFamily: FontFamily.fOswaldMedium),
              ),
            )),
          )
        ],
      )),
    );
  }
}
