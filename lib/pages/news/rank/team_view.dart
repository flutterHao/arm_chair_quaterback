/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-14 16:54:10
 * @LastEditTime: 2024-12-30 18:57:51
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arm_chair_quaterback/pages/news/rank/controller.dart';

class TeamRankPage extends GetView<RankController> {
  const TeamRankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RankController>(
        id: "teamRank",
        builder: (_) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 9.w),
              child: Column(
                children: [
                  if (controller.teamTypeIndex.value == 0) RankList(type: 0),
                  if (controller.teamTypeIndex.value == 1)
                    ...List.generate(6, (i) {
                      return Column(
                        children: [
                          RankList(type: i + 1),
                          9.vGap,
                        ],
                      );
                    })
                ],
              ),
            ),
          );
        });
  }
}

class RankList extends GetView<RankController> {
  const RankList({super.key, ty, required this.type});
  final int type;

  @override
  Widget build(BuildContext context) {
    var list = controller.teamRankList;
    if (type != 0) {
      list = list.where((e) => e.teamDivision == type).toList();
    }
    String area = controller.getTypeName(type);

    List<String> colomns = [
      type == 0 ? "LEAGUE" : "$area Division",
      "W-L",
      "GB"
    ];
    List<double> colomnsWidth = [150.w, 35.w, 30.w];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.w),
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 300.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Column(
        children: [
          Container(
            // color: Colors.red,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              controller.getTeamRankTitle(type),
              // textAlign: TextAlign.center,
              maxLines: 2,
              style: 21.w4(
                fontFamily: FontFamily.fOswaldMedium,
                height: 1,
              ),
            ),
          ),
          27.vGap,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 0; i < colomns.length; i++)
                  SizedBox(
                    width: colomnsWidth[i],
                    child: Text(
                      colomns[i],
                      style: 12.w4(
                          fontFamily: FontFamily.fRobotoMedium, height: 0.8),
                    ),
                  )
              ],
            ),
          ),
          2.vGap,
          Container(
            margin: EdgeInsets.symmetric(vertical: 9.w),
            width: double.infinity,
            height: 1,
            color: AppColors.cD1D1D1,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var e = list[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // margin: EdgeInsets.only(left: 16.w),
                        width: colomnsWidth[0],
                        child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${index + 1}",
                                style: 10
                                    .w4(fontFamily: FontFamily.fRobotoRegular),
                              ),
                              13.hGap,
                              ImageWidget(
                                url: Utils.getTeamUrl(e.teamID),
                                width: 20.w,
                              ),
                              9.hGap,
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: AppColors.c666666,
                                            width: 1))),
                                child: Text(
                                  e.teamName,
                                  style: 12.w4(
                                    height: 1,
                                    fontFamily: FontFamily.fRobotoMedium,
                                    color: AppColors.c000000,
                                  ),
                                ),
                              )
                            ]),
                      ),
                      SizedBox(
                        width: colomnsWidth[1],
                        child: Text(
                          "${e.wINS}-${e.lOSSES}",
                          style: 12.w4(
                            fontFamily: FontFamily.fRobotoRegular,
                            color: AppColors.c4D4D4D,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: colomnsWidth[2],
                        child: Text(
                          "${e.conferenceGamesBack}",
                          style: 12.w4(
                            fontFamily: FontFamily.fRobotoRegular,
                            color: AppColors.c4D4D4D,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => 17.vGap,
              itemCount: list.length)
        ],
      ),
    );
  }
}

class TeamRankSelectDialog extends GetView<RankController> {
  const TeamRankSelectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RankController>(
        id: "teamRank",
        builder: (context) {
          return SimpleBottomDialog(
              height: 367.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  26.vGap,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "NBA Team rankings".toUpperCase(),
                      style: 19.w4(
                          fontFamily: FontFamily.fOswaldMedium, height: 0.8),
                    ),
                  ),
                  12.5.vGap,
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: AppColors.cD1D1D1,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var selected = controller.teamTypeIndex.value == index;
                        return InkWell(
                          onTap: () {
                            controller.teamTypeIndex.value = index;
                            controller.update(["teamRank"]);
                            Get.back();
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 21.w, horizontal: 31.5.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.teamRankType[index],
                                    style: selected
                                        ? 14.w4(
                                            fontFamily:
                                                FontFamily.fOswaldMedium,
                                            color: AppColors.c000000,
                                            height: 0.8)
                                        : 14.w4(
                                            fontFamily:
                                                FontFamily.fOswaldRegular,
                                            color: AppColors.cB3B3B3,
                                            height: 0.8),
                                  ),
                                  if (selected)
                                    IconWidget(
                                      iconWidth: 14.w,
                                      icon: Assets
                                          .commonUiCommonStatusBarMission02,
                                      iconColor: AppColors.c000000,
                                    )
                                ],
                              )),
                        );
                      },
                      separatorBuilder: (context, index) => Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            height: 1,
                            color: AppColors.cE6E6E,
                          ),
                      itemCount: controller.teamRankType.length),
                  // Container(
                  //   width: double.infinity,
                  //   height: 1,
                  //   color: AppColors.cD1D1D1,
                  // ),
                ],
              ));
        });
  }
}
