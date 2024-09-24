import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/main.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/index.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamRankWidget extends GetView<NewListController> {
  const TeamRankWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewListController>(
        id: "teamRank",
        builder: (context) {
          return Container(
            height: 225.w,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 20.w),
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.9,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: controller.state.teamMap.entries.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 20.w), // 控制左右间距
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(
                        RouteNames.teamRank,
                        id: GlobalNestedKey.NEWS,
                      );
                    },
                    child: TeamRankItem(index: index),
                  ),
                );
              },
            ),
          );
        });
  }
}

double width = MyApp.MAXWEBWIDTH.w * 0.9;

class TeamRankItem extends GetView<NewListController> {
  const TeamRankItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final item = controller.state.teamMap.entries.elementAt(index);
    return ShadowContainer(
      width: width,
      height: 225.w,
      child: Column(
        children: [
          Container(
            width: width,
            height: 36.w,
            decoration: BoxDecoration(
                color: AppColors.c262626,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.w),
                    topRight: Radius.circular(16.w))),
            child: Row(
              children: [
                10.hGap,
                Text(
                  item.key == 1 ? "EAST" : "WEST",
                  style: 16.w7(color: AppColors.cE6E6E),
                ),
                10.hGap,
                IconWidget(
                  iconWidth: 16.w,
                  iconHeight: 16.w,
                  icon: Assets.uiIconMsgPng,
                  iconColor: AppColors.cB3B3B3,
                ),
                Expanded(child: Container()),
                IconWidget(
                  iconWidth: 17.w,
                  iconHeight: 4.w,
                  icon: Assets.uiIconMorePng,
                  iconColor: AppColors.cFF7954,
                ),
                10.hGap,
              ],
            ),
          ),
          Container(
            width: width,
            height: 3.w,
            color: AppColors.cFF7954,
          ),
          18.vGap,
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  child: Text(
                    "team",
                    style: 11.w4(color: AppColors.cB3B3B3),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 88.w,
                  alignment: Alignment.center,
                  child: Text(
                    "W-L",
                    style: 11.w4(color: AppColors.cB3B3B3),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: 64.w,
                  child: Text(
                    "%",
                    style: 11.w4(color: AppColors.cB3B3B3),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: 40.w,
                  child: Text(
                    "GB",
                    style: 11.w4(color: AppColors.cB3B3B3),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
              width: width,
              child: TeamListView(
                list: item.value,
              ))
        ],
      ),
    );
  }
}

class TeamListView extends StatelessWidget {
  const TeamListView({super.key, required this.list});
  final List<TeamRankEntity> list;

  @override
  Widget build(BuildContext context) {
    int count = list.length > 3 ? 3 : 0;
    return SizedBox(
      height: 150.w,
      child: ListView.separated(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = list[index];
            return SizedBox(
              height: 48.w,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageWidget(
                            url: Utils.getTeamUrl(item.teamID),
                            width: 25.w,
                            height: 25.w,
                          ),
                          2.hGap,
                          Expanded(
                            child: Text(
                              item.shortEname,
                              style: 12.w7(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${item.wINS}-${item.lOSSES}",
                        style: 11.w4(color: AppColors.c666666),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: 64.w,
                      child: Text(
                        "${item.winPCT}",
                        style: 11.w4(color: AppColors.c666666),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: 40.w,
                      child: Text(
                        "${item.conferenceGamesBack}",
                        style: 11.w4(color: AppColors.c666666),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              width: 286.w,
              height: 0.5.w,
              color: AppColors.cDDDDE3,
            );
          },
          itemCount: count),
    );
  }
}
