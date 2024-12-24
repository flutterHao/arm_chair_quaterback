import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/my_team_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LineUpTab extends StatefulWidget {
  const LineUpTab({super.key});

  @override
  State<LineUpTab> createState() => _LineUpTabState();
}

class _LineUpTabState extends State<LineUpTab>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<TeamController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<TeamController>(builder: (_) {
      // var sublist = controller.myTeamEntity.teamPlayers
      //     .where((e) => e.position == 0)
      //     .toList();
      return Container(
        color: AppColors.cF2F2F2,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 9.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.w),
                ),
                child: Column(
                  children: [
                    20.vGap,
                    Container(
                      margin: EdgeInsets.only(left: 29.5.w),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Main",
                        style: 24.w4(
                            color: AppColors.c262626,
                            height: 1,
                            fontFamily: FontFamily.fOswaldBold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.w),
                      width: double.infinity,
                      height: 1.w,
                      color: AppColors.cD1D1D1,
                    ),
                    MainPlayerList(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 9.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.w),
                ),
                child: Column(
                  children: [
                    20.vGap,
                    Container(
                      margin: EdgeInsets.only(left: 29.5.w),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Substitute",
                              style: 24.w4(
                                  color: AppColors.c262626,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldBold),
                            ),
                          ),
                          Text(
                            "${controller.subList.length}/${controller.myTeamEntity.benchCount}",
                            style: 12.w4(
                              fontFamily: FontFamily.fOswaldRegular,
                            ),
                          ),
                          16.hGap,
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.w),
                      width: double.infinity,
                      height: 1.w,
                      color: AppColors.cD1D1D1,
                    ),
                    SubPlayerList(),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
