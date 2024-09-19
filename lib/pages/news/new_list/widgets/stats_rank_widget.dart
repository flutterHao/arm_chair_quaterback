import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StatsRankWidget extends StatelessWidget {
  const StatsRankWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 191.w,
      child: PageView.builder(
        controller: PageController(
          initialPage: 0,
          viewportFraction: 0.9,
        ),
        physics: const BouncingScrollPhysics(),
        reverse: true,
        itemCount: 3,
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
              child: SizedBox(
                width: 312.w, // 设置固定的宽度
                child: StatsRankItem(index: index),
              ),
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
  }
}

class StatsRankItem extends StatelessWidget {
  const StatsRankItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    double width = 375.w * 0.9;
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
                  "DPS",
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
          StatsListView()
        ],
      ),
    );
  }
}

class StatsListView extends StatelessWidget {
  const StatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 152.w,
      child: ListView.separated(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
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
                      ImageWidget(
                        url:
                            "https://pic3.zhimg.com/80/v2-6d7d2480107f691ebf925b85160a1072_720w.webp",
                        width: 36.w,
                        height: 36.w,
                        borderRadius: BorderRadius.circular(18.w),
                      ),
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Text(
                            "SSS",
                            style: 10.w7(color: AppColors.c1A1A1A),
                          )),
                    ],
                  ),
                  Container(
                    width: 145.w,
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                      "G · CLEAVINGER",
                      style: 12.w7(color: AppColors.c666666),
                    ),
                  ),
                  Text(
                    "1.107",
                    style: 12.w7(),
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
          itemCount: 3),
    );
  }
}
