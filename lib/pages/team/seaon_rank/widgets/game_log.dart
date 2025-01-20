import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class GameLogWidget extends GetView<SeaonRankController> {
  const GameLogWidget({super.key});

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
            Obx(() => ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
                  itemCount: controller.gameScheduleList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return _gameLogItem(
                        index, controller.gameScheduleList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 1,
                      color: AppColors.cD4D4D4,
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }

  Widget _gameLogItem(int index, GameSchedule gameSchedule) {
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
                        border:
                            Border.all(color: AppColors.c1F8FE5, width: 1.5.w),
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(Utils.getAvaterUrl(
                                gameSchedule.homeTeamLogo))))),
                4.vGap,
                Text(
                  gameSchedule.homeTeamName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: 12.w5(fontFamily: FontFamily.fOswaldMedium),
                ),
                18.vGap
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.w),
            child: Text(
              '${gameSchedule.homeScore}',
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
                  onTap: () {
                    // Get.toNamed(RouteNames.teamHistory);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        MyDateUtils.formatDate(
                            DateTime.fromMillisecondsSinceEpoch(
                                gameSchedule.createTime),
                            format: DateFormats.PARAM_M_D_H_M_S),
                        style: TextStyle(
                          fontSize: 12.sp,
                          decoration: TextDecoration.underline,
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
              '${gameSchedule.awayScore}',
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
                        border:
                            Border.all(color: AppColors.cD60D20, width: 1.5.w),
                        image: DecorationImage(
                            image: NetworkImage(
                                Utils.getAvaterUrl(gameSchedule.awayTeamLogo))),
                        shape: BoxShape.circle)),
                4.vGap,
                Text(
                  gameSchedule.awayTeamName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: 12.w5(fontFamily: FontFamily.fOswaldMedium),
                ),
                18.vGap
              ],
            ),
          ),
        ],
      ),
    );
  }
}
