import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/main.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StatsRankWidget extends GetView<NewListController> {
  const StatsRankWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewListController>(
        id: "statsRank",
        builder: (_) {
          return Container(
            alignment: Alignment.centerLeft,
            height: 191.w,
            child: PageView.builder(
              controller: PageController(
                initialPage: 0,
                viewportFraction: 0.9,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: controller.state.statsRankMap.entries.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 20.w), // 控制左右间距
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(
                        RouteNames.statsRank,
                        id: GlobalNestedKey.NEWS,
                      );
                    },
                    child: StatsRankItem(index: index),
                  ),
                );
              },
            ),

            // child: ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 3,
            //     separatorBuilder: (context, index) {
            //       return 12.hGap;
            //     },
            //     itemBuilder: (context, index) {
            //       return InkWell(
            //           onTap: () {
            //             Get.toNamed(
            //               RouteNames.statsRank,
            //               id: GlobalNestedKey.NEWS,
            //             );
            //           },
            //           child: StatsRankItem(index: index));
            //     }),
          );
        });
  }
}

double width = MyApp.MAXWEBWIDTH.w * 0.9;

class StatsRankItem extends GetView<NewListController> {
  const StatsRankItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final item = controller.state.statsRankMap.entries.elementAt(index);
    return ShadowContainer(
      width: width,
      height: 190.w,
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
                  item.key,
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
          StatsListView(type: item.key, list: item.value)
        ],
      ),
    );
  }
}

class StatsListView extends GetView<NewListController> {
  const StatsListView({super.key, required this.type, required this.list});
  final String type;
  final List<NbaPlayerStat> list;

  @override
  Widget build(BuildContext context) {
    int count = list.length > 3 ? 3 : 0;
    return SizedBox(
      height: 152.w,
      child: ListView.separated(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = list[index];
            return SizedBox(
              height: 50.w,
              child: Row(
                children: [
                  Container(
                    width: 65.w,
                    alignment: Alignment.center,
                    child: Text(
                      "${index + 1}",
                      style: 21.w7(),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 4.w),
                        child: ImageWidget(
                          url: Utils.getPlayUrl(item.playerId),
                          width: 36.w,
                          height: 36.w,
                          imageFailedPath: Assets.head_0000Png,
                          borderRadius: BorderRadius.circular(18.w),
                        ),
                      ),

                      ///TODO
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Text(
                            Utils.getPlayBaseInfo(item.playerId!).grade,
                            style: 10.w7(color: AppColors.c1A1A1A),
                          )),
                    ],
                  ),
                  15.hGap,
                  Expanded(
                    child: Text(
                      item.player ?? "",
                      style: 12.w7(),
                    ),
                  ),
                  Text(
                    "${controller.getStartData(type, item)}",
                    style: 12.w7(),
                  ),
                  15.hGap,
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
