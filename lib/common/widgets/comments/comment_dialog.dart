import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 使用 MediaQuery 来获取键盘的高度
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // 键盘高度
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 354.w,
                  alignment: Alignment.center,
                  constraints: BoxConstraints(maxHeight: 42.w),
                  decoration: BoxDecoration(
                      color: AppColors.cE6E6E6,
                      borderRadius: BorderRadius.circular(21.w)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          cursorHeight: 15.w,
                          cursorColor: AppColors.c333333,
                          scrollPadding: const EdgeInsets.all(0),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8.w),
                            hintText: '写下你的评论...',
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          // 发送评论的逻辑
                        },
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

void showCommentBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // 设置为 true，允许内容随着键盘升起而调整
    backgroundColor: Colors.transparent,
    builder: (context) {
      return CommentInputWidget();
    },
  );
}
