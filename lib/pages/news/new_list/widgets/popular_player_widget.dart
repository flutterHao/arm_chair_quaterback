/*
 * @Description: 明星球员
 * @Author: lihonghao
 * @Date: 2024-10-25 15:16:18
 * @LastEditTime: 2024-10-31 15:25:24
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularPlayerWidget extends StatelessWidget {
  const PopularPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewListController>(
        id: "newsList",
        builder: (controller) {
          int length = controller.state.newsEntity.playerNews.length;
          if (length == 0) {
            return Container();
          }
          var list = controller.state.newsEntity.playerNews.entries;
          var playerKey = list.elementAt(0).key.obs;
          return Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.vGap,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "Popular Player",
                    style: 19.w7(color: AppColors.c262626, height: 1),
                  ),
                ),
                10.vGap,
                ShadowContainer(
                  // width: 343.w,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      Container(
                        height: 109.w,
                        alignment: Alignment.center,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemBuilder: (context, index) {
                            String key = list.elementAt(index).key;
                            int playerId = int.parse(key);
                            var player = Utils.getPlayBaseInfo(playerId);
                            return InkWell(
                              onTap: () {
                                playerKey.value = key;
                              },
                              child: Column(
                                children: [
                                  24.vGap,
                                  Container(
                                    decoration: BoxDecoration(
                                      border: playerKey.value == key
                                          ? Border.all(color: AppColors.c262626)
                                          : null,
                                      color: AppColors.cE1E1E1,
                                      borderRadius: BorderRadius.circular(30.w),
                                    ),
                                    child: ImageWidget(
                                      url: Utils.getPlayUrl(player.playerId),
                                      width: 55.w,
                                      height: 55.w,
                                      borderRadius: BorderRadius.circular(30.w),
                                      imageFailedPath: Assets.uiDefault_04Png,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60.w,
                                    child: Text(
                                      player.ename,
                                      style: 12.w4(color: AppColors.c262626),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => 15.hGap,
                          itemCount: controller
                              .state.newsEntity.playerNews.entries.length,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: AppColors.cD9D9D9,
                        margin: EdgeInsets.only(left: 9.w),
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: 20.w),
                          itemBuilder: (context, index) {
                            var item = controller.state.newsEntity
                                .playerNews[playerKey.value]![index];
                            return InkWell(
                              onTap: () => controller.pageToDetail(item),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            width: 2.w,
                                            color: AppColors.cFF7954))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Utils.getPlayBaseInfo(
                                              int.parse(playerKey.value))
                                          .ename,
                                      style: 14.w7(
                                          color: AppColors.c262626, height: 1),
                                    ),
                                    5.vGap,
                                    Text(
                                      item.title,
                                      maxLines: 3,
                                      style: 12.w4(color: AppColors.c262626),
                                    ),
                                    11.vGap,
                                    Row(
                                      children: [
                                        Text(
                                          DateUtil.formatDateMs(
                                            item.postTime,
                                            format: DateFormats.y_mo_d_h_m,
                                          ),
                                          style: 10.w4(
                                              color: AppColors.cB3B3B3,
                                              height: 1),
                                        ),
                                        14.hGap,
                                        Text(
                                          "-${item.source}",
                                          overflow: TextOverflow.ellipsis,
                                          style: 10.w4(
                                              color: AppColors.cB3B3B3,
                                              height: 1),
                                        ),
                                        Expanded(child: Container()),
                                        IconWidget(
                                          iconWidth: 14.w,
                                          icon: Assets.uiIconArrowsPng,
                                          iconColor: AppColors.c262626,
                                        ),
                                        5.hGap,
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return 20.vGap;
                          },
                          itemCount: controller.state.newsEntity
                              .playerNews[playerKey.value]!.length)
                    ],
                  ),
                ),
              ],
            );
          });
        });
  }
}
