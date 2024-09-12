import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
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
          child: Stack(
            children: [
              Image.asset(
                Assets.bgRank_01Jpg, //todo 换图
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top +
                        48.w +
                        6.w +
                        16.w +
                        34.w +
                        39.w),
                padding: EdgeInsets.only(bottom: 87.w),
                child: Column(
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
                                style: TextStyle(
                                    color: AppColors.c999999,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "PICK MORE&RIGHT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
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
                                          style: TextStyle(
                                              color: AppColors.cB3B3B3,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
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
                                          style: TextStyle(
                                              color: AppColors.cB3B3B3,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
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
                                          style: TextStyle(
                                              color: AppColors.cB3B3B3,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
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
                                        style: TextStyle(
                                            color: AppColors.cF2F2F2,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
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
                                        style: TextStyle(
                                            color: AppColors.cF2F2F2,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
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
                                        style: TextStyle(
                                            color: AppColors.cF2F2F2,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
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
              padding: EdgeInsets.only(left: 21.w,right: 28.w),
              decoration: BoxDecoration(
                  color: AppColors.c333333, borderRadius: BorderRadius.circular(20.w)),
              // margin: EdgeInsets.only(left: 17.w, right: 12.w, bottom: 10.w),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    width: 30.w,
                    alignment: Alignment.center,
                    child: Text(
                      "11",
                      style: TextStyle(
                          color: AppColors.cFFFFFF,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            color: AppColors.cFF7954,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
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
                          style: TextStyle(
                              color: AppColors.cFFFFFF,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
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
      padding: EdgeInsets.only(left: 15.w,right: 22.w),
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
              style: TextStyle(
                  color: AppColors.c666666,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold),
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
                style: TextStyle(
                    color: AppColors.c1A1A1A,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
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
                  style: TextStyle(
                      color: AppColors.c1A1A1A,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
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
