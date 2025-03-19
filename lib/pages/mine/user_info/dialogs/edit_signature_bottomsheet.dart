import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/pages/mine/user_info/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/constant/font_family.dart';

class EditSignatureBottomsheet extends StatefulWidget {
  const EditSignatureBottomsheet({super.key});

  @override
  State<EditSignatureBottomsheet> createState() =>
      _EditSignatureBottomsheetState();
}

class _EditSignatureBottomsheetState extends State<EditSignatureBottomsheet> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return VerticalDragBackWidget(
        child: Container(
      height: 367.w + Utils.getPaddingBottom(),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(9.w), topRight: Radius.circular(9.w))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DialogTopBtn(),
          20.vGap,
          Stack(
            children: [
              Center(
                child: Text(
                  'Signature',
                  style:
                      16.w5(fontFamily: FontFamily.fOswaldRegular, height: 1),
                ),
              ),
              Positioned(
                top: 0,
                right: 16.w,
                child: MtInkWell(
                    onTap: () {
                      final UserInfoController controller = Get.find();
                      controller.editSignature.value =
                          textEditingController.text;
                      Get.back();
                    },
                    child: Text(
                      'Save',
                      style: 16.w5(
                          fontFamily: FontFamily.fOswaldRegular,
                          height: 1,
                          color: AppColors.cAEAEAE),
                    )),
              )
            ],
          ),
          12.vGap,
          Divider(color: AppColors.cE6E6E, height: 1),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TextField(
                  controller: textEditingController,
                  cursorColor: Colors.black,
                  maxLines: 9,
                  maxLength: 150,
                  style: 14.w5(fontFamily: FontFamily.fRobotoRegular),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Fill in your personal signature.',
                    hintStyle: 14.w5(
                        color: AppColors.c666666,
                        fontFamily: FontFamily.fRobotoRegular),
                  ))),
          30.vGap,
        ],
      ),
    ));
  }
}
