/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-21 16:48:47
 * @LastEditTime: 2024-11-04 14:43:07
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:common_utils/common_utils.dart' as date;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegularWidget extends StatelessWidget {
  const RegularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewListController>(
        id: "newsList",
        builder: (controller) {
          if (controller.state.newsEntity.match.length <= 1) {
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
                        style: 19.w7(color: AppColors.c262626, height: 1),
                      ),
                    ),
                  ],
                ),
              ),
              10.vGap,
              Container(
                alignment: Alignment.centerLeft,
                height: 232.w,
                // width: 375.w,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.state.newsEntity.match.length,
                  // itemCount: 5,
                  itemBuilder: (context, index) {
                    var item = controller.state.newsEntity.match[index];
                    item.teams = controller.getNBATeams(item.dataLabel);
                    return InkWell(
                      key: Key(item.id.toString()),
                      onTap: () {
                        controller.pageToDetail(item);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 9.w), // 控制左右间距
                        child: _Item(
                          item,
                          key: Key(item.id.toString()),
                        ),
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

class _Item extends GetView<NewListController> {
  const _Item(this.item, {Key? key});
  final NewsListDetail item;

  Widget _oneTeam() {
    int teamId = item.teams.isNotEmpty ? item.teams[0] : 0;
    NewListController controller = Get.find();
    Color color = item.teams.isNotEmpty
        ? controller.getTeamColor(teamId)
        : AppColors.c404040;
    return Container(
        width: 188.w,
        height: 80.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.c000000, color]),
          color: AppColors.c262626,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.w), topRight: Radius.circular(16.w)),
        ),
        child: ImageWidget(
          url: Utils.getWhiteTeamUrl(teamId),
          width: 60.w,
          height: 60.w,
          // imageFailedPath: Assets.uiDefault_05Png,
        ));
  }

  Widget _teams() {
    if (item.teams.length > 2) {
      item.teams = item.teams.sublist(0, 2);
    }
    return SizedBox(
        width: 188.w,
        height: 80.w,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: ClipPath(
                clipper: _TeamClipper(isLeft: true),
                child: Container(
                    width: 100.w,
                    height: 80.w,
                    padding: EdgeInsets.only(right: 18.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColors.c000000,
                        controller.getTeamColor(item.teams[0]),
                      ]),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(16.w)),
                    ),
                    child: ImageWidget(
                      url: Utils.getWhiteTeamUrl(item.teams[0]),
                      width: 56.w,
                      height: 56.w,
                    )),
              ),
            ),
            Positioned(
              right: 0,
              child: ClipPath(
                clipper: _TeamClipper(isLeft: false),
                child: Container(
                    width: 100.w,
                    height: 80.w,
                    padding: EdgeInsets.only(left: 18.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            AppColors.c000000,
                            controller.getTeamColor(item.teams[1]),
                          ]),
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(16.w)),
                    ),
                    child: ImageWidget(
                      url: Utils.getWhiteTeamUrl(item.teams[1]),
                      width: 56.w,
                      height: 56.w,
                    )),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 188.w,
        height: 210.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: AppColors.cF2F2F2),
        child: Column(
          children: [
            item.teams.length > 1 ? _teams() : _oneTeam(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.5.w),
              child: Text(
                item.title,
                maxLines: 3,
                style: 12.w4(color: AppColors.c262626),
              ),
            ),
            const Expanded(child: SizedBox()),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14.w),
              child: Row(
                children: [
                  Text(
                    date.DateUtil.formatDateMs(
                      item.postTime,
                      format: DateFormats.PARAM_Y_M_D_H_M,
                    ),
                    style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                  ),
                  6.hGap,
                  Expanded(
                    child: Text(
                      "-${"-${item.source}"}",
                      overflow: TextOverflow.ellipsis,
                      style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
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
      required this.rightCount,
      this.height});

  final String leftTitle;
  final String rightTitle;
  final int leftCount;
  final int rightCount;
  final double? height;

  Widget _progress(Color color) {
    return Container(
      height: height ?? 4.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(height != null ? height! / 2 : 2.w),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String leftPercent = "50.0";
    String rightPercent = "50.0";
    if (leftCount != 0 || rightCount != 0) {
      int total = leftCount + rightCount;
      if (total == 0) total = 1;
      leftPercent = (leftCount * 100 / total).toStringAsFixed(1);
      rightPercent = (rightCount * 100 / total).toStringAsFixed(1);
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              // flex: leftCount == 0 ? 1 : leftCount * 100 ~/ total,
              flex: (leftCount == 0 && rightCount == 0) ? 1 : leftCount,
              child: _progress(AppColors.c10A86A),
            ),
            2.hGap,
            Expanded(
              flex: (leftCount == 0 && rightCount == 0) ? 1 : rightCount,
              // flex: leftCount == 0 ? 1 : rightCount * 100 ~/ total,
              child: _progress(AppColors.cE72646),
            ),
          ],
        ),
        1.5.vGap,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.5.w),
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

class _TeamClipper extends CustomClipper<Path> {
  final bool isLeft;

  _TeamClipper({required this.isLeft});

  @override
  getClip(Size size) {
    Path path = Path();
    double angle = radians(28); // 倾斜角度，30度
    double tanAngle = tan(angle);
    double centerH = size.height * .53;
    double centerH2 = size.height * .45;
    if (isLeft) {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width - centerH * tanAngle, centerH);
      path.lineTo(size.width, centerH);
      path.lineTo(size.width - centerH2 * tanAngle, size.height);
      path.lineTo(0, size.height);
    } else {
      path.moveTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.lineTo(centerH * tanAngle, centerH2);
      path.lineTo(0, centerH2);
      path.lineTo(centerH2 * tanAngle, 0);
      path.lineTo(size.width, 0);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return false;
  }

  double radians(double degrees) {
    return degrees * (pi / 180.0);
  }
}
