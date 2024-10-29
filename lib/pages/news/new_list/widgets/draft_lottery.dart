/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-24 18:39:28
 * @LastEditTime: 2024-10-29 14:30:23
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DraftLotteryWidget extends StatelessWidget {
  const DraftLotteryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewListController>(
        id: "newsList",
        builder: (controller) {
          if (controller.state.newsEntity.draft.length <= 1) {
            return Container();
          }
          return Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                13.vGap,
                Text(
                  "NBA Draft Lottery",
                  style: 19.w7(color: AppColors.c262626, height: 1),
                ),
                10.vGap,
                Stack(
                  children: [
                    Container(
                      width: 343.w,
                      height: 225.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.w),
                        image: const DecorationImage(
                            image: AssetImage(Assets.uiNewsBanner_01Png),
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter),
                        border: Border.all(
                          width: 1,
                          color: AppColors.c0D3D7B.withOpacity(0.05),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80.w,
                      left: 0,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 130.w,
                        width: 375.w,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.state.newsEntity.draft.length,
                          // itemCount: 5,
                          separatorBuilder: (context, index) => 9.hGap,
                          itemBuilder: (context, index) {
                            var item = controller.state.newsEntity.draft[index];
                            return InkWell(
                              onTap: () {
                                controller.pageToDetail(item);
                              },
                              child: _Item(item: item),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.item});
  final NewsListDetail item;

  @override
  Widget build(BuildContext context) {
    NewListController contr = Get.find();
    List<int> players = contr.getNBAPlayers(item.dataLabel);
    String name =
        players.isEmpty ? "" : Utils.getPlayBaseInfo(players.first).ename;
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 188.w,
        height: 130.w,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          color: AppColors.cF2F2F2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: 14.w7(color: AppColors.c262626),
            ),
            8.vGap,
            Text(
              item.content,
              maxLines: 3,
              style: 12.w4(color: AppColors.c262626),
            ),
            Expanded(child: Container()),
            Row(
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
          ],
        ),
      ),
    );
  }
}
