import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerBagTab extends StatelessWidget {
  const PlayerBagTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      // physics: const NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      itemBuilder: (context, index) {
        return PlayerItem(
          index: index,
          isMain: false,
          isBag: true,
        );
      },
      separatorBuilder: (context, index) => 9.vGap,
      itemCount: 20,
    );
    ;
  }
}
