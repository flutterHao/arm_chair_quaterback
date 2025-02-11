/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-31 15:05:31
 * @LastEditTime: 2025-01-24 17:42:15
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RosterTab extends StatefulWidget {
  const RosterTab({super.key});

  @override
  State<RosterTab> createState() => _RosterTabState();
}

class _RosterTabState extends State<RosterTab>
    with AutomaticKeepAliveClientMixin {
  int avgAge = 0;
  double avgHeight = 0;
  double avgWeight = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<TeamDetailController>(
        tag: Get.arguments.toString(),
        builder: (controller) {
          avgAge = 0;
          for (var element in controller.statPlayerList) {
            var baseInfo = Utils.getPlayBaseInfo(element.playerId);
            avgAge += baseInfo.age;
            // avgHeight += baseInfo.h;
            // avgWeight += baseInfo.weight;
          }
          if (controller.statPlayerList.isEmpty) {
            return const SizedBox();
          }
          avgAge = avgAge ~/ controller.statPlayerList.length;
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                9.vGap,
                ...controller.positionList.map((e) {
                  var list = controller.getPlayerList(e);
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 9.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.w)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          24.5.vGap,
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Text(
                              e.tr,
                              style: 24.w4(
                                  fontFamily: FontFamily.fOswaldBold,
                                  height: 0.9),
                            ),
                          ),
                          SizedBox(height: 16.w),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: AppColors.cD1D1D1,
                          ),
                          ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 10.w),
                              shrinkWrap: true,
                              itemCount: list.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var item = list[index];
                                String name =
                                    Utils.getPlayBaseInfo(item.playerId).ename;
                                if (name.isEmpty) {
                                  name = item.playerName;
                                }
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(RouteNames.picksPlayerDetail,
                                        arguments: PlayerDetailPageArguments(
                                            item.playerId));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 94.w,
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        24.hGap,
                                        Container(
                                          width: 55.w,
                                          height: 74.w,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              color: AppColors.cF2F2F2,
                                              borderRadius:
                                                  BorderRadius.circular(6.w)),
                                          child: ImageWidget(
                                            url:
                                                Utils.getPlayUrl(item.playerId),
                                            width: 55.w,
                                            height: 74.w,
                                          ),
                                        ),
                                        13.hGap,
                                        Expanded(
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  name,
                                                  style: 21.w4(
                                                    height: 0.8,
                                                    fontFamily: FontFamily
                                                        .fOswaldMedium,
                                                  ),
                                                ),
                                                9.hGap,
                                                Text(
                                                  '#${Utils.getPlayBaseInfo(item.playerId).number}',
                                                  style: 12.w4(
                                                      height: 0.8,
                                                      fontFamily: FontFamily
                                                          .fOswaldMedium,
                                                      color: AppColors.c4D4D4D),
                                                ),
                                              ]),
                                        ),
                                        Text(
                                            Utils.getPlayBaseInfo(item.playerId)
                                                .position,
                                            style: 14.w4(
                                              height: 0.8,
                                              fontFamily:
                                                  FontFamily.fOswaldMedium,
                                            )),
                                        18.hGap,
                                      ],
                                    ),
                                  ),
                                );
                              })
                        ]),
                  );
                }),
                Container(
                  width: double.infinity,
                  height: 146.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.w),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 16.5.w, top: 25.w, bottom: 25.w),
                        child: Text(
                          LangKey.nbaTeamMeanPlayerCount.tr,
                          style: 24.w4(
                            fontFamily: FontFamily.fOswaldBold,
                            height: 0.9,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "COUNT",
                            textAlign: TextAlign.center,
                            style: 12.w4(
                              fontFamily: FontFamily.fRobotoMedium,
                              height: 0.8,
                            ),
                          )),
                          Expanded(
                              child: Text(
                            "AVG AGE",
                            textAlign: TextAlign.center,
                            style: 12.w4(
                              fontFamily: FontFamily.fRobotoMedium,
                              height: 0.8,
                            ),
                          )),
                          Expanded(
                              child: Text(
                            "AVG HT",
                            textAlign: TextAlign.center,
                            style: 12.w4(
                              fontFamily: FontFamily.fRobotoMedium,
                              height: 0.8,
                            ),
                          )),
                          Expanded(
                              child: Text(
                            "AVG WT",
                            textAlign: TextAlign.center,
                            style: 12.w4(
                              fontFamily: FontFamily.fRobotoMedium,
                              height: 0.8,
                            ),
                          ))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12.w, bottom: 18.w),
                        width: double.infinity,
                        height: 1.w,
                        color: AppColors.cD1D1D1,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "${controller.statPlayerList.length}",
                            textAlign: TextAlign.center,
                            style: 12.w4(
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 0.8,
                            ),
                          )),
                          Expanded(
                              child: Text(
                            "$avgAge",
                            textAlign: TextAlign.center,
                            style: 12.w4(
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 0.8,
                            ),
                          )),
                          Expanded(
                              child: Text(
                            "$avgHeight",
                            textAlign: TextAlign.center,
                            style: 12.w4(
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 0.8,
                            ),
                          )),
                          Expanded(
                              child: Text(
                            "$avgWeight",
                            textAlign: TextAlign.center,
                            style: 12.w4(
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 0.8,
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
                45.vGap
              ],
            ),
          );
        });
  }
}
