/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-24 18:04:19
 * @LastEditTime: 2024-10-24 20:00:36
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/index.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayerDynamicsWidget extends StatelessWidget {
  const PlayerDynamicsWidget({super.key});

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
                  "Player Dynamics",
                  style: 19.w7(color: AppColors.c262626),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 10.w),
                itemBuilder: (context, index) => InkWell(
                  onTap: () => controller.pageToDetail(index),
                  child: _Item(
                    item: controller.state.newsList[index],
                  ),
                ),
                separatorBuilder: (context, index) => 9.vGap,
                itemCount: controller.state.newsList.length,
              )
            ],
          );
        });
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.item});
  final NewsDetail item;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 343.w,
        height: 75.w,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          color: AppColors.cF2F2F2,
        ),
        child: Row(
          children: [
            Image.asset(
              Assets.uiIconInjuryPng,
              width: 45.w,
              fit: BoxFit.fitWidth,
            ),
            13.hGap,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${item.content}",
                    maxLines: 2,
                    style: 12.w4(color: AppColors.c262626),
                  ),
                  10.vGap,
                  Row(
                    children: [
                      Text(
                        DateUtil.formatDateMs(
                          item.postTime!,
                          format: DateFormats.y_mo_d_h_m,
                        ),
                        style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                      ),
                      6.hGap,
                      Expanded(
                        child: Text(
                          item.source ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
