import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/send_guess_comment_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/message/controller.dart';
import 'package:common_utils/common_utils.dart';
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
                        _buildMessageList(context),

                        /// 输入框
                        _buildInput(context, isDarkMode)
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

  Widget _buildInput(BuildContext context, bool isDarkMode) {
    return Column(
      children: [
        /// 回复消息
        Obx(() {
          var chatMessageEntity = controller.replyChatMessage.value;
          if (chatMessageEntity == null) {
            return SizedBox.shrink();
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.w),
            decoration: BoxDecoration(
                color: MediaQuery.of(context).viewInsets.bottom <= 0
                    ? AppColors.cFFFFFF
                    : isDarkMode
                        ? AppColors.c262626
                        : AppColors.cFFFFFF,
                border: Border(
                    bottom: BorderSide(
                  color: AppColors.cE6E6E6.withOpacity(0.7),
                  width: 1.w,
                ))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      border: Border(
                    left: BorderSide(
                      color: AppColors.c000000.withOpacity(0.2),
                      width: 3.w,
                    ),
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${chatMessageEntity.teamName}:",
                          style: 10.w4(
                            color: AppColors.c000000.withOpacity(0.5),
                            fontFamily: FontFamily.fRobotoRegular,
                            height: 1,
                          )),
                      5.vGap,
                      Text(chatMessageEntity.context,
                          style: 13.w4(
                            color: AppColors.c000000.withOpacity(0.5),
                            fontFamily: FontFamily.fRobotoRegular,
                            height: 1,
                          ))
                    ],
                  ),
                )),
                MtInkWell(
                  onTap: () => controller.onDeleteReply(),
                  child: Container(
                      width: 16.w,
                      height: 16.w,
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w),
                          border:
                              Border.all(color: AppColors.c000000, width: 1.w)),
                      child: IconWidget(
                        icon: Assets.iconIconClose,
                        iconColor: AppColors.c000000,
                      )),
                ),
              ],
            ),
          );
        }),
        Container(
          color: MediaQuery.of(context).viewInsets.bottom <= 0
              ? AppColors.cFFFFFF
              : isDarkMode
                  ? AppColors.c262626
                  : AppColors.cFFFFFF,
          padding: EdgeInsets.only(
              top: 9.w,
              bottom: Utils.getPaddingBottom() + 9.w,
              right: 16.w,
              left: 16.w),
          child: Container(
            decoration: BoxDecoration(
              color: MediaQuery.of(context).viewInsets.bottom <= 0
                  ? AppColors.cF2F2F2
                  : isDarkMode
                      ? AppColors.c4D4D4D
                      : AppColors.cF2F2F2,
              borderRadius: BorderRadius.circular(4.w),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.textEditingController,
                    minLines: 1,
                    maxLines: 100,
                    textInputAction: TextInputAction.send,
                    // keyboardAppearance:Brightness.light,
                    cursorColor: MediaQuery.of(context).viewInsets.bottom <= 0
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
                        color: MediaQuery.of(context).viewInsets.bottom <= 0
                            ? AppColors.c262626
                            : isDarkMode
                                ? AppColors.cF2F2F2
                                : AppColors.c262626),
                    onChanged: (v) {
                      print('onChanged');
                      controller.hasText.value = ObjectUtil.isNotEmpty(v);
                    },
                    onSubmitted: (str) => controller.send(str),
                  ),
                ),
                if (GetPlatform.isAndroid)
                  Obx(() {
                    return AnimatedOpacity(
                      opacity: controller.hasText.value ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: IconButton(
                        icon: Container(
                          width: 30.w,
                          height: 30.w,
                          decoration: BoxDecoration(
                              color:
                                  MediaQuery.of(context).viewInsets.bottom <= 0
                                      ? AppColors.c262626
                                      : isDarkMode
                                          ? AppColors.cF2F2F2
                                          : AppColors.c262626,
                              borderRadius: BorderRadius.circular(15.w)),
                          child: Transform.rotate(
                            angle: 90 * (pi / 180),
                            child: IconWidget(
                              iconWidth: 15.w,
                              icon: Assets.iconIconBack,
                              iconColor:
                                  MediaQuery.of(context).viewInsets.bottom <= 0
                                      ? AppColors.cF2F2F2
                                      : !isDarkMode
                                          ? AppColors.cF2F2F2
                                          : AppColors.c262626,
                              // iconColor: AppColors.c262626,
                            ),
                          ),
                        ),
                        onPressed: () {
                          controller
                              .send(controller.textEditingController.text);
                        },
                      ),
                    );
                  }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Expanded _buildMessageList(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => controller.focusNode.unfocus(),
        child: MediaQuery.removePadding(
          removeBottom: true,
          removeTop: true,
          context: context,
          child: Obx(() {
            return ListView.separated(
              itemCount: controller.list.length,
              controller: controller.scrollController,
              reverse: true,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemBuilder: (context, index) {
                bool isFirst = index == 0;
                bool isLast = index == controller.list.length - 1;
                ChatMessageEntity item = controller.list[index];
                return Container(
                  padding: EdgeInsets.only(
                      bottom: isFirst ? 9.w : 0, top: isLast ? 9.w : 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.hGap,
                      InkWell(
                        onLongPress: () => controller.avatarLongPress(item),
                        child: Container(
                          width: 36.w,
                          height: 36.h,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.w)),
                          child: ImageWidget(
                            url: Utils.getAvatarUrl(item.teamLogo),
                            imageFailedPath: Assets.teamUiHead03,
                          ),
                        ),
                      ),
                      6.hGap,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onLongPress: () =>
                                  controller.avatarLongPress(item),
                              child: Text(
                                Utils.isMe(item.teamId) ? "me" : item.teamName,
                                style: 12.w4(
                                  color: AppColors.c000000.withOpacity(0.5),
                                ),
                              ),
                            ),
                            3.vGap,
                            _buildMessage(item, index),
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
            );
          }),
        ),
      ),
    );
  }

  Row _buildMessage(ChatMessageEntity item, int index) {
    return Row(
      children: [
        Flexible(
          child: IntrinsicWidth(
            child: InkWell(
              onLongPress: () => controller.onMessageLongPress(item),
              child: Container(
                constraints: BoxConstraints(minHeight: 40.w, minWidth: 40.w),
                padding: EdgeInsets.symmetric(vertical: 9.w, horizontal: 10.w),
                decoration: BoxDecoration(
                    color: Utils.isMe(item.teamId)
                        ? AppColors.c47AFFF.withOpacity(0.3)
                        : AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(9.w)),
                alignment: Alignment.centerLeft,
                child: Builder(builder: (context) {
                  StringBuffer buffer = StringBuffer();
                  bool first = true;

                  buffer = item.atTeamSimple.fold(buffer, (p, e) {
                    var pattern = '${RegExp("@${e.teamName}").pattern}\\b';
                    if (!first) {
                      buffer.write('|');
                    }
                    p.write('($pattern)');
                    first = false;
                    return p;
                  });
                  var regExp = RegExp(buffer.toString());
                  List<TextSpan> spans = [];
                  int start = 0;
                  var text = item.context;
                  var matches = regExp.allMatches(text);
                  for (final match in matches) {
                    // 将匹配前的文本加入
                    if (match.start > start) {
                      spans.add(
                          TextSpan(text: text.substring(start, match.start)));
                    }
                    // 将匹配的文本加入，设置蓝色字体
                    spans.add(
                      TextSpan(
                        text: match.group(0),
                        style: const TextStyle(color: Colors.blue),
                      ),
                    );
                    start = match.end;
                  }
                  // 将最后剩余的文本加入
                  if (start < text.length) {
                    spans.add(TextSpan(text: text.substring(start)));
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.replyMessage != null) ...[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                              border: Border(
                            left: BorderSide(
                              color: AppColors.c000000.withOpacity(0.2),
                              width: 3.w,
                            ),
                          )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("${item.replyMessage!.teamName}:",
                                  style: 10.w4(
                                    color: AppColors.c000000.withOpacity(0.5),
                                    fontFamily: FontFamily.fRobotoRegular,
                                    height: 1,
                                  )),
                              5.vGap,
                              Text(item.replyMessage!.context,
                                  style: 12.w4(
                                    color: AppColors.c000000.withOpacity(0.5),
                                    fontFamily: FontFamily.fRobotoRegular,
                                    height: 1,
                                  ))
                            ],
                          ),
                        ),
                        5.vGap
                      ],
                      RichText(
                        text: TextSpan(
                          style: 14.w4(
                            color: AppColors.c000000,
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                          children: spans,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
