import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_scroll_physics.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/1/9/14:22

class RankRewardDetail extends StatelessWidget {
  RankRewardDetail({super.key});

  late PickRankController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find<PickRankController>();
    var scrollController = ScrollController();
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(child: InkWell(onTap: () => Get.back(), child: Container())),
          Container(
            height: 536.h,
            decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.vertical(top: Radius.circular(9.w)),
            ),
            child: Column(
              children: [
                const DialogTopBtn(),
                18.vGap,
                Row(
                  children: [
                    22.hGap,
                    Text(
                      LangKey.pickTabRank.tr,
                      style: 19.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium,
                      ),
                    ),
                  ],
                ),
                18.vGap,
                Container(
                  height: 73.w,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  padding: EdgeInsets.only(left: 15.w, right: 7.w),
                  decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    borderRadius: BorderRadius.circular(7.w),
                  ),
                  child: Builder(builder: (context) {
                    if (controller.rankInfo!.myRank.rank == 0) {
                      return Row(
                        children: [
                          IconWidget(
                              iconWidth: 34.w,
                              icon: Assets.commonUiCommonIconCurrency02),
                          16.hGap,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "${controller.rankInfo!.myRank.chip}",
                                    style: 24.w7(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldBold,
                                    )),
                                TextSpan(
                                    text:
                                        "/${controller.getBetRewardRank().format()}",
                                    style: 16.w5(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium,
                                    )),
                              ])),
                              6.vGap,
                              Text(
                                // "WIN ${controller.getBetRewardRank().format()} JETTON RANK",
                                LangKey.pickTipsRank.tr.replaceAll('{0}',
                                    '${controller.getBetRewardRank().format()}'),
                                style: 10.w4(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoRegular,
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LangKey.pickTabMyRank.tr,
                          style: 12.w4(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                        ),
                        10.vGap,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${controller.selfInRankListIndex != -1 ? controller.rankInfo!.myRank.rank : "${controller.awardInfo.last.rankAwardEntity.maxRank}+"}",
                              style: 24.w7(
                                color: AppColors.c000000,
                                height: 1,
                                fontFamily: FontFamily.fOswaldBold,
                              ),
                            ),
                            Builder(builder: (context) {
                              if (controller.selfInRankListIndex == -1) {
                                return Text(
                                  LangKey.pickTipsNoReward.tr,
                                  style: 24.w5(
                                    color: AppColors.cB3B3B3,
                                    height: 1,
                                    fontFamily: FontFamily.fOswaldMedium,
                                  ),
                                );
                              }
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (controller
                                      .awardInfo[controller.selfInRankListIndex]
                                      .awardPickData
                                      .isNotEmpty)
                                    ...List.generate(
                                        controller
                                            .awardInfo[
                                                controller.selfInRankListIndex]
                                            .awardPickData
                                            .length, (i) {
                                      var item = controller
                                          .awardInfo[
                                              controller.selfInRankListIndex]
                                          .awardPickData[i];
                                      return _buildGiftItem(
                                          Utils.getPropIconUrl(
                                              item.propDefineEntity.propId),
                                          "${item.num}");
                                    }),
                                ],
                              );
                            })
                          ],
                        ),
                      ],
                    );
                  }),
                ),
                19.vGap,
                Container(
                  margin: EdgeInsets.only(left: 31.w, right: 28.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LangKey.pickTapRank.tr,
                        style: 12.w5(
                          color: AppColors.c1A1A1A,
                          height: 1,
                          fontFamily: FontFamily.fRobotoMedium,
                        ),
                      ),
                      Text(
                        LangKey.pickTapRankRaward.tr,
                        style: 12.w5(
                          color: AppColors.c1A1A1A,
                          height: 1,
                          fontFamily: FontFamily.fRobotoMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                8.vGap,
                Divider(
                  height: 1.w,
                  color: AppColors.cD4D4D4,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    physics: OneBoundaryScrollPhysics(
                        scrollController: scrollController),
                    child: Column(children: [
                      ...List.generate(controller.awardInfo.length, (index) {
                        bool lastIndex =
                            controller.awardInfo.length - 1 == index;
                        return Container(
                          height: 49.w,
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: lastIndex
                                  ? null
                                  : Border(
                                      bottom: BorderSide(
                                      color: AppColors.cE6E6E6,
                                      width: 1.w,
                                    ))),
                          padding: EdgeInsets.only(left: 16.w, right: 14.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Rank ${controller.awardInfo[index].rankAwardEntity.minRank}${controller.awardInfo[index].rankAwardEntity.minRank == controller.awardInfo[index].rankAwardEntity.maxRank ? "" : " - ${controller.awardInfo[index].rankAwardEntity.maxRank}"}",
                                      style: 14.w5(
                                        color: AppColors.c262626,
                                        fontFamily: FontFamily.fOswaldMedium,
                                      )),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (controller.awardInfo[index].awardPickData
                                      .isNotEmpty)
                                    ...List.generate(
                                        controller.awardInfo[index]
                                            .awardPickData.length, (i) {
                                      var item = controller
                                          .awardInfo[index].awardPickData[i];
                                      return _buildGiftItem(
                                          Utils.getPropIconUrl(
                                              item.propDefineEntity.propId),
                                          "${item.num}");
                                    }),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                      Divider(
                        height: 1.w,
                        color: AppColors.cD4D4D4,
                      ),
                      16.vGap,
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${LangKey.pickTabTips.tr}：",
                              style: 14.w5(
                                color: AppColors.cB3B3B3,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium,
                              ),
                            ),
                            15.vGap,
                            Text(
                              LangKey.pickTipsRankRule.tr,
                              // "1.Ranking needs at least 100 jettons.\n2.New season is reset based on the final trophy count.",
                              style: 12.w5(
                                color: AppColors.cB3B3B3,
                                height: 1.5,
                                fontFamily: FontFamily.fRobotoMedium,
                              ),
                            ),
                            9.vGap,
                          ],
                        ),
                      ),
                      9.vGap,
                      SizedBox(
                        height: Utils.getPaddingBottom(),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftItem(String image, String value) {
    return SizedBox(
      width: 75.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          10.hGap,
          IconWidget(
            iconWidth: 33.w,
            icon: image,
          ),
          4.hGap,
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 6.w),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "x$value",
                  style: 12.w4(
                    color: AppColors.cB3B3B3,
                    height: 1,
                    fontFamily: FontFamily.fRobotoRegular,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
