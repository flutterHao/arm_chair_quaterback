/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-17 15:11:03
 * @LastEditTime: 2025-01-17 17:45:14
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/help_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/widgets/filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpDialog extends StatefulWidget {
  const HelpDialog({super.key, required this.helpId, required this.height});
  final int helpId;
  final double height;

  @override
  State<HelpDialog> createState() => _HelpDialogState();
}

class _HelpDialogState extends State<HelpDialog> {
  HelpEntity helpEntity = HelpEntity();

  @override
  void initState() {
    super.initState();
    CacheApi.getHelpConfig().then((value) {
      setState(() {
        if (value[widget.helpId] != null) {
          helpEntity = value[widget.helpId]!;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> list = helpEntity.helpDesc.split('<p>');
    return SimpleBottomDialog(
        height: widget.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            18.vGap,
            Container(
              margin: EdgeInsets.only(left: 16.w),
              child: Text(
                helpEntity.helpName,
                style: 19.w4(fontFamily: FontFamily.fOswaldMedium, height: 1),
              ),
            ),
            12.vGap,
            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.cD4D4D4,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    List<String> item = list[index].split('<T1>');

                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.w, horizontal: 18.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (item.isNotEmpty)
                            Text(
                              item[0],
                              style: 14.w4(
                                fontFamily: FontFamily.fOswaldMedium,
                              ),
                            ),
                          if (item.length > 1)
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10.w, left: 18.w, right: 18.w),
                              child: Text(
                                item[1],
                                style: 14.w4(
                                    fontFamily: FontFamily.fRobotoRegular,
                                    color: AppColors.c4D4D4D,
                                    height: 1.2),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      color: AppColors.cD4D4D4,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                    );
                  },
                  itemCount: list.length),
            )
          ],
        ));
  }
}
