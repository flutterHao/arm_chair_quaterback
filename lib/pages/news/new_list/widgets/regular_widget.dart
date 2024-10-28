/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-21 16:48:47
 * @LastEditTime: 2024-10-28 09:52:05
 */
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/net/address.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
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
          if (controller.state.newsEntity.match.isEmpty) {
            return Container();
          }
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
                  itemCount: controller.state.newsEntity.match.length,
                  // itemCount: 5,
                  itemBuilder: (context, index) {
                    var item = controller.state.newsEntity.match[index];
                    item.teams = controller.getNewsTeam(item.dataLabel);
                    return InkWell(
                      onTap: () {
                        controller.pageToDetail(item.id);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 9.w), // 控制左右间距
                        child: _Item(controller.state.newsEntity.match[index]),
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

class _Item extends StatelessWidget {
  const _Item(this.item);
  final NewsListDetail item;

  Widget _oneTeam() {
    if (item.teams.length > 2) {
      item.teams = item.teams.sublist(0, 2);
    }
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: item.teams
              .map(
                (e) => ImageWidget(
                  url: Utils.getTeamUrl(e),
                  width: 60.w,
                ),
              )
              .toList(),
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
                item.content,
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
                      item.postTime,
                      format: DateFormats.y_mo_d_h_m,
                    ),
                    style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                  ),
                  6.hGap,
                  Expanded(
                    child: Text(
                      item.source,
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
                  leftTitle: item.teams.length >= 2
                      ? Utils.getTeamInfo(item.teams[0]).shortEname
                      : "TRUE",
                  rightTitle: item.teams.length >= 2
                      ? Utils.getTeamInfo(item.teams[1]).shortEname
                      : "FALSE",
                  leftCount: item.likes,
                  rightCount: item.unLikes),
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
    if (total == 0) total = 1;
    String leftPercent = (leftCount * 100 / total).toStringAsFixed(2);
    String rightPercent = (rightCount * 100 / total).toStringAsFixed(2);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              // flex: leftCount == 0 ? 1 : leftCount * 100 ~/ total,
              flex: leftCount,
              child: _progress(AppColors.c10A86A),
            ),
            2.hGap,
            Expanded(
              flex: rightCount,
              // flex: leftCount == 0 ? 1 : rightCount * 100 ~/ total,
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
                  "$leftTitle ($leftPercent%)",
                  style: 9.w4(color: AppColors.c262626, height: 1.2),
                ),
              ),
              Text(
                // "$rightTitle($rightPercent)%",
                // textDirection: TextDirection.rtl,
                "($rightPercent%) $rightTitle",
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
