import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamRankWidget extends StatelessWidget {
  const TeamRankWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225.w,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (context, index) {
            return 12.hGap;
          },
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () => Get.toNamed(RouteNames.teamRank, id: 1),
                child: TeamRankItem(index: index));
          }),
    );
  }
}

class TeamRankItem extends StatelessWidget {
  const TeamRankItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      width: 312.w,
      height: 225.w,
      child: Column(
        children: [
          Container(
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
                  "EAST",
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
            width: 312.w,
            height: 3.w,
            color: AppColors.cFF7954,
          ),
          18.vGap,
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 120.w,
                child: Text(
                  "team",
                  style: 11.w4(color: AppColors.cB3B3B3),
                ),
              ),
              Container(
                width: 88.w,
                alignment: Alignment.center,
                child: Text(
                  "W-L",
                  style: 11.w4(color: AppColors.cB3B3B3),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 64.w,
                child: Text(
                  "%",
                  style: 11.w4(color: AppColors.cB3B3B3),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 40.w,
                child: Text(
                  "GB",
                  style: 11.w4(color: AppColors.cB3B3B3),
                ),
              )
            ],
          ),
          TeamListView()
        ],
      ),
    );
  }
}

class TeamListView extends StatelessWidget {
  const TeamListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.w,
      child: ListView.separated(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 48.w,
              child: Row(
                children: [
                  SizedBox(
                    width: 120.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageWidget(
                          url: "https://file.qiumiwu.com/team/WAS_300.png",
                          width: 25.w,
                        ),
                        2.hGap,
                        Text(
                          "BAL",
                          style: 12.w7(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 88.w,
                    alignment: Alignment.center,
                    child: Text(
                      "61-64",
                      style: 11.w4(color: AppColors.c666666),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 64.w,
                    child: Text(
                      "0.598",
                      style: 11.w4(color: AppColors.c666666),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 40.w,
                    child: Text(
                      "2.0",
                      style: 11.w4(color: AppColors.c666666),
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
          itemCount: 3),
    );
  }
}
