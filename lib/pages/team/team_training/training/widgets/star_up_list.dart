/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-24 18:33:29
 * @LastEditTime: 2025-02-25 18:58:49
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/player_item_widget_new.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StarUpList extends StatelessWidget {
  const StarUpList({super.key});

  Widget _startUpButton(
      {required String text,
      required Color textColor,
      required Color borderColor,
      required Function onTap}) {
    return MtInkWell(
      splashColor: Colors.transparent,
      onTap: () => onTap(),
      child: Container(
        width: 167.w,
        height: 51.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.w),
            border: Border.all(color: borderColor)),
        child: Text(text.toUpperCase(),
            style: 23.w4(
              fontFamily: FontFamily.fOswaldMedium,
              color: textColor,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
        id: "starUpSelect",
        builder: (ctrl) {
          var list = ctrl.starUpPlayerEntity.starUpPlayers;
          return Container(
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
                    top: 58.w,
                    right: 15.5.w,
                    child: MoneyAndCoinWidget(
                      home: true,
                    )),
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
                  bottom: 150.w,
                  child: SizedBox(
                    width: 343.w,
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            _Item(item: list[index]),
                        separatorBuilder: (context, index) => 19.vGap,
                        itemCount: list.length),
                  ),
                ),
                Positioned(
                    bottom: 41.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _startUpButton(
                            text: "give up".toUpperCase(),
                            textColor: AppColors.cD60D20,
                            borderColor: AppColors.cCF2940,
                            onTap: () {
                              Get.back();
                            }),
                        9.hGap,
                        Column(
                          children: [
                            CostPropWidet(
                                text: ctrl.trainDefine.refreshPlayerCost),
                            9.vGap,
                            _startUpButton(
                                text: "refresh".toUpperCase(),
                                textColor: AppColors.cFFFFFF,
                                borderColor: AppColors.c666666,
                                onTap: () {
                                  ctrl.getSlotStarUpEventVO(1);
                                }),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          );
        });
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key, required this.item});
  final TeamPlayerInfoEntity item;

  @override
  Widget build(BuildContext context) {
    // var item = Get.find<TeamController>().myTeamEntity.teamPlayers.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 343.w,
          margin: EdgeInsets.only(left: 12.w),
          child: Text(
            item.position > 0 ? "MAIN" : (item.position == 0 ? "SUB" : "STASH"),
            style: 19.w4(
              fontFamily: FontFamily.fOswaldMedium,
              color: AppColors.c2B82E4,
              height: 0.8,
            ),
          ),
        ),
        MtInkWell(
          splashColor: Colors.transparent,
          minScale: 0.95,
          onTap: () {
            Get.toNamed(RouteNames.teamTeamUpgrade,
                arguments: {"playerUuid": item.uuid});
          },
          child: Container(
            height: 115.w,
            width: 343.w,
            padding: EdgeInsets.symmetric(horizontal: 11.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.w),
                border: Border.all(color: AppColors.c2B82E4)),
            child: Row(
              children: [
                Expanded(child: PlayerItemBlack(item: item, isDark: true)),
                IconWidget(
                  icon: Assets.iconUiIconArrows04,
                  rotateAngle: -90,
                  iconWidth: 14.w,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CostPropWidet extends StatelessWidget {
  const CostPropWidet({super.key, required this.text});

  ///1_103_10
  final String text;

  @override
  Widget build(BuildContext context) {
    var list = text.split("_");
    int propId = int.tryParse(list[1]) ?? 103;
    int propNum = int.tryParse(list[2]) ?? 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${LangKey.teamMeanCost.tr}:".toUpperCase(),
          style: 16.w4(
              fontFamily: FontFamily.fOswaldMedium,
              height: 0.8,
              color: AppColors.cFFFFFF),
        ),
        10.hGap,
        Image.asset(
          // Assets.commonUiCommonIconCurrency02,
          Utils.getPropIconUrl(propId),
          width: 20.w,
        ),
        3.hGap,
        Text(
          "$propNum",
          style: 16.w4(
              fontFamily: FontFamily.fOswaldMedium,
              height: 0.8,
              color: AppColors.cFFFFFF),
        ),
      ],
    );
  }
}
