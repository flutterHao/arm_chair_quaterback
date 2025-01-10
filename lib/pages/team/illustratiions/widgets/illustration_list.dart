/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-10 09:53:30
 * @LastEditTime: 2025-01-10 16:34:52
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IllustrationList extends StatelessWidget {
  const IllustrationList({super.key});

  @override
  Widget build(BuildContext context) {
    TeamController teamController = Get.find();
    return GetBuilder<IllustratiionsController>(builder: (ctrl) {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            width: double.infinity,
            height: 37.w,
            color: AppColors.c4D4D4D,
            child: Row(
              children: [
                IconWidget(
                  iconWidth: 19.w,
                  icon: Assets.managerUiManagerArchiveAtlas,
                ),
                8.5.hGap,
                Expanded(
                    child: Text(
                  "${teamController.myBagList.length}/500",
                  style: 14.w4(
                    color: AppColors.cFFFFFF,
                    fontFamily: FontFamily.fRobotoRegular,
                  ),
                )),
                IconWidget(
                  iconWidth: 17.w,
                  icon: Assets.commonUiCommonIconSift,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 25.w),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: teamController.myTeamEntity.teamPlayers.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 100 / 160,
                  crossAxisSpacing: 16.5.w,
                  mainAxisSpacing: 10.w,
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return _Item(index: index);
              },
            ),
          ),
          14.vGap,
          Container(
            margin: EdgeInsets.only(left: 16.w),
            width: double.infinity,
            child: Text(
              "free agency".toUpperCase(),
              style: 24.w4(fontFamily: FontFamily.fOswaldBold, height: 0.9),
            ),
          ),
          16.vGap,
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.cD1D1D1,
          ),
          SizedBox(
            width: double.infinity,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 25.w),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  (teamController.myTeamEntity.teamPlayers.length / 3).ceil(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 100 / 160,
                  crossAxisSpacing: 16.5.w,
                  mainAxisSpacing: 10.w,
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return _Item(index: index);
              },
            ),
          ),
        ],
      );
    });
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    TeamController teamController = Get.find();
    Random random = Random();

    int count = random.nextInt(100);

    count = index == 0 ? 100 : count;
    var achive = count == 100;

    var item = teamController.myTeamEntity.teamPlayers[index];

    return InkWell(
      onTap: () => Get.toNamed(RouteNames.illustrationDetail, arguments: {
        "playerId": item.playerId,
        "isAchivement": achive,
      }),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 100.w,
              height: 140.w,
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.w),
                  color: achive ? AppColors.cFFFFFF : AppColors.cE6E6E),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ImageWidget(
                    url: Utils.getPlayUrl(item.playerId),
                    color: achive ? null : AppColors.c000000.withOpacity(0.2),
                    width: 100.w,
                    height: 140.w,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16.w,
                      alignment: Alignment.center,
                      color: AppColors.c262626,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      height: 16.w,
                      width: count.w,
                      alignment: Alignment.center,
                      color: AppColors.c10A86A,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        height: 16.w,
                        alignment: Alignment.center,
                        child: Text(
                          "$count/100",
                          style: 12.w4(
                            color: AppColors.cFFFFFF,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                        )),
                  ),
                  Positioned(
                    left: 4.5.w,
                    bottom: 2.5.w,
                    child: IconWidget(
                      iconWidth: 13.w,
                      // iconHeight: 12.8.w,
                      icon: Assets.managerUiManagerArchiveDebris,
                      iconColor: AppColors.cFFFFFF,
                    ),
                  )
                ],
              ),
            ),
            5.5.vGap,
            Text(
              Utils.getPlayBaseInfo(item.playerId).ename,
              overflow: TextOverflow.ellipsis,
              style: 16.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.8),
            ),
          ],
        ),
      ),
    );
  }
}
