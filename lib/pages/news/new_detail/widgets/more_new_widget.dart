/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-10 17:28:39
 * @LastEditTime: 2024-11-18 17:30:36
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-10 17:28:39
 * @LastEditTime: 2024-09-20 17:51:56
 */
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';

import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MoreNewsWidget extends StatelessWidget {
  const MoreNewsWidget({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    NewsDetailController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (controller.state.moreList.isNotEmpty)
          Text("More news", style: 14.w7(color: AppColors.c262626)),
        12.vGap,
        if (controller.state.moreList.isNotEmpty)
          ShadowContainer(
            backgroudColor: Colors.white,
            padding: EdgeInsets.all(16.w),
            child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.state.moreList.length,
                padding: const EdgeInsets.all(0),
                separatorBuilder: (context, index) => SizedBox(height: 10.w),
                itemBuilder: (context, index) {
                  NewsListDetail item = controller.state.moreList[index];
                  Color color =
                      item.isView == 1 ? AppColors.cB3B3B3 : AppColors.c666666;
                  return InkWell(
                    onTap: () async {
                      item.isView = 1;
                      await Get.toNamed(RouteNames.newsDetail,
                          arguments: item, id: GlobalNestedKey.NEWS);
                      controller.update();
                    },
                    // onTap: (){
                    //   controller.getNewsDetail(item.id);
                    // },
                    child: Row(
                      children: [
                        IconWidget(
                          iconWidth: 15.w,
                          icon: Assets.iconUiIconRead,
                          iconColor: item.isView == 0
                              ? AppColors.cFF7954
                              : AppColors.cB3B3B3,
                        ),
                        4.hGap,
                        Expanded(
                          // width: 250.w,
                          child: Text(
                            maxLines: 1,
                            item.title ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: 12.w4(color: color),
                          ),
                        ),
                        20.hGap,
                        IconWidget(
                          iconWidth: 12.w,
                          iconHeight: 12.w,
                          icon: Assets.iconUiIconArrows,
                          iconColor: color,
                        )
                      ],
                    ),
                  );
                }),
          ),
      ],
    );
  }
}
