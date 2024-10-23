/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-28 20:22:47
 * @LastEditTime: 2024-10-23 11:50:36
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-28 20:22:47
 * @LastEditTime: 2024-09-29 18:59:56
 */

import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayerItem extends GetView<TeamController> {
  const PlayerItem({
    super.key,
    required this.item,
    required this.isMain,
    this.isBag = false,
  });

  final bool isMain;
  final TeamPlayerInfoEntity item;
  final bool isBag;

  ///球员位置
  Widget _playerPosition() {
    return Positioned(
      left: 0,
      child: Container(
        color: isMain ? AppColors.c3B93FF : AppColors.c666666,
        height: 84.w,
        width: 32.w,
        alignment: Alignment.centerLeft,
        child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            Utils.getPosition(item.position),
            style: 21.w7(
              color: isMain ? AppColors.c2170D2 : AppColors.c323232,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }

  ///球员卡片
  Widget _playCard() {
    return Positioned(
      left: 16.w,
      child: ShadowContainer(
        width: 343.w,
        height: 84.w,
        backgroudColor: AppColors.cF2F2F2,
        child: Row(
          children: [
            10.hGap,
            PlayerAwater(
              backgroudColor: AppColors.cE1E1E1,
              player: TeamPlayerInfoEntity(),
            ),
            SizedBox(
              width: 3.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _playerStatus(),
                9.vGap,
                _playerOperation(),
              ],
            )
          ],
        ),
      ),
    );
  }

  ///球员状态
  Widget _playerStatus() {
    double progress = Random().nextDouble();
    return Row(
      children: [
        ShadowContainer(
          width: 62.w,
          height: 12.w,
          // padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
          borderRadius: BorderRadius.circular(12.w),
          backgroudColor: Colors.black.withOpacity(0.05),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "SCORE",
                style: 10.w4(color: AppColors.cB3B3B3, height: 1),
              ),
              7.hGap,
              Text(
                "${item.buyPlayerScore}",
                style: 10.w7(color: AppColors.c000000, height: 1),
              ),
            ],
          ),
        ),
        4.hGap,
        ShadowContainer(
          width: 62.w,
          height: 12.w,
          // padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
          borderRadius: BorderRadius.circular(12.w),
          backgroudColor: Colors.black.withOpacity(0.05),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "SAL",
                style: 10.w4(color: AppColors.cB3B3B3, height: 1),
              ),
              7.hGap,
              Text(
                Utils.formatMoney(item.buyPrice),
                style: 10.w7(color: AppColors.c000000, height: 1),
              ),
            ],
          ),
        ),
        4.hGap,
        ShadowContainer(
          width: 120.w,
          height: 12.w,
          // padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
          borderRadius: BorderRadius.circular(12.w),
          backgroudColor: Colors.black.withOpacity(0.05),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "COND",
                style: 10.w4(color: AppColors.cB3B3B3, height: 1),
              ),
              Container(
                width: 52.w,
                height: 4.w,
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: CustomLinearProgressBar(
                  height: 4.w,
                  progress: item.power / 100,
                  progressColor: controller.getProgressColor(progress),
                  backgroundColor: Colors.black12,
                ),
              ),
              Text(
                "${item.power}%",
                style: 10.w7(color: AppColors.c000000, height: 1),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///球员操作
  Widget _playerOperation() {
    NbaPlayerInfosPlayerBaseInfoList palyer =
        Utils.getPlayBaseInfo(item.playerId);
    return Row(
      children: [
        6.hGap,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 90.w,
              child: Text(
                palyer.name,
                style: 16.w7(height: 1, color: AppColors.c262626),
              ),
            ),
            7.vGap,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: 18.w,
                    height: 12.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.w),
                        color: AppColors.c666666),
                    child: Text(
                      "SG",
                      style: 10.w7(color: AppColors.cFFFFFF, height: 1),
                    )),
                6.hGap,
                IconWidget(
                  iconWidth: 12.w,
                  iconHeight: 12.w,
                  icon: Assets.uiStateBestPng,
                )
              ],
            ),
          ],
        ),
        22.hGap,
        // Obx(
        //   () => _NumChangeWidget(
        //     num: Random().nextInt(3),
        //     onChange: () {},
        //   ),
        // ),
        isBag ? 96.hGap : _recover(),
        9.hGap,

        InkWell(
          onTap: () {
            controller.onTabChange(isBag ? 0 : 1);
          },
          child: IconWidget(
            iconWidth: 15.w,
            backgroudWitdh: 32.w,
            backgroudheight: 32.w,
            borderRadius: BorderRadius.circular(16.w),
            border:
                isBag ? null : Border.all(width: 1.w, color: AppColors.cB3B3B3),
            backgroudColor: isBag ? AppColors.cFF7954 : null,
            icon: Assets.uiIconSwitch_02Png,
            iconColor: isBag ? AppColors.cFFFFFF : AppColors.c000000,
          ),
        ),
      ],
    );
  }

  Widget _recover() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 92.w,
        height: 32.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          border: Border.all(
            width: 1.w,
            color: AppColors.cB3B3B3,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconWidget(
              iconWidth: 9.w,
              icon: Assets.uiIconStaminaPng,
              iconColor: AppColors.c262626,
            ),
            6.hGap,
            Text(
              "RECOVER",
              style: 12.w7(color: AppColors.c262626),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addPlayer() {
    return Positioned(
      left: 16.w,
      child: InkWell(
          onTap: () {
            controller.onTabChange(1);
          },
          child: Container(
            width: 343.w,
            height: 84.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.c323232,
                borderRadius: BorderRadius.circular(16.w),
                border: Border.all(
                  width: 1.w,
                  color: AppColors.c666666,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidget(
                  iconWidth: 15.w,
                  backgroudWitdh: 38.w,
                  backgroudheight: 38.w,
                  icon: Assets.uiIconPlusPng,
                  borderRadius: BorderRadius.circular(19.w),
                  backgroudColor: AppColors.c666666,
                  iconColor: AppColors.cFF7954,
                ),
                8.vGap,
                Text(
                  "Add Player",
                  style: 12.w4(color: AppColors.cFF7954),
                )
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84.w,
      width: 360.w,
      child: Stack(
        children: [
          if (!isBag) _playerPosition(),
          _playCard()
          // (item > 5 && !isMain && !isBag) ? _addPlayer() : _playCard(),
        ],
      ),
    );
  }
}

///球员头像
class PlayerAwater extends StatelessWidget {
  const PlayerAwater({super.key, this.backgroudColor, required this.player});
  final Color? backgroudColor;
  final dynamic player;

  @override
  Widget build(BuildContext context) {
    ///头像
    return InkWell(
      onTap: () {
        Get.toNamed(RouteNames.picksPlayerDetail);
      },
      child: Stack(
        children: [
          Container(
            width: 64.w,
            height: 64.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroudColor ?? AppColors.c262626,
              borderRadius: BorderRadius.circular(32.w),
            ),
          ),
          Positioned(
            child: ImageWidget(
              url: Utils.getPlayUrl(player.playerId),
              width: 64.w,
              height: 64.w,
              borderRadius: BorderRadius.circular(32.w),
            ),
          ),
          Positioned(
            left: 0,
            top: 2,
            child: Text(
              Utils.getPlayBaseInfo(player.playerId).grade,
              style: 17.w7(color: AppColors.c262626),
            ),
          ),
          Positioned(
            top: 1.5.w,
            right: 0.5.w,
            child: IconWidget(
              iconWidth: 17.w,
              icon: Assets.uiIconStar_01Png,
              iconColor: AppColors.cFF7954,
            ),
          ),
          Positioned(
            right: 6.w,
            top: 6.5.w,
            child: Text(
              player.breakThroughGrade.toString(),
              style: 12.w7(color: AppColors.cFFFFFF, height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
