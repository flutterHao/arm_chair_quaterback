/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-27 12:17:59
 * @LastEditTime: 2025-02-28 19:10:44
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/girl_dialogue_define_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});
  final GirlDialogueDefineEntity message;

  String getCurrentDataStr(int ms) {
    DateTime now = DateTime.now();
    DateTime targetDate = DateTime.fromMillisecondsSinceEpoch(ms);

    if (now.difference(targetDate).inDays > 1) {
      // 如果超过一天，显示日期
      return MyDateUtils.formatDateMilliseconds(ms, format: "yyyy-MM-dd");
    } else {
      // 否则显示时间
      return MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(ms));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 32.w,
        maxWidth: 240.w,
      ),
      margin: EdgeInsets.only(top: message.type == 2 ? 3.w : 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        color: message.type == 1 ? AppColors.cED4873 : AppColors.cFFFFFF,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 5.w,
          bottom: 3.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.context,
              style: 14.w4(
                fontFamily: FontFamily.fRobotoRegular,
                color:
                    message.type == 1 ? AppColors.cFFFFFF : AppColors.c000000,
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
            3.vGap,
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                getCurrentDataStr(message.updateTime),
                style: 10.w4(
                    fontFamily: FontFamily.fRobotoRegular,
                    color: message.type == 1
                        ? AppColors.cFFFFFF
                        : AppColors.cB3B3B3,
                    height: 1),
              ),
            )
          ],
        ),
      ),
    );
    // return LayoutBuilder(
    //   builder: (context, constraints) {
    //     final maxWidth = min(240.w, constraints.maxWidth * 0.8); // 动态宽度限制

    //     return SizedBox(
    //       width: maxWidth,
    //       height: 32.w,
    //       child: Stack(
    //         clipBehavior: Clip.none,
    //         children: [
    //           Positioned(
    //             bottom: 0,
    //             left: isLeft ? 0 : null,
    //             right: !isLeft ? 0 : null,
    //             child: Image.asset(
    //               Assets.managerUiManagerBubble,
    //               width: 12.5.w,
    //               height: 16.5.w,
    //               fit: BoxFit.fill,
    //               color: isLeft ? AppColors.cED4873 : AppColors.cFFFFFF,
    //             ),
    //           ),
    //           Positioned(
    //             top: 0,
    //             bottom: 0,
    //             left: isLeft ? 5.5.w : null,
    //             right: !isLeft ? 5.5.w : null,
    //             child: Container(
    //               constraints: BoxConstraints(
    //                 minHeight: 32.w,
    //                 maxWidth: maxWidth,
    //               ),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(16.w),
    //                 color: isLeft ? AppColors.cED4873 : AppColors.cFFFFFF,
    //               ),
    //               child: Padding(
    //                 padding: EdgeInsets.only(
    //                   left: 10.w,
    //                   right: 10.w,
    //                   top: 5.w,
    //                   bottom: 5.w,
    //                 ),
    //                 child: Text(
    //                   message.dialogue,
    //                   style: 14.w4(
    //                     fontFamily: FontFamily.fRobotoRegular,
    //                     color: isLeft ? AppColors.cFFFFFF : AppColors.cED4873,
    //                   ),
    //                   softWrap: true,
    //                   overflow: TextOverflow.visible,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}

class SelectBubble extends StatelessWidget {
  const SelectBubble({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 323.w,
      height: 51.w,
      margin: EdgeInsets.only(top: 9.w),
      // constraints: BoxConstraints(
      //   minHeight: 51.w,
      //   maxWidth: 323.w,
      // ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Positioned(
            right: 6.w,
            bottom: 0,
            child: Container(
              width: 323.w,
              height: 51.w,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.w),
                color: AppColors.c000000,
              ),
              child: Text(
                message,
                style: 14.w4(
                  fontFamily: FontFamily.fRobotoRegular,
                  color: AppColors.cFFFFFF,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Transform.scale(
              scaleX: -1,
              child: Image.asset(
                Assets.managerUiManagerBubble,
                width: 12.5.w,
                height: 16.5.w,
                fit: BoxFit.fill,
                color: AppColors.c000000,
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
