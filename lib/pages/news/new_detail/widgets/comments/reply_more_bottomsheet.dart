import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/services/storage.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/values/storage.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/emoji_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReplyMoreBottomsheet extends StatelessWidget {
  const ReplyMoreBottomsheet(
      {super.key,
      required this.sendEmoji,
      this.onReply,
      this.onQuote,
      required this.text});
  final String text;
  final Function(String) sendEmoji;
  final Function? onReply; //回复
  final Function? onQuote; ////引用

  _textButtom(String icon, String text, Function() onTap,
      {Color color = Colors.black}) {
    return InkWell(
      onTap: () {
        Get.back();
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 60.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 38.w,
              child: Image.asset(
                icon,
                width: 24.w,
                height: 24.w,
                color: color,
              ),
            ),
            // 15.hGap,
            Text(
              text,
              style: 16.w4(
                fontFamily: FontFamily.fOswaldRegular,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _textButtom2(String icon, String text, Function() onTap) {
    return MtInkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 60.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Text(
              icon,
              style: 20.w4(
                  fontFamily: FontFamily.fOswaldRegular,
                  color: AppColors.c262626),
            ),
            15.hGap,
            Text(
              text,
              style: 16.w4(
                  fontFamily: FontFamily.fOswaldRegular,
                  color: AppColors.c262626),
            ),
          ],
        ),
      ),
    );
  }

  _line() {
    return Container(
      color: AppColors.cD1D1D1,
      height: 1,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> storageEmojy = StorageService.to.getList(STORAGE_USED_EMOJI);

    return VerticalDragBackWidget(
        child: Container(
      height: 384.w + Utils.getPaddingBottom(),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          const DialogTopBtn(),
          21.vGap,
          Container(
            height: 40.w,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: storageEmojy.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return 10.hGap;
                    },
                    itemBuilder: (context, index) {
                      var item = Constant.emojis.entries.firstWhere(
                          (element) => element.key == storageEmojy[index]);
                      return MtInkWell(
                          onTap: () {
                            Get.back();
                            sendEmoji(item.key);
                          },
                          child: Image.asset(
                            item.value,
                            width: 32.w,
                            fit: BoxFit.fitWidth,
                          ));
                    },
                  ),
                ),
                16.hGap,
                MtInkWell(
                  onTap: () {
                    Get.back();
                    showModalBottomSheet(
                        isScrollControlled: true,
                        // backgroundColor: Colors.transparent,
                        // context: Get.context!,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return EmojiBottomsheet(sendEmoji: (key) {
                            sendEmoji(key);
                          });
                        });
                  },
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        color: AppColors.cF2F2F2),
                    child: Image.asset(
                      Assets.newsUiIconEmoji,
                      width: 24.w,
                      color: AppColors.c000000,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.cD1D1D1,
            height: 1,
            width: double.infinity,
            margin: EdgeInsets.only(top: 15.w),
          ),
          if (onReply != null)
            _textButtom(
                Assets.communityUiCommunityIcon05, "Reply", () => onReply!()),
          if (onReply != null) _line(),
          _textButtom(Assets.communityUiCommunityIcon04, "Copy text", () async {
            await Clipboard.setData(ClipboardData(text: text));
            EasyLoading.showToast("Copy Success");
          }),
          _line(),
          if (onQuote != null) _textButtom2("@", "Tag", () => onQuote!()),
          if (onQuote != null) _line(),
          _textButtom(Assets.communityUiCommunityIcon03, "Report", () {},
              color: AppColors.cE34D4D),
        ],
      ),
    ));
  }
}
