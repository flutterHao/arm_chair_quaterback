import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MoreNewsWidget extends StatelessWidget {
  const MoreNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 311.w,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          padding: const EdgeInsets.all(0),
          separatorBuilder: (context, index) => SizedBox(height: 6.w),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () =>
                  Get.toNamed(RouteNames.newsDetail, id: GlobalNestedKey.NEWS),
              child: Row(
                children: [
                  SizedBox(
                    width: 250.w,
                    child: Text(
                      maxLines: 1,
                      "Tyler O'Neill's 465-foot home run run run run ...",
                      overflow: TextOverflow.ellipsis,
                      style: 12.w4(color: AppColors.cB3B3B3),
                    ),
                  ),
                  Expanded(child: Container()),
                  IconWidget(
                    iconWidth: 12.w,
                    iconHeight: 12.w,
                    icon: Assets.uiIconArrowsPng,
                    iconColor: AppColors.c262626,
                  )
                ],
              ),
            );
          }),
    );
  }
}
