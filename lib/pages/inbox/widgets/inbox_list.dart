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
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/inbox/controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
              Expanded(child: Builder(builder: (_) {
                if (controller.messageList.isEmpty &&
                    controller.chatRoomList.isEmpty) {
                  return SmartRefresher(
                    controller: controller.refreshControllerDefault,
                    enablePullDown: true,
                    onRefresh: () async {
                      print('refreshControllerDefault----onRefresh');
                      await controller.getMessageList(refresh: true);
                      controller.refreshControllerDefault.refreshCompleted();
                    },
                    child: Obx(() {
                      return Center(
                          child: LoadStatusWidget(
                              loadDataStatus: controller.loadStatus.value));
                    }),
                  );
                }
                return Obx(() {
                  return SmartRefresher(
                    controller: controller.refreshController,
                    enablePullUp: true,
                    enablePullDown: true,
                    onRefresh: () async {
                      await controller.getMessageList(refresh: true);
                      controller.refreshController.refreshCompleted();
                    },
                    footer: ClassicFooter(
                      noDataText: "",
                    ),
                    onLoading: () => controller.getChatRoomList(),
                    child: CustomScrollView(
                      controller: controller.scrollController,
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        /// 邮件
                        SliverList.separated(
                          itemCount: controller.messageList.length,
                          itemBuilder: (context, index) {
                            return _buildItem(index, context);
                          },
                          separatorBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 0.5.w,
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            color: AppColors.cD4D4D4,
                          ),
                        ),

                        /// 聊天记录
                        SliverList.separated(
                          itemCount: controller.chatRoomList.length,
                          itemBuilder: (context, index) {
                            return _buildChatItem(index, context);
                          },
                          separatorBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 0.5.w,
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            color: AppColors.cD4D4D4,
                          ),
                        ),
                        SliverPadding(padding: EdgeInsets.only(bottom: 80.w))
                      ],
                    ),
                  );
                });
              })),
            ],
          );
        });
  }

  Widget _buildChatItem(index, context) {
    var item = controller.chatRoomList[index];
    int type = item.type;
    var id = type == 1 ? int.parse(item.categoryId) : -1;
    String icon = type == 1
        ? Utils.getPlayUrl(id)
        : Assets.managerUiManagerIconCurrency04;
    String title = type == 1 ? Utils.getPlayBaseInfo(id).elname : "OVR RANK";
    String content = item.lastMessage;
    String time = Utils.timeAgo(item.lastMessageSendTime);

    return InkWell(
      onTap: () async {
        if (!Utils.canOperate()) return;
        var arguments = {
          "type": type == 3 ? 2 : 1,
        };
        if (type == 1) {
          arguments['playerId'] = id;
        }
        controller.onChatTap(item, arguments);
      },
      child: Slidable(
        dragStartBehavior: DragStartBehavior.start,
        endActionPane: ActionPane(
          extentRatio: 120 / 375,
          motion: const ScrollMotion(),
          children: [
            Expanded(
              child: Builder(builder: (context) {
                return InkWell(
                  onTap: () {
                    if (Utils.canOperate()) {
                      controller.setPinned(item.id, !item.pinnedStatus);
                      Slidable.of(context)?.close();
                    }
                  },
                  child: Container(
                    color: AppColors.cEFB400,
                    child: IconWidget(
                      iconWidth: 25.w,
                      icon: Assets.managerUiManagerTacticsArrow,
                      rotateAngle: item.pinnedStatus ? 180 : 0,
                    ),
                  ),
                );
              }),
            ),
            IconSlidableAction(
              backgroundColor: AppColors.cD60D20,
              onPressed: (BuildContext context) {
                if (Utils.canOperate()) {
                  controller.delChatRoom(item.id);
                }
              },
              icon: Assets.iconUiIconDelete02,
              iconWidth: 20.w,
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          color: item.pinnedStatus ? AppColors.cF2F2F2 : AppColors.cTransparent,
          padding:
              EdgeInsets.only(left: 22.5, right: 16.w, top: 10.w, bottom: 10.w),
          child: Row(
            children: [
              Stack(
                children: [
                  if (type == 3)
                    Container(
                      width: 48.w,
                      height: 48.w,
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.w),
                        border: Border.all(color: AppColors.cE1E1E1),
                      ),
                      child: IconWidget(iconWidth: 30.w, icon: icon),
                    )
                  else
                    ImageWidget(
                      url: icon,
                      width: 48.w,
                      height: 48.w,
                      borderRadius: BorderRadius.circular(24.w),
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
                            style: 16.w4(
                                fontFamily: FontFamily.fOswaldMedium,
                                height: 0.9),
                          ),
                        ),
                        Text(
                          time,
                          style: 14.w4(
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 0.9,
                              color: AppColors.cB3B3B3),
                        ),
                      ],
                    ),
                    8.5.vGap,
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          content,
                          maxLines: 2,
                          style: 14.w4(
                              fontFamily: FontFamily.fRobotoRegular,
                              overflow: TextOverflow.ellipsis),
                        )),
                        12.5.hGap,
                        Visibility(
                          // visible: !item.isRead && item.noReadNum > 0,
                          visible: item.unreadMessageCount > 0,
                          child: Container(
                            constraints: BoxConstraints(minWidth: 15.w),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.5.w, vertical: 2.5.w),
                            decoration: BoxDecoration(
                              color: AppColors.cFF7954,
                              borderRadius: BorderRadius.circular(7.5.w),
                            ),
                            child: Text(item.unreadMessageCount.toString(),
                                style: 12.w4(
                                    fontFamily: FontFamily.fOswaldMedium,
                                    height: 0.9,
                                    color: AppColors.cFFFFFF)),
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
        dragStartBehavior: DragStartBehavior.start,
        endActionPane: ActionPane(
          extentRatio: 120 / 375,
          motion: const ScrollMotion(),
          children: [
            IconSlidableAction(
              backgroundColor: AppColors.cEFB400,
              onPressed: (BuildContext context) {
                controller.itemDoNotDisturb(item);
                item.isRead = true;
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
                controller.deteleMail(item);
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
                  if (item.userSmallIcon.isNotEmpty &&
                      item.userSmallIcon != "0")
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
                            style: 16.w4(
                                fontFamily: FontFamily.fOswaldMedium,
                                height: 0.9),
                          ),
                        ),
                        Text(
                          time,
                          style: 14.w4(
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 0.9,
                              color: AppColors.cB3B3B3),
                        ),
                      ],
                    ),
                    8.5.vGap,
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          content,
                          maxLines: 2,
                          style: 14.w4(
                              fontFamily: FontFamily.fRobotoRegular,
                              overflow: TextOverflow.ellipsis),
                        )),
                        12.5.hGap,
                        controller.doNotDisturb.contains(item.id)
                            ? IconWidget(
                                icon: Assets.inboxUiInboxIconInform,
                                iconWidth: 16.w,
                                iconColor: AppColors.cB3B3B3)
                            : Visibility(
                                // visible: !item.isRead && item.noReadNum > 0,
                                visible: item.noReadNum > 0,
                                child: Container(
                                  constraints: BoxConstraints(minWidth: 15.w),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.5.w, vertical: 2.5.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.cFF7954,
                                    borderRadius: BorderRadius.circular(7.5.w),
                                  ),
                                  child: Text(item.noReadNum.toString(),
                                      style: 12.w4(
                                          fontFamily: FontFamily.fOswaldMedium,
                                          height: 0.9,
                                          color: AppColors.cFFFFFF)),
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
          color: AppColors.cFFE2E5,
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
                child: IconWidget(
                    icon: Assets.inboxUiInboxIconTips, iconWidth: 3.w),
              ),
              Flexible(
                  child: Text(
                'The network is interrupted, Please check the network configuration.',
                style:
                    14.w4(fontFamily: FontFamily.fRobotoRegular, height: 1.2),
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
