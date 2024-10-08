import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BattleAwardDialog extends StatelessWidget {
  const BattleAwardDialog({super.key});

  Widget _boxImage() {
    return Image.asset(
      Assets.uiTeamBox_01Png,
      width: 92.w,
      fit: BoxFit.fitWidth,
    );
  }

  Widget _getBoxWidget(int status) {
    switch (status) {
      case 1:
        return Container(
          width: 164.w,
          height: 110.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.cFF7954,
            borderRadius: BorderRadius.circular(16.w),
          ),
          child: Container(
            width: 135.w,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.uiBgOpenPng,
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: _boxImage(),
          ),
        );
      case 2:
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 164.w,
              height: 110.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.w),
                  color: AppColors.c000000),
            ),
            Positioned(
              bottom: 18.w,
              child: Column(
                children: [
                  _boxImage(),
                  Text(
                    "09:51",
                    style: 16.w7(color: AppColors.cFF7954),
                  ),
                  SizedBox(
                    width: 128.w,
                    height: 9.w,
                    child: LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: AppColors.c303030,
                      color: AppColors.cFF7954,
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                  )
                ],
              ),
            ),
            // CustomLinearProgressBar(width: 128.w, progress: 30,backgroundColor: ,)
          ],
        );
      case 3:
        return Container(
          width: 164.w,
          height: 110.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.c1A1A1A,
            borderRadius: BorderRadius.circular(16.w),
          ),
          child: IconWidget(
            iconWidth: 92.w,
            icon: Assets.uiTeamBox_05Png,
            iconColor: AppColors.c262626,
          ),
        );
    }

    return Container(
      width: 164.w,
      height: 110.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16.w),
          border: Border.all(
            width: 2,
            color: AppColors.c666666,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconWidget(
            iconWidth: 32.w,
            icon: Assets.uiIconLockPng,
            iconColor: AppColors.c666666,
          ),
          12.vGap,
          Text(
            "Unlock at Lv18",
            style: 14.w7(color: AppColors.c666666),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // width: 375.w,
          height: 353.w,
          decoration: BoxDecoration(
              color: AppColors.cFF7954,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.w),
                  topRight: Radius.circular(16.w))),
        ),
        Container(
          height: 350.w,
          margin: EdgeInsets.only(top: 3.w),
          decoration: BoxDecoration(
            color: AppColors.c262626,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.w),
                topRight: Radius.circular(16.w)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60.w,
                height: 4.w,
                margin: EdgeInsets.only(top: 9.w, bottom: 23.w),
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(2.w)),
              ),
              Container(
                width: 375.w,
                padding: EdgeInsets.only(left: 16.w),
                child: Text(
                  "Treasure chest of battle",
                  style: 19.w7(color: AppColors.cF3F3F3),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16.w),
                child: GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 列数
                    childAspectRatio: 164 / 110, // 宽高比
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.w,
                  ),
                  children: [
                    _getBoxWidget(1),
                    _getBoxWidget(2),
                    _getBoxWidget(3),
                    _getBoxWidget(4),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
