/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-13 21:12:10
 * @LastEditTime: 2025-02-21 18:43:42
 */
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MatchCard extends GetView<TeamIndexController> {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    TeamController myTeamCtrl = Get.find();
    // double width = MediaQuery.of(context).size.width;
    double aspectRatio = 375 / 404;
    return GetBuilder<TeamIndexController>(
        id: "season_info",
        builder: (controller) {
          return AspectRatio(
            aspectRatio: aspectRatio,
            child: Transform.scale(
              alignment: Alignment.topLeft,
              scale: Utils.getMaxWidth(context) / 375.w,
              child: Container(
                width: 375.w,
                height: 404.5.w,
                margin: EdgeInsets.only(top: 9.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.w),
                  color: AppColors.cFFFFFF,
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 22.5.w,
                      left: 16.5.w,
                      child: Text(
                        "GAME SEASON",
                        style: 30.w7(
                            fontFamily: FontFamily.fOswaldBold, height: 0.75),
                      ),
                    ),
                    Positioned(
                      top: 81.5.w,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () => Get.toNamed(RouteNames.seaonRankPage),
                        // child: Swiper(
                        //   itemCount: 1,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return
                        //   },
                        //   autoplay: false, // 启用自动播放
                        //   // autoplayDelay: 3000,
                        //   // autoplayDisableOnInteraction: true,
                        //   pagination: SwiperPagination(
                        //     alignment: Alignment.bottomCenter,
                        //     margin:
                        //         const EdgeInsets.only(bottom: 10), // 指示器的下边距
                        //     builder:
                        //         CustomPaginationBuilder(), // 使用自定义的长条形分页指示器
                        //   ),
                        // ),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 15.w,
                                left: 17.w,
                                // right: 17.w,
                                // bottom: 54.w,
                                child: Container(
                                  width: 341.w,
                                  height: 253.5.w,
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9.w),
                                      border: Border.all(
                                        width: 1.w,
                                        color: AppColors.cD9D9D9,
                                      )),
                                )),
                            Positioned(
                              top: 0,
                              left: 0,
                              // right: 36.w,
                              child: Image.asset(
                                Assets.managerUiManagerIconBg,
                                width: 339.w,
                                // height: 168.5.w,
                              ),
                            ),
                            Positioned(
                              top: 11.w,
                              left: 16.w,
                              child: Container(
                                width: 100.w,
                                height: 24.w,
                                decoration: BoxDecoration(
                                  color: AppColors.c000000,
                                  borderRadius: BorderRadius.circular(12.w),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconWidget(
                                        iconWidth: 14.w,
                                        icon: Assets
                                            .commonUiCommonIconManagerTime),
                                    3.5.hGap,
                                    Obx(() {
                                      return Text(
                                        controller.seasonCountDonwnStr.value,
                                        style: 12.w4(
                                          fontFamily: FontFamily.fOswaldRegular,
                                          color: AppColors.cFFFFFF,
                                          height: 1,
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: 45.w,
                                left: 7.w,
                                child: const MatchRankIcon(
                                  rank: 3,
                                )),
                            Positioned(
                              top: 17.5.w,
                              left: 307.5.w,
                              child: Image.asset(
                                Assets.iconUiIconRead,
                                width: 14.w,
                                height: 12.w,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                                top: 58.w,
                                left: 145.w,
                                child: Text(
                                  "professional manager 3".toUpperCase(),
                                  style: 16.w4(
                                      fontFamily: FontFamily.fOswaldRegular,
                                      color: AppColors.cFFFFFF,
                                      height: 0.8),
                                )),
                            Positioned(
                              top: 86.w,
                              left: 140.w,
                              height: 9.w,
                              child: OutLineProgressWidget(
                                // width: 68.w,
                                // height: 6.w,
                                width: 179.w,
                                height: 9.w,
                                progress: controller.teamSimpleEntity.cup /
                                    myTeamCtrl
                                        .getCurrentCupDefine(
                                            controller.teamSimpleEntity.cup)
                                        .cupNum
                                        .last,
                                progressColor: AppColors.cFFFFFF,
                                border: Border.all(
                                    color: AppColors.c999999, width: 0.5),
                              ),
                            ),
                            Positioned(
                              top: 101.5.w,
                              left: 141.5.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconWidget(
                                      iconWidth: 20.5.w,
                                      icon: Assets
                                          .managerUiManagerIconCurrency04),
                                  5.hGap,
                                  AnimatedNum(
                                      number: controller.teamSimpleEntity.cup,
                                      textStyle:
                                          14.w7(color: AppColors.cFFFFFF)),
                                  Text(
                                    "/${myTeamCtrl.getCurrentCupDefine(controller.teamSimpleEntity.cup).cupNum.last}",
                                    style: 14.w7(color: AppColors.cFFFFFF),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 168.5.w + 24.w,
                              left: 17.w,
                              // right: 0,
                              child: SizedBox(
                                width: 341.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Contests Won",
                                          style: 12.w4(
                                              fontFamily:
                                                  FontFamily.fRobotoMedium,
                                              height: 0.8),
                                        ),
                                        11.vGap,
                                        Text(
                                          "${controller.teamSimpleEntity.currentWinGames}",
                                          style: 35.w4(
                                              fontFamily:
                                                  FontFamily.fOswaldBold,
                                              height: 0.8),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 1,
                                      height: 55.w,
                                      color: AppColors.cD1D1D1,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 45.w),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Win Rate",
                                          style: 12.w4(
                                              fontFamily:
                                                  FontFamily.fRobotoMedium,
                                              height: 0.8),
                                        ),
                                        11.vGap,
                                        Text(
                                          "${(controller.teamSimpleEntity.gameWinRate * 100).toStringAsFixed(1)}%",
                                          style: 35.w4(
                                              fontFamily:
                                                  FontFamily.fOswaldBold,
                                              height: 0.8),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class MatchRankIcon extends StatelessWidget {
  const MatchRankIcon({super.key, required this.rank, this.width});
  final int rank;
  final double? width;

  @override
  Widget build(BuildContext context) {
    double scale = width ?? 117.w / 117.w;
    return SizedBox(
      width: 117.w * scale,
      height: 95.5.w * scale,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          IconWidget(
              iconWidth: 117.w * scale,
              iconHeight: 95.5.w * scale,
              icon: Assets.managerUiManagerGameGrade01),
          Positioned(
            top: 21.w,
            child: Image.asset(
              Assets.managerUiManagerGameGradeSan,
              height: 41.5.w,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPaginationBuilder extends SwiperPlugin {
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    final int activeIndex = config.activeIndex;
    final int itemCount = config.itemCount;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        // 当前索引为白色，其他为灰色
        final bool isActive = index == activeIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4), // 长条之间的间距
          width: isActive ? 23.w : 20.w, // 当前索引长条宽度比非选中状态更长
          height: 3, // 设置高度为8
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.black, // 选中为白色，未选中为灰色
            borderRadius: BorderRadius.circular(4), // 设置圆角
          ),
        );
      }),
    );
  }
}
