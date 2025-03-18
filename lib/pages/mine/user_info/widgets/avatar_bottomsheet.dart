import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/vertival_drag_back_widget.dart';

class AvatarBottomsheet extends StatefulWidget {
  const AvatarBottomsheet({super.key});

  @override
  State<AvatarBottomsheet> createState() => _AvatarBottomsheetState();
}

class _AvatarBottomsheetState extends State<AvatarBottomsheet> {
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
          10.vGap,
          Expanded(
              child: SizedBox(
                  // color: Colors.pink.withOpacity(.2),
                  // padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: GridView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.w,
                        crossAxisSpacing: 14.w,
                      ),
                      itemCount: 11,
                      itemBuilder: (context, index) {
                        return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.cFAFAFA,
                                borderRadius: BorderRadius.circular(9.w)),
                            child: ClipOval(
                              child: ImageWidget(
                                url: Utils.getAvatarUrl(index + 1),
                                width: 70.w,
                                height: 70.w,
                              ),
                            ));
                      }))),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: MtInkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.w)),
                  height: 50.w,
                  alignment: Alignment.center,
                  child: Text(
                    'confirm'.toUpperCase(),
                    style: 23.w5(
                        color: Colors.white,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                )),
          ),
          30.vGap,
        ],
      ),
    ));
  }
}
