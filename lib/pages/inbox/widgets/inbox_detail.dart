/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-04 16:26:49
 * @LastEditTime: 2025-01-04 18:35:36
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-04 16:26:49
 * @LastEditTime: 2025-01-04 17:31:55
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/inbox_message_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/send_comments_view.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/inbox/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InboxDetailPage extends GetView<InboxController> {
  const InboxDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var item = Get.arguments as InboxMessageEntity;
    // Random random = Random();
    // var duration = Duration(minutes: random.nextInt(100));
    // var datetime = DateTime.now().subtract(duration);
    String icon = Utils.getMessageIcon(item.userIcon);
    String title = item.userName;

    return GetBuilder<InboxController>(
        id: "inbox_detail",
        builder: (_) {
          return HorizontalDragBackWidget(
            child: BlackAppWidget(
              backgroundColor: AppColors.cFFFFFF,
              AppBarWidget(
                title: title,
                right: IconWidget(iconWidth: 26.w, icon: Assets.iconUiIconMore),
              ),
              bodyWidget: SingleChildScrollView(
                child: Column(
                  children: [
                    MeesageItems(
                      icon: icon,
                      item: item,
                    ),
                  ],
                ),
              ),
              floatWidgets: [
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SendCommentView(
                      onSend: (v) {
                        item.messageList2.add(v);
                        controller.update(["inbox_detail"]);
                      },
                    ))
              ],
            ),
          );
        });
  }
}

class MeesageItems extends StatelessWidget {
  const MeesageItems({super.key, required this.icon, required this.item});
  final String icon;
  final InboxMessageEntity item;

  @override
  Widget build(BuildContext context) {
    int teamLogo =
        HomeController.to.userEntiry?.teamLoginInfo?.team?.teamLogo ?? 0;
    return Container(
      margin: EdgeInsets.only(top: 20.w, left: 16.w, right: 16.w),
      child: Column(
        children: [
          Text(
            "${MyDateUtils.formatDate(item.time, format: DateFormats.Y_M_D)}  ${MyDateUtils.formatAM_HM(item.time)}",
            style: 14.w4(
              color: AppColors.cB3B3B3,
              fontFamily: FontFamily.fRobotoRegular,
            ),
          ),
          11.vGap,
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => 9.vGap,
            itemCount: item.messageList.length,
            itemBuilder: (context, index) {
              var message = item.messageList[index];
              return Row(
                children: [
                  ImageWidget(
                    url: icon,
                    width: 36.w,
                    height: 36.w,
                    borderRadius: BorderRadius.circular(18.w),
                  ),
                  12.hGap,
                  Container(
                    constraints: BoxConstraints(maxWidth: 280.w),
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                      color: AppColors.cF2F2F2,
                      borderRadius: BorderRadius.circular(9.w),
                    ),
                    child: Text(
                      message,
                      style: 14.w4(
                        fontFamily: FontFamily.fRobotoRegular,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          if (item.messageList2.isNotEmpty)
            Container(
              margin: EdgeInsets.only(top: 20.w),
              child: Text(
                "${MyDateUtils.formatDate(DateTime.now(), format: DateFormats.Y_M_D)}  ${MyDateUtils.formatAM_HM(item.time)}",
                style: 14.w4(
                  color: AppColors.cB3B3B3,
                  fontFamily: FontFamily.fRobotoRegular,
                ),
              ),
            ),
          11.vGap,
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => 9.vGap,
            itemCount: item.messageList2.length,
            itemBuilder: (context, index) {
              var message = item.messageList2[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 280.w),
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                      color: AppColors.c000000,
                      borderRadius: BorderRadius.circular(9.w),
                    ),
                    child: Text(
                      message,
                      style: 14.w4(
                          fontFamily: FontFamily.fRobotoRegular,
                          height: 1.2,
                          color: AppColors.cFFFFFF),
                    ),
                  ),
                  12.hGap,
                  ImageWidget(
                    url: Utils.getAvaterUrl(teamLogo),
                    width: 36.w,
                    height: 36.w,
                    borderRadius: BorderRadius.circular(18.w),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
