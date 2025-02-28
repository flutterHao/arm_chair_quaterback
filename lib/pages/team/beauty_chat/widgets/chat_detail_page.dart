/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-26 19:58:38
 * @LastEditTime: 2025-02-28 19:04:30
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/beauty_chat/controller.dart';
import 'package:arm_chair_quaterback/pages/team/beauty_chat/widgets/chat_bubble.dart';
import 'package:arm_chair_quaterback/pages/team/beauty_chat/widgets/girl_head_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeautyChatController>(
      init: BeautyChatController(),
      id: "beauty_chat",
      builder: (controller) {
        var list = controller.girlChatEntity.historicalChatRecords;
        var chooseList = list.last.choices;
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              width: 375.w,
              height: 707.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23.w),
                border: Border(
                  top: BorderSide(width: 5.w, color: AppColors.cE6E6E),
                  left: BorderSide(width: 5.w, color: AppColors.cE6E6E),
                  right: BorderSide(width: 5.w, color: AppColors.cE6E6E),
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    width: 365.w,
                    height: 707.h,
                    Assets.managerUiManagerChat01,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                    top: 0,
                    child: Image.asset(
                      Assets.managerUiManagerChat02,
                      width: 365.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 40.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 13.w, vertical: 10.w),
                      child: IconWidget(
                        icon: Assets.iconUiIconArrows04,
                        iconWidth: 19.w,
                        iconColor: AppColors.c000000,
                        rotateAngle: 90,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 41.5.w,
                      right: 16.w,
                      child: GirlHeadWidget(
                        url: controller.getCurrentGirl().icon,
                      )),
                  Positioned(top: 44.5.w, child: GirlOnlineWidget()),
                  Positioned(
                    top: 86.w,
                    left: 15.w,
                    right: 15.w,
                    bottom: 0,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Align(
                          alignment: list[index].type == 1
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.only(top: 4.w),
                            child: ChatBubble(
                              message: list[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (chooseList.isNotEmpty)
                    Positioned(
                      bottom: 41.w,
                      left: 21.w,
                      right: 15.5.w,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: chooseList.length,
                        itemBuilder: (context, index) {
                          return MtInkWell(
                            onTap: () {
                              int messageId =
                                  controller.girlChatEntity.currentMessageId;
                              controller.nextMessage(index, messageId);
                            },
                            child: SelectBubble(
                              message: chooseList[index],
                            ),
                          );
                        },
                      ),
                    ),
                ],
              )),
        );
      },
    );
  }
}

class GirlOnlineWidget extends GetView<BeautyChatController> {
  const GirlOnlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.managerUiManagerIconLock,
              width: 14.w,
              // height: 15.5.w,
              fit: BoxFit.fitWidth,
            ),
            8.hGap,
            Text(
              controller.getCurrentGirl().eName,
              style: 16.w4(fontFamily: FontFamily.fRobotoMedium, height: 0.8),
            )
          ],
        ),
        6.5.vGap,
        Text(
          "online",
          style: 12.w4(fontFamily: FontFamily.fRobotoRegular, height: 0.8),
        )
      ],
    );
  }
}
