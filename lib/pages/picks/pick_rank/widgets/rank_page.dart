import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/empty_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/11/18:08

class RankPage extends StatefulWidget {
  const RankPage({super.key});

  @override
  State<RankPage> createState() => _RankPageState();
}

class _RankPageState extends State<RankPage>
    with AutomaticKeepAliveClientMixin {
  late PickRankController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find<PickRankController>();
    return  GetBuilder<PickRankController>(
        id: PickRankController.idRanks,
        builder: (controller) {
          if (controller.rankInfo.ranks.isEmpty) {
            return const Center(child: LoadStatusWidget());
          }
      return Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              children: [
                SizedBox(
                  height: 599.w,
                  child: Image.asset(
                    alignment: Alignment.bottomCenter,
                    Assets.bgRank_01Jpg,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 564.w,
                      padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .padding
                              .top +
                              48.w +
                              6.w +
                              16.w +
                              34.w +
                              39.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 22.w),
                            child: Row(
                              children: [
                                Container(
                                  height: 38.w,
                                  width: 5.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.cFF7954,
                                      borderRadius:
                                      BorderRadius.circular(1.5.w)),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "3th rank",
                                      style:
                                      14.w7(color: AppColors.c999999),
                                    ),
                                    Text(
                                      "PICK MORE&RIGHT",
                                      style:
                                      18.w7(color: AppColors.cFFFFFF),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 41.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                //第2名
                                Expanded(
                                  child: Visibility(
                                    visible:
                                    controller.rankInfo.ranks.length >=
                                        2,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin:
                                          EdgeInsets.only(top: 71.w),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () => Get.toNamed(RouteNames.picksPersonalCenter,id: GlobalNestedKey.PICKS),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: 81.w,
                                                      height: 81.w,
                                                      margin: EdgeInsets
                                                          .only(
                                                          bottom: 8.w),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(41
                                                              .w),
                                                          border: Border
                                                              .all(
                                                              color: AppColors
                                                                  .c52473E
                                                                  .withOpacity(
                                                                  .5),
                                                              width: 8.w)),
                                                      child: Container(
                                                        padding:
                                                        EdgeInsets.all(
                                                            8.w),
                                                        child: Image.asset(
                                                            Assets
                                                                .testTeamLogoPng),

                                                        /// todo 换真实网络图
                                                      ),
                                                    ),
                                                    Positioned(
                                                        bottom: 0,
                                                        left: 0,
                                                        right: 0,
                                                        child: Center(
                                                          child: Container(
                                                            height: 26.w,
                                                            width: 26.w,
                                                            alignment:
                                                            Alignment
                                                                .center,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .c423832,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    13.w)),
                                                            child: Text(
                                                              "2",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .ccccccc,
                                                                  fontSize:
                                                                  18.sp,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 50.w,
                                                margin: EdgeInsets.only(
                                                    top: 5.w),
                                                alignment: Alignment
                                                    .center,
                                                child: Text(
                                                  controller.rankInfo
                                                      .ranks[1].teamName,
                                                  style: 12.w7(
                                                      color:
                                                      AppColors.cB3B3B3,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                              Text(
                                                "win ${controller.rankInfo
                                                    .ranks[1].win}",
                                                style: TextStyle(
                                                    color:
                                                    AppColors.c666666,
                                                    fontSize: 11.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                        20.vGap,
                                        Container(
                                          width: 90.w,
                                          height: 78.w,
                                          padding:
                                          EdgeInsets.only(top: 15.w),
                                          alignment: Alignment.topCenter,
                                          decoration: BoxDecoration(
                                              color: Colors.white
                                                  .withOpacity(.05),
                                              borderRadius:
                                              BorderRadius.only(
                                                  topRight: Radius
                                                      .circular(20.w),
                                                  topLeft: Radius
                                                      .circular(20.w))),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                Assets.uiIconMoneyWPng,
                                                width: 14.w,
                                                fit: BoxFit.fitWidth,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                "+${controller.rankInfo
                                                    .ranks[1].chip
                                                    .toStringAsFixed(0)}",
                                                style: 14.w7(
                                                    color:
                                                    AppColors.cF2F2F2),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                6.hGap,
                                //第1名
                                Expanded(
                                  child: Visibility(
                                    visible: controller
                                        .rankInfo.ranks.isNotEmpty,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin:
                                          EdgeInsets.only(top: 24.w),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () => Get.toNamed(RouteNames.picksPersonalCenter,id: GlobalNestedKey.PICKS),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: 97.w,
                                                      height: 97.w,
                                                      margin: EdgeInsets
                                                          .only(
                                                          bottom: 8.w),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              49.w),
                                                          border: Border
                                                              .all(
                                                              color: AppColors
                                                                  .c655344,
                                                              width: 8.w)),
                                                      child: Container(
                                                        padding:
                                                        EdgeInsets.all(
                                                            8.w),
                                                        child: Image.asset(
                                                            Assets
                                                                .testTeamLogoPng),
                                                
                                                        /// todo 换网络图
                                                      ),
                                                    ),
                                                    Positioned(
                                                        bottom: 0,
                                                        left: 0,
                                                        right: 0,
                                                        child: Center(
                                                          child: Container(
                                                            height: 26.w,
                                                            width: 26.w,
                                                            alignment:
                                                            Alignment
                                                                .center,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .c423832,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    13.w)),
                                                            child: Text(
                                                              "1",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .cFFFFFF,
                                                                  fontSize:
                                                                  18.sp,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 50.w,
                                                margin: EdgeInsets.only(
                                                    top: 5.w),
                                                alignment: Alignment
                                                    .center,
                                                child: Text(
                                                  controller.rankInfo
                                                      .ranks[0].teamName,
                                                  style: 12.w7(
                                                      color:
                                                      AppColors.cB3B3B3,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                              Text(
                                                "win ${controller.rankInfo
                                                    .ranks[0].win}",
                                                style: TextStyle(
                                                    color:
                                                    AppColors.c666666,
                                                    fontSize: 11.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                        20.vGap,
                                        Container(
                                          width: 90.w,
                                          height: 96.w,
                                          padding:
                                          EdgeInsets.only(top: 15.w),
                                          alignment: Alignment.topCenter,
                                          decoration: BoxDecoration(
                                              color: Colors.white
                                                  .withOpacity(.05),
                                              borderRadius:
                                              BorderRadius.only(
                                                  topRight: Radius
                                                      .circular(20.w),
                                                  topLeft: Radius
                                                      .circular(20.w))),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                Assets.uiIconMoneyWPng,
                                                width: 14.w,
                                                fit: BoxFit.fitWidth,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                "+${controller.rankInfo
                                                    .ranks[0].chip
                                                    .toStringAsFixed(0)}",
                                                style: 14.w7(
                                                    color:
                                                    AppColors.cF2F2F2),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                6.hGap,
                                //第3名
                                Expanded(
                                  child: Visibility(
                                    visible:
                                    controller.rankInfo.ranks.length >=
                                        3,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin:
                                          EdgeInsets.only(top: 101.w),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () => Get.toNamed(RouteNames.picksPersonalCenter,id: GlobalNestedKey.PICKS),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: 81.w,
                                                      height: 81.w,
                                                      margin: EdgeInsets
                                                          .only(
                                                          bottom: 8.w),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(41
                                                              .w),
                                                          border: Border
                                                              .all(
                                                              color: AppColors
                                                                  .c52473E
                                                                  .withOpacity(
                                                                  .3),
                                                              width: 8.w)),
                                                      child: Container(
                                                        padding:
                                                        EdgeInsets.all(
                                                            8.w),
                                                        child: Image.asset(
                                                            Assets
                                                                .testTeamLogoPng),
                                                
                                                        /// todo 换网络图
                                                      ),
                                                    ),
                                                    Positioned(
                                                        bottom: 0,
                                                        left: 0,
                                                        right: 0,
                                                        child: Center(
                                                          child: Container(
                                                            height: 26.w,
                                                            width: 26.w,
                                                            alignment:
                                                            Alignment
                                                                .center,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .c423832,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    13.w)),
                                                            child: Text(
                                                              "3",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .c666666,
                                                                  fontSize:
                                                                  18.sp,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 50.w,
                                                margin: EdgeInsets.only(
                                                    top: 5.w),
                                                alignment: Alignment
                                                    .center,
                                                child: Text(
                                                  controller.rankInfo
                                                      .ranks[2].teamName,
                                                  style: 12.w7(
                                                      color:
                                                      AppColors.cB3B3B3,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                              Text(
                                                "win ${controller.rankInfo
                                                    .ranks[2].win}",
                                                style: TextStyle(
                                                    color:
                                                    AppColors.c666666,
                                                    fontSize: 11.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                        20.vGap,
                                        Container(
                                          width: 90.w,
                                          height: 63.w,
                                          padding:
                                          EdgeInsets.only(top: 15.w),
                                          alignment: Alignment.topCenter,
                                          decoration: BoxDecoration(
                                              color: Colors.white
                                                  .withOpacity(.05),
                                              borderRadius:
                                              BorderRadius.only(
                                                  topRight: Radius
                                                      .circular(20.w),
                                                  topLeft: Radius
                                                      .circular(20.w))),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                Assets.uiIconMoneyWPng,
                                                width: 14.w,
                                                fit: BoxFit.fitWidth,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                "+${controller.rankInfo
                                                    .ranks[2].chip
                                                    .toStringAsFixed(0)}",
                                                style: 14.w7(
                                                    color:
                                                    AppColors.cF2F2F2),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...List.generate(
                        controller.rankInfo.ranks.length - 3, (index) {
                      return _buildItem(index);
                    }),
                    90.vGap,
                  ],
                ),
              ],
            ),
          ),
          Obx(() {
            return AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                bottom: controller.inTheRankList.value ||
                    controller.rankInfo.myRank.rank == null ? -200.w : 9.w,
                left: 6.w,
                right: 6.w,
                child: Container(
                  padding: EdgeInsets.only(left: 43.w, right: 33.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                      color: AppColors.c333333),
                  height: 68.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${controller.rankInfo.myRank.rank == 0
                                ? '--'
                                : controller.rankInfo.myRank.rank}",
                            style: 18.w7(color: AppColors.cFF7954),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Image.asset(
                            Assets.testTeamLogoPng,
                            width: 48.w,

                            /// todo 换网络图
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 12.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${Get
                                      .find<HomeController>()
                                      .userEntiry
                                      .teamLoginInfo
                                      ?.team
                                      ?.teamName}",
                                  style: 12.w7(
                                      color: AppColors.cFF7954,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(
                                  height: 3.w,
                                ),
                                Text(
                                  "WIN  ${controller.rankInfo.myRank.win ?? 0}",
                                  style: TextStyle(
                                      color: AppColors.cB3B3B3,
                                      fontSize: 10.sp),
                                ),
                                Text(
                                  "SUCCESS  ${controller.rankInfo.myRank
                                      .success ?? 0}%",
                                  style: TextStyle(
                                      color: AppColors.cB3B3B3,
                                      fontSize: 10.sp),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        (controller.rankInfo.myRank.chip ?? 0)
                            .toDouble()
                            .toStringAsFixed(0),
                        style: 18.w7(color: AppColors.cFFFFFF),
                      )
                    ],
                  ),
                ));
          })
        ],
      );
    });
  }

  Widget _buildItem(int i) {
    var index = i + 3;
    var item = Container(
      height: 68.w,
      padding: EdgeInsets.only(left: 15.w, right: 22.w),
      decoration: BoxDecoration(
          color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(20.w)),
      margin: EdgeInsets.only(left: 17.w, right: 12.w, bottom: 10.w),
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            width: 30.w,
            alignment: Alignment.center,
            child: Text(
              "$index",
              style: 19.w7(color: AppColors.c666666),
            ),
          ),
          SizedBox(
            width: 7.w,
          ),
          Image.asset(
            Assets.testTeamLogoPng,

            /// todo 换网络图
            width: 48.w,
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.rankInfo.ranks[index].teamName,
                style: 12.w7(color: AppColors.c1A1A1A),
              ),
              Row(
                children: [
                  Text(
                    "win",
                    style: TextStyle(
                      color: AppColors.c666666,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "${controller.rankInfo.ranks[index].win}",
                    style: TextStyle(
                      color: AppColors.c666666,
                      fontSize: 12.sp,
                    ),
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  Assets.uiIconMoneyBPng,
                  width: 16.w,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  "+${controller.rankInfo.ranks[index].chip.toStringAsFixed(
                      0)}",
                  style: 14.w7(color: AppColors.c1A1A1A),
                )
              ],
            ),
          )
        ],
      ),
    );
    return item;
  }

  @override
  bool get wantKeepAlive => true;
}
