import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constant/font_family.dart';

class EditSignatureBottomsheet extends StatefulWidget {
  const EditSignatureBottomsheet({super.key});

  @override
  State<EditSignatureBottomsheet> createState() =>
      _EditSignatureBottomsheetState();
}

class _EditSignatureBottomsheetState extends State<EditSignatureBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return VerticalDragBackWidget(
        child: Container(
      height: 367.w + Utils.getPaddingBottom(),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
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
          10.vGap,
          Divider(color: AppColors.cE6E6E, height: 1),
          16.vGap,
          30.vGap,
        ],
      ),
    ));
  }
}
