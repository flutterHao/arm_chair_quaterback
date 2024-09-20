/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-10 17:28:39
 * @LastEditTime: 2024-09-20 10:05:46
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MoreNewsWidget extends GetView<NewsDetailController> {
  const MoreNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.state.moreList.length,
        padding: const EdgeInsets.all(0),
        separatorBuilder: (context, index) => SizedBox(height: 6.w),
        itemBuilder: (context, index) {
          NewsDetail item = controller.state.moreList[index];
          Color color =
              item.isView == 1 ? AppColors.cB3B3B3 : AppColors.c666666;
          return InkWell(
            onTap: () => Get.toNamed(RouteNames.newsDetail,
                arguments: item.id, id: GlobalNestedKey.NEWS),
            child: Row(
              children: [
                Expanded(
                  // width: 250.w,
                  child: Text(
                    maxLines: 1,
                    item.content ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: 12.w4(color: color),
                  ),
                ),
                20.hGap,
                IconWidget(
                  iconWidth: 12.w,
                  iconHeight: 12.w,
                  icon: Assets.uiIconArrowsPng,
                  iconColor: color,
                )
              ],
            ),
          );
        });
  }
}
