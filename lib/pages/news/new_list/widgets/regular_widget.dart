/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-21 16:48:47
 * @LastEditTime: 2024-10-26 18:35:23
 */
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/net/address.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class RegularWidget extends StatelessWidget {
  const RegularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewListController>(
        id: "newsList",
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.vGap,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "24-25 Regular Season",
                        style: 19.w7(color: AppColors.c262626),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          final List<String> servers = [
                            Address.personalDevUrl,
                            Address.privateDevUrl,
                            Address.publicDevUrl,
                          ];
                          String current = HttpUtil().getUrl;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ServerSwitchDialog(
                                servers: servers,
                                currentServer: current,
                                onServerChanged: (newServer) {
                                  HttpUtil().setUrl(newServer);
                                  HomeController.to.login();
                                },
                              );
                            },
                          );
                        },
                        child: Text(
                          "切换服务器",
                          style: 15.w7(color: Colors.black),
                        ))
                  ],
                ),
              ),
              10.vGap,
              Container(
                alignment: Alignment.centerLeft,
                height: 232.w,
                width: 375.w,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.state.newsList.length,
                  // itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.pageToDetail(index);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 9.w), // 控制左右间距
                        child: _item(controller.state.newsList[index]),
                        // child: SizedBox(
                        //     width: 180.w,
                        //     height: 80.w,
                        //     child: LightningDividerContainer()),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        });
  }
}

class _item extends StatelessWidget {
  const _item(this.item);
  final NewsDetail item;

  Widget _oneTeam() {
    return Container(
        width: 188.w,
        height: 80.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.c000000, AppColors.c1F6E3D]),
          color: AppColors.c262626,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.w), topRight: Radius.circular(16.w)),
        ),
        child: ImageWidget(
          url: "",
          width: 42.w,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 188.w,
        height: 232.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: AppColors.cF2F2F2),
        child: Column(
          children: [
            _oneTeam(),
            Container(
              margin: EdgeInsets.all(10.w),
              child: Text(
                "${item.content}",
                maxLines: 4,
                style: 12.w4(color: AppColors.c262626),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Text(
                    DateUtil.formatDateMs(
                      item.postTime!,
                      format: DateFormats.y_mo_d_h_m,
                    ),
                    style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                  ),
                  6.hGap,
                  Expanded(
                    child: Text(
                      item.source ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
              child: NewsPercentWidget(
                  leftTitle: "TEAM1",
                  rightTitle: "TEAM2",
                  leftCount: 888,
                  rightCount: 222),
            ),
          ],
        ),
      ),
    );
  }
}

///新闻支持反对比例
class NewsPercentWidget extends StatelessWidget {
  const NewsPercentWidget(
      {super.key,
      required this.leftTitle,
      required this.rightTitle,
      required this.leftCount,
      required this.rightCount});

  final String leftTitle;
  final String rightTitle;
  final int leftCount;
  final int rightCount;

  Widget _progress(Color color) {
    return Container(
      height: 4.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2.w),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int total = leftCount + rightCount;
    String leftPercent = (leftCount / total).toStringAsFixed(2);
    String rightPercent = (rightCount / total).toStringAsFixed(2);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: _progress(AppColors.c10A86A),
            ),
            2.hGap,
            Expanded(
              flex: 1,
              child: _progress(AppColors.cE72646),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "$leftTitle($leftPercent)%",
                  style: 9.w4(color: AppColors.c262626, height: 1.2),
                ),
              ),
              Text(
                "$rightTitle($rightPercent)%",
                textDirection: TextDirection.rtl,
                style: 9.w4(color: AppColors.c262626, height: 1.2),
              )
            ],
          ),
        )
      ],
    );
  }
}

class LightningDividerContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.red],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          // 背景容器
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.red],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
          ),
          // 闪电形状
          Positioned.fill(
            child: ClipPath(
              clipper: LightningClipper(),
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 自定义ClipPath闪电形状
class LightningClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width * 0.45, size.height * 0.3);
    path.lineTo(size.width * 0.55, size.height * 0.3);
    path.lineTo(size.width * 0.5, size.height * 0.6);
    path.lineTo(size.width * 0.6, size.height * 0.6);
    path.lineTo(size.width * 0.5, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
