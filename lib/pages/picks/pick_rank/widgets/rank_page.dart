import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  @override
  Widget build(BuildContext context) {
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
                        top: MediaQuery.of(context).padding.top +
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
                                    borderRadius: BorderRadius.circular(1.5.w)),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "3th rank",
                                    style: 14.w7(color: AppColors.c999999),
                                  ),
                                  Text(
                                    "PICK MORE&RIGHT",
                                    style: 18.w7(color: AppColors.cFFFFFF),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          // height: 300.w,
                          margin: EdgeInsets.symmetric(horizontal: 41.w),
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 76.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    //第2名
                                    Container(
                                      margin: EdgeInsets.only(top: 81.w),
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: 81.w,
                                                height: 81.w,
                                                margin:
                                                EdgeInsets.only(bottom: 8.w),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(41.w),
                                                    border: Border.all(
                                                        color: AppColors.c52473E
                                                            .withOpacity(.5),
                                                        width: 8.w)),
                                                child: Container(
                                                  padding: EdgeInsets.all(8.w),
                                                  child: Image.asset(
                                                      Assets.testTeamLogoPng),
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
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: AppColors.c423832,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              13.w)),
                                                      child: Text(
                                                        "2",
                                                        style: TextStyle(
                                                            color:
                                                            AppColors.ccccccc,
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          Container(
                                            width: 50.w,
                                            margin: EdgeInsets.only(top: 5.w),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Player Name",
                                              style: 12.w7(
                                                  color: AppColors.cB3B3B3,
                                                  overflow: TextOverflow.ellipsis),
                                            ),
                                          ),
                                          Text(
                                            "win 36",
                                            style: TextStyle(
                                                color: AppColors.c666666,
                                                fontSize: 11.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //第1名
                                    Container(
                                      margin: EdgeInsets.only(top: 34.w),
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: 97.w,
                                                height: 97.w,
                                                margin:
                                                EdgeInsets.only(bottom: 8.w),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(49.w),
                                                    border: Border.all(
                                                        color: AppColors.c655344,
                                                        width: 8.w)),
                                                child: Container(
                                                  padding: EdgeInsets.all(8.w),
                                                  child: Image.asset(
                                                      Assets.testTeamLogoPng),
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
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: AppColors.c423832,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              13.w)),
                                                      child: Text(
                                                        "1",
                                                        style: TextStyle(
                                                            color:
                                                            AppColors.cFFFFFF,
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          Container(
                                            width: 50.w,
                                            margin: EdgeInsets.only(top: 5.w),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Player Name",
                                              style: 12.w7(
                                                  color: AppColors.cB3B3B3,
                                                  overflow: TextOverflow.ellipsis),
                                            ),
                                          ),
                                          Text(
                                            "win 36",
                                            style: TextStyle(
                                                color: AppColors.c666666,
                                                fontSize: 11.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //第3名
                                    Container(
                                      margin: EdgeInsets.only(top: 101.w),
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: 81.w,
                                                height: 81.w,
                                                margin:
                                                EdgeInsets.only(bottom: 8.w),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(41.w),
                                                    border: Border.all(
                                                        color: AppColors.c52473E
                                                            .withOpacity(.3),
                                                        width: 8.w)),
                                                child: Container(
                                                  padding: EdgeInsets.all(8.w),
                                                  child: Image.asset(
                                                      Assets.testTeamLogoPng),
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
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: AppColors.c423832,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              13.w)),
                                                      child: Text(
                                                        "3",
                                                        style: TextStyle(
                                                            color:
                                                            AppColors.c666666,
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          Container(
                                            width: 50.w,
                                            margin: EdgeInsets.only(top: 5.w),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Player Name",
                                              style: 12.w7(
                                                  color: AppColors.cB3B3B3,
                                                  overflow: TextOverflow.ellipsis),
                                            ),
                                          ),
                                          Text(
                                            "win 36",
                                            style: TextStyle(
                                                color: AppColors.c666666,
                                                fontSize: 11.sp),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 20.w),
                                      width: 90.w,
                                      height: 78.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.05),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
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
                                            "+0.5w",
                                            style: 14.w7(color: AppColors.cF2F2F2),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20.w),
                                      width: 90.w,
                                      height: 96.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.05),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
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
                                            "+0.5w",
                                            style: 14.w7(color: AppColors.cF2F2F2),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20.w),
                                      width: 90.w,
                                      height: 63.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.05),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.w),
                                              topLeft: Radius.circular(20.w))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
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
                                            "+0.5w",
                                            style: 14.w7(color: AppColors.cF2F2F2),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...List.generate(10, (index) {
                    return _buildItem(index);
                  }),
                  // Container(
                  //   // color: Colors.green,
                  //   child: ListView.builder(
                  //       itemCount: 10,
                  //       shrinkWrap: true,
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       itemBuilder: (_, index) {
                  //         return _buildItem(index);
                  //       }),
                  // )
                ],
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 9.w,
            left: 6.w,
            right: 6.w,
            child: Container(
              height: 68.w,
              padding: EdgeInsets.only(left: 21.w, right: 28.w),
              decoration: BoxDecoration(
                  color: AppColors.c333333,
                  borderRadius: BorderRadius.circular(20.w)),
              // margin: EdgeInsets.only(left: 17.w, right: 12.w, bottom: 10.w),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    width: 30.w,
                    alignment: Alignment.center,
                    child: Text(
                      "11",
                      style: 19.w7(color: AppColors.cFFFFFF),
                    ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Image.asset(
                    Assets.testTeamLogoPng,
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
                        "Player Name",
                        style: 12.w7(color: AppColors.cFF7954),
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
                            "36",
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
                          Assets.uiIconMoneyWPng,
                          width: 16.w,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "+0.5w",
                          style: 14.w7(color: AppColors.cFFFFFF),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }

  Widget _buildItem(int index) {
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
                "Player Name",
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
                    "36",
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
                  "+0.5w",
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
