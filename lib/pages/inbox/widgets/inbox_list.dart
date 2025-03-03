/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-04 11:25:34
 * @LastEditTime: 2025-01-04 18:42:10
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/inbox/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class InboxList extends GetView<InboxController> {
  const InboxList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InboxController>(
        id: "inboxList",
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 24.w, left: 16.w, bottom: 15.5),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.cD4D4D4),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    print(controller.doNotDisturb);
                  },
                  child: Text(
                    "MESSAGE",
                    style: 30.w4(
                      fontFamily: FontFamily.fOswaldBold,
                      height: 0.9,
                    ),
                  ),
                ),
              ),
              _connentivityWidget(),
              Expanded(
                child: ListView.separated(
                    controller: controller.scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      bool lastIndex = index == controller.messageList.length - 1;
                      return Container(
                          margin: EdgeInsets.only(bottom: lastIndex ? 80.w : 0), child: _buildItem(index, context));
                    },
                    separatorBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: 0.5.w,
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          color: AppColors.cD4D4D4,
                        ),
                    itemCount: controller.messageList.length),
              ),
            ],
          );
        });
  }

  Widget _buildItem(index, context) {
    var item = controller.messageList[index];
    Random random = Random();
    var duration = Duration(minutes: random.nextInt(100));
    // item.time = DateTime.now().subtract(duration);
    int type = (item.id / 1000).round();
    String icon = Utils.getMessageIcon(item.userIcon);
    String subIcon = Utils.getMessageIcon(item.userSmallIcon);
    String title = item.userName;
    String content = item.userText;
    String time = Utils.timeAgo(item.time.millisecondsSinceEpoch);
    // int noReadNum = 2;

    if (content.contains("|")) {
      item.messageList = content.split("|");
      // noReadNum = content.split("|").length;
      content = content.split("|").first;
    } else {
      item.messageList = [content];
    }
    return InkWell(
      onTap: () async {
        if (item.id == 1005 || item.id == 4001 || item.id == 5001) {
          item.isRead = true;
          controller.update(["inboxList"]);
          return Get.toNamed(RouteNames.inboxEmail, arguments: item);
        }
        item.isRead = true;
        Get.toNamed(RouteNames.inboxDetail, arguments: item);
        controller.update(["inboxList"]);
      },
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 120 / 375,
          motion: const ScrollMotion(),
          children: [
            IconSlidableAction(
              backgroundColor: AppColors.cEFB400,
              onPressed: (BuildContext context) {
                controller.itemDoNotDisturb(item);
                // item.isRead = true;
                controller.update(["inboxList"]);
              },
              icon: Assets.inboxUiInboxIconBlacklist,
              iconWidth: 20.w,
            ),
            // IconSlidableAction(
            //   backgroundColor: AppColors.c000000,
            //   onPressed: (BuildContext context) {},
            //   icon: Assets.inboxUiInboxIconInform,
            //   iconWidth: 20.w,
            // ),
            IconSlidableAction(
              backgroundColor: AppColors.cD60D20,
              onPressed: (BuildContext context) {
                controller.messageList.remove(item);
                controller.update(["inboxList"]);
              },
              icon: Assets.iconUiIconDelete02,
              iconWidth: 20.w,
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          height: 99.w,
          padding: EdgeInsets.only(left: 22.5, right: 16.w),
          child: Row(
            children: [
              Stack(
                children: [
                  if (type == 1 || type == 2 || type == 6 || type == 7)
                    Container(
                      width: 48.w,
                      height: 48.w,
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.w),
                        border: Border.all(color: AppColors.cE1E1E1),
                      ),
                      child: ImageWidget(width: 30.w, url: icon),
                    ),
                  if (type == 3 || type == 4 || type == 5 || type == 8)
                    ImageWidget(
                      url: icon,
                      width: 48.w,
                      height: 48.w,
                      borderRadius: BorderRadius.circular(24.w),
                    ),
                  // if (type == 8)
                  //   Container(
                  //     width: 48.w,
                  //     height: 48.w,
                  //     clipBehavior: Clip.antiAlias,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(24.w),
                  //         color: AppColors.cFFE8E8),
                  //     child: Image.asset(
                  //       Assets.teamUiBelle02,
                  //       width: 48.w,
                  //       height: 48.w,
                  //       fit: BoxFit.fitWidth,
                  //       alignment: Alignment.topCenter,
                  //     ),
                  //   ),
                  if (item.userSmallIcon.isNotEmpty && item.userSmallIcon != "0")
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          width: 18.w,
                          height: 18.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.c000000,
                            borderRadius: BorderRadius.circular(9.w),
                          ),
                          child: ImageWidget(
                            width: 11.5.w,
                            height: 10.5.w,
                            url: subIcon,
                          )),
                    ),
                ],
              ),
              18.hGap,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: 16.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.9),
                          ),
                        ),
                        Text(
                          time,
                          style: 14.w4(fontFamily: FontFamily.fRobotoRegular, height: 0.9, color: AppColors.cB3B3B3),
                        ),
                      ],
                    ),
                    8.5.vGap,
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          content,
                          style: 14.w4(fontFamily: FontFamily.fRobotoRegular),
                        )),
                        12.5.vGap,
                        controller.doNotDisturb.contains(item.id)
                            ? IconWidget(
                                icon: Assets.inboxUiInboxIconInform, iconWidth: 16.w, iconColor: AppColors.cB3B3B3)
                            : Visibility(
                                visible: !item.isRead && item.noReadNum > 0,
                                child: Container(
                                  constraints: BoxConstraints(minWidth: 15.w),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 2.5.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.cFF7954,
                                    borderRadius: BorderRadius.circular(7.5.w),
                                  ),
                                  child: Text(item.noReadNum.toString(),
                                      style: 12.w4(
                                          fontFamily: FontFamily.fOswaldMedium, height: 0.9, color: AppColors.cFFFFFF)),
                                ),
                              )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _connentivityWidget() {
    return Obx(() => Visibility(
        visible: !controller.connectivityStatus.value,
        child: Container(
          color: AppColors.cfFFE2E5,
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
          child: Row(
            children: [
              Container(
                height: 24.w,
                width: 24.w,
                margin: EdgeInsets.only(left: 16.w, right: 30.w),
                decoration: BoxDecoration(
                  color: AppColors.cD60D20,
                  shape: BoxShape.circle,
                ),
                child: IconWidget(icon: Assets.inboxUiInboxIconTips, iconWidth: 3.w),
              ),
              Flexible(
                  child: Text(
                'The network is interrupted, Please check the network configuration.',
                style: 14.w4(fontFamily: FontFamily.fRobotoRegular, height: 1.2),
              )),
              50.hGap,
              IconWidget(
                icon: Assets.commonUiCommonIconSystemJumpto,
                iconWidth: 7.w,
                iconColor: Colors.black,
              )
            ],
          ),
        )));
  }
}

class IconSlidableAction extends StatelessWidget {
  const IconSlidableAction({
    super.key,
    required this.backgroundColor,
    this.onPressed,
    required this.icon,
    this.iconWidth = 25.0,
  });

  final Color backgroundColor;
  final SlidableActionCallback? onPressed;
  final String icon;
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox.expand(
        child: InkWell(
          onTap: () => _handleTap(context),
          child: Container(
            color: backgroundColor,
            child: IconWidget(iconWidth: iconWidth.w, icon: icon),
          ),
        ),
      ),
    );
  }

  void _handleTap(BuildContext context) {
    onPressed?.call(context);
    Slidable.of(context)?.close();
  }
}
