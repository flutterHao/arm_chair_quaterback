import 'package:arm_chair_quaterback/common/entities/send_guess_comment_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/message/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage(
      {required this.type, this.playerId, this.gameId, super.key});

  ///type: 1 赛程和球员 2 赛季ovr排行榜
  final int type;
  final int? playerId;
  final int? gameId;

  @override
  String? get tag => getTag();

  String getTag() {
    return "${type}_${playerId}_${gameId}_tag";
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return HorizontalDragBackContainer(
      child: GetBuilder<MessageController>(
        tag: getTag(),
        init: MessageController(type: type, playerId: playerId, gameId: gameId),
        builder: (_) {
          return BlackAppWidget(
            backgroundColor: AppColors.ce5e5e5,
            UserInfoBar(
              showPop: true,
              title: controller.getTitle(),
            ),
            bodyWidget: Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        /// 消息列表
                        Expanded(
                          child: InkWell(
                            onTap: () => controller.focusNode.unfocus(),
                            child: Obx(() {
                              return SmartRefresher(
                                controller: controller.refreshController,
                                enablePullDown: false,
                                enablePullUp: true,
                                reverse: true,
                                footer: ClassicFooter(
                                    // idleText: "Pull down Load",
                                    // releaseText: "Release load more",
                                    // refreshingText: "Loading...",
                                    // completeText: "Load Completed",
                                    // failedText: "Load Failed",
                                    ),
                                onLoading: () => controller.loadMoreData(),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: MediaQuery.removePadding(
                                    removeBottom: true,
                                    removeTop: true,
                                    context: context,
                                    child: ListView.separated(
                                      itemCount: controller.list.length,
                                      controller: controller.scrollController,
                                      reverse: true,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        bool isFirst = index == 0;
                                        bool isLast =
                                            index == controller.list.length - 1;
                                        ChatMessageEntity item =
                                            controller.list[index];
                                        return Container(
                                          padding: EdgeInsets.only(
                                              bottom: isFirst ? 9.w : 0,
                                              top: isLast ? 9.w : 0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              10.hGap,
                                              InkWell(
                                                onLongPress: ()=> controller.avatarLongPress(item),
                                                child: Container(
                                                  width: 36.w,
                                                  height: 36.h,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.w)),
                                                  child: ImageWidget(
                                                    url: Utils.getAvatarUrl(
                                                        item.teamLogo),
                                                    imageFailedPath:
                                                        Assets.teamUiHead03,
                                                  ),
                                                ),
                                              ),
                                              6.hGap,
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                      onLongPress: ()=> controller.avatarLongPress(item),
                                                      child: Text(
                                                        Utils.isMe(item.teamId)
                                                            ? "me"
                                                            : item.teamName,
                                                        style: 12.w4(
                                                          color: AppColors
                                                              .c000000
                                                              .withOpacity(0.5),
                                                        ),
                                                      ),
                                                    ),
                                                    3.vGap,
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                          child: IntrinsicWidth(
                                                            child: Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                      minHeight: 40.w,
                                                                      minWidth: 40.w),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical: 5.w,
                                                                      horizontal:
                                                                          10.w),
                                                              decoration: BoxDecoration(
                                                                  color: Utils.isMe(
                                                                          item.teamId)
                                                                      ? AppColors
                                                                          .cFF7954
                                                                      : AppColors
                                                                          .cFFFFFF,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              9.w)),
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                item.context,
                                                                softWrap: true,
                                                                style: 14.w4(
                                                                    color: Utils.isMe(
                                                                            item
                                                                                .teamId)
                                                                        ? AppColors
                                                                            .cFFFFFF
                                                                        : AppColors
                                                                            .c000000),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              16.hGap,
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return 14.vGap;
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),

                        /// 输入框
                        Container(
                          color: MediaQuery.of(context).viewInsets.bottom <= 0
                              ? AppColors.cF2F2F2
                              : isDarkMode
                                  ? AppColors.c262626
                                  : AppColors.cF2F2F2,
                          padding: EdgeInsets.only(
                              top: 9.w,
                              bottom: Utils.getPaddingBottom() + 9.w,
                              right: 16.w,
                              left: 16.w),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  MediaQuery.of(context).viewInsets.bottom <= 0
                                      ? AppColors.cE6E6E6
                                      : isDarkMode
                                          ? AppColors.c4D4D4D
                                          : AppColors.cE6E6E6,
                              borderRadius: BorderRadius.circular(4.w),
                            ),
                            child: TextField(
                              controller: controller.textEditingController,
                              minLines: 1,
                              maxLines: 100,
                              textInputAction: TextInputAction.send,
                              // keyboardAppearance:Brightness.light,
                              cursorColor:
                                  MediaQuery.of(context).viewInsets.bottom <= 0
                                      ? AppColors.c262626
                                      : isDarkMode
                                          ? AppColors.cF2F2F2
                                          : AppColors.c262626,
                              scrollPadding: const EdgeInsets.all(0),
                              focusNode: controller.focusNode,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.w),
                                hintText: "Please input text ...",
                                hintStyle: 14.w4(color: AppColors.cB3B3B3),
                                border: InputBorder.none,
                              ),
                              style: 14.w4(
                                  color: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom <=
                                          0
                                      ? AppColors.c262626
                                      : isDarkMode
                                          ? AppColors.cF2F2F2
                                          : AppColors.c262626),
                              onChanged: (v) {
                                print('onChanged');
                              },
                              onSubmitted: (str) => controller.send(str),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
