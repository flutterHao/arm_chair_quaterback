import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.only(bottom: 9.w),
        child: Column(
          children: [
            _Stats(),
            9.vGap,
            _Schedule(),
            9.vGap,
            _Recent(),
          ],
        ),
      ),
    );
  }
}

class _Stats extends StatelessWidget {
  const _Stats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.symmetric(vertical: 20.w),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.vGap,
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              "24-25 stats",
              style: 24.w4(fontFamily: FontFamily.fOswaldBold, height: 0.9),
            ),
          ),
          15.5.vGap,
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.cE6E6E,
          ),
          Container(
            // color: Colors.red,
            padding: EdgeInsets.symmetric(vertical: 24.w),
            height: 103.w,
            child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      width: 93.w,
                      child: Column(children: [
                        Text(
                          "24.1",
                          textAlign: TextAlign.center,
                          style: 21.w4(
                            fontFamily: FontFamily.fOswaldBold,
                            height: 0.9,
                          ),
                        ),
                        5.5.vGap,
                        Text(
                          "PPG",
                          style: 10.w4(
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 0.9,
                              color: AppColors.c666666),
                        ),
                        const Expanded(child: SizedBox.shrink()),
                        Text(
                          "6th",
                          style: 12.w4(
                            color: AppColors.cFF7954,
                            height: 0.9,
                          ),
                        )
                      ]));
                },
                separatorBuilder: (context, index) => Container(
                      width: 1,
                      height: 53.5.w,
                      color: AppColors.cE6E6E,
                    ),
                itemCount: 4),
          )
        ],
      ),
    );
  }
}

class _Schedule extends StatelessWidget {
  const _Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.vGap,
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              "SCHEDULE",
              style: 24.w4(
                fontFamily: FontFamily.fOswaldBold,
                height: 0.9,
              ),
            ),
          ),
          16.vGap,
          SizedBox(
            height: 123.5.w,
            // child: PageView.builder(
            //     physics: const BouncingScrollPhysics(),
            //     padEnds: false,
            //     itemCount: 4,
            //     controller: PageController(
            //       initialPage: 0,
            //       viewportFraction: 123.5 / 193.5,
            //     ),
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: EdgeInsets.only(left: 9.w),
            //         child: Container(
            //           width: 193.5.w,
            //           height: 123.5.w,
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(12.r),
            //             border: Border.all(color: AppColors.cB3B3B3),
            //           ),
            //         ),
            //       );
            //     }),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemBuilder: (context, index) => Container(
                      width: 193.5.w,
                      height: 123.5.w,
                      padding:
                          EdgeInsets.only(left: 14.w, right: 14.w, top: 14.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.cB3B3B3),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "11/9  8:00 AM",
                                style: 12.w4(
                                    color: AppColors.c000000,
                                    fontFamily: FontFamily.fRobotoRegular,
                                    height: 0.9),
                              ),
                              12.5.hGap,
                              Text(
                                "Final",
                                style: 12.w4(
                                    color: AppColors.c000000,
                                    fontFamily: FontFamily.fRobotoRegular,
                                    height: 0.9),
                              ),
                              const Expanded(child: SizedBox.shrink()),
                              IconWidget(
                                iconWidth: 10.w,
                                iconColor: AppColors.c000000,
                                icon: Assets.iconUiIconArrows04,
                                rotateAngle: -90,
                              ),
                              9.hGap,
                            ],
                          ),
                          9.5.vGap,
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: AppColors.cE6E6E,
                          ),
                          5.5.vGap,
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 2,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    ImageWidget(
                                      url: Utils.getTeamUrl(101),
                                      width: 38.5.w,
                                      height: 38.5.w,
                                    ),
                                    Text(
                                      "SDF",
                                      style: 12.w4(
                                          fontFamily: FontFamily.fOswaldMedium),
                                    ),
                                    78.hGap,
                                    Text(
                                      "SDF",
                                      style: 16.w4(
                                          fontFamily: FontFamily.fOswaldMedium),
                                    ),
                                  ],
                                );
                              })
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => 9.hGap,
                itemCount: 4),
          ),
          25.vGap,
        ],
      ),
    );
  }
}

class _Recent extends StatelessWidget {
  const _Recent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w), color: AppColors.cFFFFFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          25.vGap,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "RECENT",
              style: 30.w7(
                  color: AppColors.c262626,
                  height: 1,
                  fontFamily: FontFamily.fOswaldBold),
            ),
          ),
          25.vGap,
          GetBuilder<TeamDetailController>(builder: (controller) {
            return Column(
              children: [
                SizedBox(
                  height: 28.w,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        itemCount: controller.types.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var type = controller.types[index];
                          return Obx(() {
                            bool isSelected =
                                controller.currentIndex.value == index;
                            return InkWell(
                              onTap: () => controller.onTabTap(index),
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: 4.w, left: index == 0 ? 16.w : 0),
                                height: 28.w,
                                padding: EdgeInsets.symmetric(horizontal: 21.w),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.c666666, width: 1.w),
                                    color: isSelected
                                        ? AppColors.c262626
                                        : AppColors.cFFFFFF,
                                    borderRadius: BorderRadius.circular(14.w)),
                                child: Text(
                                  type.replaceAll(",", "+"),
                                  style: 13.w5(
                                      color: isSelected
                                          ? AppColors.cF2F2F2
                                          : AppColors.c262626,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                              ),
                            );
                          });
                        }),
                  ),
                ),
                16.vGap,
                Divider(
                  color: AppColors.cE6E6E,
                  height: 1.w,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 94.w,
                        padding: EdgeInsets.only(left: 14.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Season Avg",
                              style: 12.w4(
                                  color: AppColors.c666666,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoRegular),
                            ),
                            15.vGap,
                            Text(
                              "30.0",
                              style: 27.w7(
                                  color: AppColors.c262626,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldBold),
                            )
                          ],
                        ),
                      )),
                      Container(
                        width: 1.w,
                        color: AppColors.cE6E6E,
                        height: 67.w,
                      ),
                      Expanded(
                          child: Container(
                        height: 94.w,
                        padding: EdgeInsets.only(left: 14.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Last 5 Avg",
                              style: 14.w4(
                                  color: AppColors.c666666,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoRegular),
                            ),
                            15.vGap,
                            Text(
                              "30.0",
                              style: 27.w7(
                                  color: AppColors.c262626,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldBold),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                // Builder(builder: (context) {
                //   if (controller.nbaPlayerBaseInfoEntity!
                //       .l5GameData.isEmpty) {
                //     return const SizedBox.shrink();
                //   }
                //   return Column(
                //     children: [
                //       9.vGap,
                //       Container(
                //         height: 162.w,
                //         margin: EdgeInsets.symmetric(
                //             horizontal: 16.w),
                //         padding: EdgeInsets.all(10.w),
                //         child: Stack(
                //           children: [
                //             _buildDefaultColumnChart(context),
                //           ],
                //         ),
                //       ),
                //     ],
                //   );
                // }),
              ],
            );
          }),
        ],
      ),
    );
  }
}


