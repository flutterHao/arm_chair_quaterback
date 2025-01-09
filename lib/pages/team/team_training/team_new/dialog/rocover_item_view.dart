/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-28 20:22:47
 * @LastEditTime: 2025-01-08 19:32:03
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/dialog/recover_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecoverItem extends GetView<TeamController> {
  const RecoverItem({
    super.key,
    required this.item,
    this.isBag = false,
    this.isSelect = false,
    this.onDownCallBack,
  });

  // final bool isMain;
  final TeamPlayerInfoEntity item;
  final bool isBag;
  final bool isSelect;
  final Function? onDownCallBack;

  ///下阵容回调

  // String get position => Utils.getPosition(item.position);

  ///球员位置
  Widget _playerPosition() {
    if (isBag) {
      return SizedBox(
        height: 93.w,
        width: 16.w,
      );
    }
    return Container(
      height: 93.w,
      width: 16.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: item.position > 0 ? AppColors.c000000 : AppColors.ccccccc,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(9.w))),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          Utils.getPosition(item.position),
          style: 14.w4(
              color: item.position > 0 ? AppColors.cFFFFFF : AppColors.c000000,
              height: 1,
              fontFamily: FontFamily.fRobotoMedium),
        ),
      ),
    );
  }

  ///球员操作
  Widget _playerInfo() {
    NbaPlayerInfosPlayerBaseInfoList palyer =
        Utils.getPlayBaseInfo(item.playerId);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150.w,
            child: Text(
              palyer.ename,
              style: 21.w7(
                  height: 1,
                  color: AppColors.c262626,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          3.5.vGap,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${Utils.getTeamInfo(palyer.teamId).shortEname} · ${palyer.position}",
                style: 12.w4(
                  height: 1,
                  fontFamily: FontFamily.fRobotoRegular,
                ),
              ),
              9.hGap,
              if (CacheApi.playerStatusMap[item.playerStatus]?.statsId != null)
                IconWidget(
                  iconWidth: 20.w,
                  iconHeight: 20.w,
                  icon: Utils.getStatusUrl(
                      CacheApi.playerStatusMap[item.playerStatus]?.statsId),
                ),
              4.hGap,
              Visibility(
                visible: Utils.getPlayBaseInfo(item.playerId).injuries,
                child: IconWidget(
                  iconWidth: 16.w,
                  iconHeight: 16.w,
                  icon: Assets.commonUiCommonIconInjury,
                ),
              )
            ],
          ),
          14.5.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconWidget(
                icon: Assets.managerUiManagerIconRecover,
                iconWidth: 10.w,
              ),
              5.5.hGap,
              OutLineProgressWidget(
                width: 68.w,
                height: 6.w,
                progress: item.power / 100,
                progressColor: Utils.getProgressColor(item.power),
              ),
              4.hGap,
              AnimatedNum(
                number: item.power * 100 ~/ 100,
                textStyle: 12.w7(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium),
              ),
              Text(
                "%",
                style: 12.w7(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 121.w,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Row(
            children: [
              // _playerPosition(),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Row(
                  key: ValueKey(item.uuid),
                  children: [
                    13.hGap,
                    PlayerCard(
                      backgroundColor: AppColors.cE1E1E1,
                      playerId: item.playerId,
                      width: 73.w,
                      height: 93.w,
                      isMyPlayer: true,
                      player: item,
                      grade: Utils.formatGrade(
                          Utils.getPlayBaseInfo(item.playerId).grade),
                      level: item.breakThroughGrade,
                    ),
                    11.hGap,
                    _playerInfo(),
                    9.hGap,
                  ],
                ),
              ),
              RecoverButtom(
                  money: item.recoverCost,
                  onTap: () {
                    if (item.power >= 100) {
                      EasyLoading.showToast("the player morale is full.");
                      return;
                    }
                    controller.recoverPower(
                        cost: item.recoverCost, type: 1, uuid: item.uuid);
                  }),
              16.hGap,
            ],
          ),
          Positioned(
            left: 0,
            child: _playerPosition(),
          )
        ],
      ),
    );
  }
}
