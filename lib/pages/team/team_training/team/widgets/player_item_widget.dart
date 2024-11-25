/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-28 20:22:47
 * @LastEditTime: 2024-11-24 17:49:20
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-28 20:22:47
 * @LastEditTime: 2024-09-29 18:59:56
 */

import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/animation_buttom.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
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
    this.isBag = false,
  });

  // final bool isMain;
  final TeamPlayerInfoEntity item;
  final bool isBag;

  // String get position => Utils.getPosition(item.position);

  ///球员位置
  Widget _playerPosition() {
    return Positioned(
      left: 0,
      child: Container(
        color: item.position > 0 ? AppColors.c3B93FF : AppColors.c666666,
        height: 84.w,
        width: 32.w,
        alignment: Alignment.centerLeft,
        child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            Utils.getPosition(item.position),
            style: 21.w7(
              color: item.position > 0 ? AppColors.c2170D2 : AppColors.c323232,
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
            PlayerAvatarWidget(
              backgroundColor: AppColors.cE1E1E1,
              playerId: item.playerId,
              width: 64.w,
              isMyPlayer: true,
              grade:
                  Utils.formatGrade(Utils.getPlayBaseInfo(item.playerId).grade),
              level: item.breakThroughGrade,
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
                "${Utils.getPlayBaseInfo(item.playerId).playerScore}",
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
                  width: 52.w,
                  progress: item.power.toDouble(),
                  progressColor: Utils.getProgressColor(item.power),
                  backgroundColor: Colors.black12,
                ),
              ),
              AnimatedNum(
                number: item.power * 100 ~/ 100,
                textStyle: 10.w7(color: AppColors.c000000, height: 1),
              ),
              Text(
                "%",
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
              width: 100.w,
              child: Text(
                palyer.ename,
                style: 16.w7(
                    height: 1,
                    color: AppColors.c262626,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            7.vGap,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    // width: 18.w,
                    height: 12.w,
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.w),
                        color: AppColors.c666666),
                    child: Text(
                      palyer.position,
                      style: 10.w7(color: AppColors.cFFFFFF, height: 1),
                    )),
                6.hGap,
                if (CacheApi.playerStatusMap[item.playerStatus]?.statsId !=
                    null)
                  IconWidget(
                    iconWidth: 12.w,
                    iconHeight: 12.w,
                    icon: Utils.getStatusUrl(
                        CacheApi.playerStatusMap[item.playerStatus]?.statsId),
                  )
              ],
            ),
          ],
        ),
        12.hGap,
        // Obx(
        //   () => _NumChangeWidget(
        //     num: Random().nextInt(3),
        //     onChange: () {},
        //   ),
        // ),
        isBag ? 96.hGap : _recover(),
        9.hGap,

        AnimatedButton(
          onTap: () {
            controller.playerItemOnTap(isBag, item);
          },
          child: IconWidget(
            iconWidth: 15.w,
            backgroudWitdh: 32.w,
            backgroudheight: 32.w,
            borderRadius: BorderRadius.circular(16.w),
            border: Border.all(width: 1.w, color: AppColors.cB3B3B3),
            // backgroudColor: isBag ? AppColors.cFF7954 : null,
            icon: Assets.iconUiIconSwitch02,
            iconColor: isBag ? AppColors.c000000 : AppColors.c000000,
          ),
        ),
      ],
    );
  }

  Widget _recover() {
    return AnimatedButton(
      onTap: () {
        controller.recoverPower(uuid: item.uuid);
      },
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
              icon: Assets.iconUiIconStamina,
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

  ///更换球员不可用阴影
  Widget _enableContainer() {
    return InkWell(
      onTap: () {
        // if (item.uuid == controller.item1.uuid ||
        //     item.uuid == controller.item2.uuid) {
        //   controller.item1.isChange.value = false;
        //   controller.item2.isChange.value = false;
        //   controller.item2.position = -1;
        //   controller.isAdd = false;
        //   controller.update();
        // }
        controller.item1.isChange.value = false;
        controller.item2.isChange.value = false;
        controller.item2.position = -1;
        controller.isAdd = false;
        controller.update();
      },
      child: Container(
        // width: 343.w,
        // height: 84.w,
        margin: EdgeInsets.only(right: 16.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            // color: AppColors.c323232.withOpacity(0.5),
            color: Colors.black38,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.w),
                bottomRight: Radius.circular(16.w)),
            border: Border.all(
              width: 1.w,
              color: AppColors.c666666,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84.w,
      width: 360.w,
      child: Stack(
        children: [
          _playerPosition(),
          _playCard(),
          if (!controller.canChange(isBag, item)) _enableContainer()
          // (item > 5 && !isMain && !isBag) ? _addPlayer() : _playCard(),
        ],
      ),
    );
  }
}
