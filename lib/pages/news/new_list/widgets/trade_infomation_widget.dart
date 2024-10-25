/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-24 18:04:19
 * @LastEditTime: 2024-10-25 10:13:27
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/index.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/regular_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TradeInfomationWidget extends StatelessWidget {
  const TradeInfomationWidget({super.key});

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
                  "Trade Information",
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

  _arrowView() {
    return List.generate(4, (index) {
      return IconWidget(
        iconWidth: 46.w,
        icon: Assets.uiImageArrow,
        iconColor: AppColors.c4CB8FC.withOpacity((index + 1) / 4),
      );
    });
  }

  _playerView() {
    return [
      Positioned(
        left: 90.w,
        bottom: 0,
        child: ImageWidget(
          url: Utils.getPlayUrl(1005),
          height: 78.w,
        ),
      ),
      Positioned(
        right: 90.w,
        bottom: 0,
        child: ImageWidget(
          url: Utils.getPlayUrl(1007),
          height: 78.w,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 343.w,
        height: 197.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          color: AppColors.cF2F2F2,
        ),
        child: Column(
          children: [
            Container(
              width: 343.w,
              height: 85.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.w),
                  topRight: Radius.circular(16.w),
                ),
                color: AppColors.c262626,
              ),
              child: Stack(
                children: [
                  ///队伍
                  Positioned(
                    left: -20.w,
                    bottom: 0,
                    child: Opacity(
                      opacity: 0.6,
                      child: ImageWidget(
                        url: Utils.getTeamUrl(105),
                        width: 110.w,
                        // color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -20.w,
                    bottom: 0,
                    child: Opacity(
                      opacity: 0.6,
                      child: ImageWidget(
                        url: Utils.getTeamUrl(103),
                        width: 110.w,
                        fit: BoxFit.fitWidth,
                        // color: Colors.red,
                      ),
                    ),
                  ),

                  ///渐变背景
                  // Container(
                  //   width: 343.w,
                  //   height: 85.w,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(16.w),
                  //       topRight: Radius.circular(16.w),
                  //     ),
                  //     gradient: LinearGradient(
                  //       begin: Alignment.centerLeft,
                  //       end: Alignment.centerRight,
                  //       colors: [
                  //         AppColors.c262626.withOpacity(0.5),
                  //         AppColors.c262626.withOpacity(0.3),
                  //         AppColors.c262626.withOpacity(0.2),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  ///箭头
                  Positioned(
                    top: 11.w,
                    left: 79.w,
                    child: Row(
                      children: _arrowView(),
                    ),
                  ),

                  ///球员
                  ..._playerView()
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
              child: Column(
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
            ),
            const Expanded(child: SizedBox()),
            Container(
              padding: EdgeInsets.all(10.w),
              child: NewsPercentWidget(
                  leftTitle: "True",
                  rightTitle: "False",
                  leftCount: 78,
                  rightCount: 22),
            ),
          ],
        ),
      ),
    );
  }
}
