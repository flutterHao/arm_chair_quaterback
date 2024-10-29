/*
 * @Description:队伍球员谣言
 * @Author: lihonghao
 * @Date: 2024-10-24 21:19:47
 * @LastEditTime: 2024-10-29 14:17:49
 */

import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/regular_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RumorWidget extends StatelessWidget {
  const RumorWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewListController>(
        id: "newsList",
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.vGap,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Rumor",
                  style: 19.w7(color: AppColors.c262626),
                ),
              ),
              if (controller.state.newsEntity.teamRumors.isNotEmpty)
                Container(
                  alignment: Alignment.centerLeft,
                  height: 210.w,
                  width: 375.w,
                  margin: EdgeInsets.only(top: 10.w),
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount:
                        controller.state.newsEntity.teamRumors.entries.length,
                    // itemCount: 5,
                    itemBuilder: (context, index) {
                      NewsListDetail item = controller
                          .state.newsEntity.teamRumors.entries
                          .elementAt(index)
                          .value;
                      item.teams = controller.getNBATeams(item.dataLabel);
                      return InkWell(
                        onTap: () {
                          controller.pageToDetail(item);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 9.w), // 控制左右间距
                          child: _Item1(item),
                        ),
                      );
                    },
                  ),
                ),
              if (controller.state.newsEntity.playerRumors.isNotEmpty)
                ListView.separated(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.state.newsEntity.playerRumors.length,
                  // itemCount: 5,
                  separatorBuilder: (context, index) => 9.vGap,
                  itemBuilder: (context, index) {
                    var item = controller.state.newsEntity.playerRumors.entries
                        .elementAt(index)
                        .value;
                    item.players = controller.getNBAPlayers(item.dataLabel);
                    item.teams = controller.getNBATeams(item.dataLabel);
                    // bool isEmpty = item.players.isEmpty && item.teams.isEmpty;
                    return InkWell(
                      onTap: () {
                        controller.pageToDetail(item);
                      },
                      child: _Item2(item: item),
                    );
                  },
                )
            ],
          );
        });
  }
}

class _Item1 extends GetView<NewListController> {
  const _Item1(this.item);
  final NewsListDetail item;

  Widget _team() {
    return Container(
        width: 188.w,
        height: 80.w,
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: controller
              .getTeamColor(item.teams.isNotEmpty ? item.teams[0] : 0),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.w), topRight: Radius.circular(16.w)),
        ),
        child: item.teams.isNotEmpty
            ? Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: -44.w,
                    child: Opacity(
                      opacity: 0.5,
                      child: ImageWidget(
                        url: Utils.getTeamUrl(item.teams[0]),
                        width: 140.w,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 20.w,
                      child: _TeamNameWidget(
                          teamName: Utils.getTeamInfo(item.teams[0]).longEname))
                ],
              )
            : Container());
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 188.w,
        height: 210.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: AppColors.cF2F2F2),
        child: Column(
          children: [
            _team(),
            Container(
              margin: EdgeInsets.all(10.w),
              child: Text(
                "${item.content}",
                maxLines: 3,
                style: 12.w4(color: AppColors.c262626),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Text(
                    DateUtil.formatDateMs(
                      item.postTime,
                      format: DateFormats.y_mo_d_h_m,
                    ),
                    style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                  ),
                  6.hGap,
                  Expanded(
                    child: Text(
                      "-${item.source}",
                      overflow: TextOverflow.ellipsis,
                      style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
              child: NewsPercentWidget(
                  leftTitle: "Ture",
                  rightTitle: "False",
                  leftCount: item.likes,
                  rightCount: item.unLikes),
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamNameWidget extends StatelessWidget {
  final String teamName;

  const _TeamNameWidget({super.key, required this.teamName});

  @override
  Widget build(BuildContext context) {
    final List<String> parts = splitTeamName(teamName);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(parts[0], style: 18.w4(color: AppColors.cF2F2F2, height: 1)),
        // 4.5.vGap,
        Text(parts[1], style: 26.w4(color: AppColors.cF2F2F2, height: 1)),
      ],
    );
  }

  List<String> splitTeamName(String teamName) {
    final List<String> parts = teamName.split(' ');
    if (parts.length < 2) {
      return [teamName, '']; // 如果没有足够的部分，返回原字符串和空字符串
    }
    final int lastWordIndex = parts.length - 1;
    final String location = parts.sublist(0, lastWordIndex).join(' ');
    final String name = parts[lastWordIndex];
    return [location, name];
  }
}

class _Item2 extends StatelessWidget {
  const _Item2({required this.item});
  final NewsListDetail item;

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      width: 343.w,
      height: 120.w,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(16.w), color: AppColors.cF2F2F2),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 95.w,
                height: 79.w,
                child: Stack(
                  children: [
                    if (item.teams.isNotEmpty)
                      Positioned(
                        left: -20.w,
                        top: -20.w,
                        child: Opacity(
                          opacity: 0.2,
                          child: ImageWidget(
                            url: Utils.getTeamUrl(item.teams[0]),
                            width: 100.w,
                          ),
                        ),
                      ),
                    if (item.players.isNotEmpty)
                      Positioned(
                        bottom: 0.w,
                        right: 0.w,
                        child: ImageWidget(
                          url: Utils.getPlayUrl(item.players[0]),
                          width: 100.w,
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.w),
                    child: Text(
                      item.content,
                      maxLines: 3,
                      style: 12.w4(color: AppColors.c262626),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Text(
                          DateUtil.formatDateMs(
                            item.postTime,
                            format: DateFormats.y_mo_d_h_m,
                          ),
                          style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                        ),
                        6.hGap,
                        Expanded(
                          child: Text(
                            "-${item.source}",
                            overflow: TextOverflow.ellipsis,
                            style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
            child: NewsPercentWidget(
                leftTitle: "True",
                rightTitle: "False",
                leftCount: item.likes,
                rightCount: item.unLikes),
          ),
        ],
      ),
    );
  }
}

// String getTeasTeamUrl() {
//   Random random = Random();
//   return Utils.getTeamUrl(random.nextInt(30) + 100);
// }

// String getTestPlayerUrl() {
//   Random random = Random();
//   return Utils.getPlayUrl(random.nextInt(3) + 1281);
// }
