import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/common/widgets/empty_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/11/18:56

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickRankController>(
        id: PickRankController.idAwards,
        builder: (controller) {
          if (controller.rankAwards.isEmpty) {
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
                    Assets.bgRank_02Jpg,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  // color: Colors.red,
                  margin: EdgeInsets.only(top: 564.w, left: 16.w, right: 16.w),
                  padding: EdgeInsets.only(
                    left: 11.w,
                    top: 12.w,
                    right: 11.w,
                    bottom: 90.w,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.cF2F2F2,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.w),
                          topRight: Radius.circular(20.w))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 77.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: 77.w,
                                width: 156.w,
                                padding: EdgeInsets.symmetric(
                                    vertical: 3.w, horizontal: 13.w),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                        AssetImage(Assets.uiRankBoxPng),
                                        fit: BoxFit.fill)),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text("Box",
                                        style: 24
                                            .w7(
                                            color: AppColors.cFFFFFF)),
                                    Text(
                                      "rank 1-10",
                                      style: TextStyle(
                                          color: AppColors.cB3B3B3,
                                          fontSize: 12.sp),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: 77.w,
                                width: 156.w,
                                padding: EdgeInsets.symmetric(
                                    vertical: 3.w, horizontal: 13.w),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            Assets.uiRankMoneyPng),
                                        fit: BoxFit.fitWidth)),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text("Money",
                                        style: 24
                                            .w7(
                                            color: AppColors.cFFFFFF)),
                                    Text(
                                      "rank 1-10",
                                      style: TextStyle(
                                          color: AppColors.cB3B3B3,
                                          fontSize: 12.sp),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 9.w,
                      ),
                      ...List.generate(controller.rankAwards.length,
                              (index) {
                            return Container(
                              height: 42.w,
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 9.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      12.w)),
                              padding: EdgeInsets.only(
                                  left: 17.w, right: 28.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Center(
                                      child: Text("$index",
                                          style: 12.w7(
                                              color: index == 3
                                                  ? AppColors.cFF7954
                                                  : AppColors.c262626)),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .end,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              Assets.testTeamLogoPng,
                                              width: 28.w,
                                            ),
                                            Text(
                                              "x10",
                                              style: TextStyle(
                                                  color: AppColors
                                                      .c666666,
                                                  fontSize: 10.sp),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              Assets.testTeamLogoPng,
                                              width: 28.w,
                                            ),
                                            Text(
                                              "x10",
                                              style: TextStyle(
                                                  color: AppColors
                                                      .c666666,
                                                  fontSize: 10.sp),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              left: 63.w,
              right: 63.w,
              bottom: 20.w,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 300.w,
                  ),
                  child: BtnBackground(
                      child: Center(
                        child: Text(
                          "GET",
                          style: 16.w7(color: AppColors.cFFFFFF),
                        ),
                      )),
                ),
              ))
        ],
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
