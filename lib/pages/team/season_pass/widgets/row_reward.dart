import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowRewardWidget extends StatelessWidget {
  const RowRewardWidget(this.rewardList, {super.key});
  final List<String> rewardList;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: rewardList
          .map((cupItem) {
            int propId = int.tryParse(cupItem.split('_')[1]) ?? 0;
            int propNum = int.tryParse(cupItem.split('_')[2]) ?? 1;
            return Column(
              children: [
                26.vGap,
                IconWidget(
                    iconWidth: 40.w,
                    iconHeight: 40.w,
                    fit: BoxFit.contain,
                    fieldPath: Assets.managerUiManagerGift00,
                    icon: Utils.getPropIconUrl(propId)),
                4.vGap,
                Text('${propId == 102 ? Utils.formatMoney(propNum) : propNum}',
                    style: 14
                        .w5(height: 1, fontFamily: FontFamily.fRobotoRegular)),
              ],
            );
          })
          .expand((Widget child) sync* {
            yield 20.hGap;
            yield child;
          })
          .skip(1)
          .toList(),
    );
  }
}
