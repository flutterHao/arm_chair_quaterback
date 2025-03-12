import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/services/services.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/values/storage.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmojiBottomsheet extends StatefulWidget {
  const EmojiBottomsheet({super.key, required this.sendEmoji});
  final void Function(String) sendEmoji;
  @override
  State<EmojiBottomsheet> createState() => _EmojiBottomsheetState();
}

class _EmojiBottomsheetState extends State<EmojiBottomsheet> {
  List<String> usedEmojiList = [];
  @override
  initState() {
    super.initState();
    List<String> storageEmojy = StorageService.to.getList(STORAGE_USED_EMOJI);
    setState(() {
      usedEmojiList = storageEmojy;
    });
  }

  void _sendEmoji(String key) {
    if (usedEmojiList.contains(key)) {
      usedEmojiList.remove(key);
      usedEmojiList.insert(0, key);
    } else {
      usedEmojiList.insert(0, key);
    }
    widget.sendEmoji(key);
    StorageService.to.setList(STORAGE_USED_EMOJI, usedEmojiList);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return VerticalDragBackWidget(
        child: Container(
      height: 384.h + Utils.getPaddingBottom(),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          const DialogTopBtn(),
          16.vGap,
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _usedEmojiWidget(),
                  Text(
                    'People',
                    style: 16.w5(fontFamily: FontFamily.fOswaldRegular),
                  ),
                  6.vGap,
                  GridView.builder(
                    padding: EdgeInsets.only(bottom: 20.w),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 37.w,
                        crossAxisSpacing: 6.w,
                        mainAxisSpacing: 6.w),
                    itemCount: Constant.emojis.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = Constant.emojis.entries.elementAt(index);
                      return MtInkWell(
                        onTap: () {
                          _sendEmoji(item.key);
                        },
                        child: Image.asset(item.value,
                            width: 30.w, height: 30.w, fit: BoxFit.fitWidth),
                      );
                    },
                  ),
                  SizedBox(height: Utils.getPaddingBottom())
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }

  Widget _usedEmojiWidget() {
    return Visibility(
        visible: usedEmojiList.isNotEmpty,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Used',
              style: 16.w5(fontFamily: FontFamily.fOswaldRegular),
            ),
            6.vGap,
            GridView.builder(
              padding: EdgeInsets.only(bottom: 12.w),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 37.w,
                  crossAxisSpacing: 6.w,
                  mainAxisSpacing: 6.w),
              itemCount: usedEmojiList.length > 16 ? 16 : usedEmojiList.length,
              itemBuilder: (BuildContext context, int index) {
                var item = Constant.emojis.entries.firstWhere(
                    (element) => element.key == usedEmojiList[index]);
                return MtInkWell(
                  onTap: () {
                    _sendEmoji(item.key);
                  },
                  child: Image.asset(item.value,
                      width: 30.w, height: 30.w, fit: BoxFit.fitWidth),
                );
              },
            ),
          ],
        ));
  }
}
