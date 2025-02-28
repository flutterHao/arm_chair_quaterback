import 'dart:async';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2025/1/8/19:01

class OpenRewardCountDownWidget extends StatefulWidget {
  const OpenRewardCountDownWidget(
      {super.key, required this.milliseconds, this.onEnd});

  final int milliseconds;
  final Function? onEnd;

  @override
  State<OpenRewardCountDownWidget> createState() =>
      _OpenRewardCountDownWidgetState();
}

class _OpenRewardCountDownWidgetState extends State<OpenRewardCountDownWidget> {
  late Timer timer;
  int seconds = 0;

  @override
  void initState() {
    super.initState();
    seconds = widget.milliseconds ~/ 1000;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds <= 0) {
        widget.onEnd?.call();
        t.cancel();
      } else {
        seconds--;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int sec = seconds % 60;
    int min = seconds % 3600 ~/ 60;
    int hr = seconds % 86400 ~/ 3600;
    int day = seconds ~/ 86400;
    return NotificationListener<ScrollNotification>(
      onNotification: (_) {
        return true;
      },
      child: Row(
        children: [
          _buildItem(day, "DAY", 31),
          _buildItem(hr, "HR", 24),
          _buildItem(min, "MIN", 60),
          _buildItem(sec, "SEC", 60),
        ],
      ),
    );
  }

  Widget _buildItem(int value, String text, int step) {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.w),
                    border: Border.all(
                      width: 1.w,
                      color: AppColors.c706850,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.c0B0F14,
                        offset: const Offset(1, 1),
                        blurRadius: 1.w,
                        // spreadRadius: 2.w,
                      )
                    ],
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.c232427,
                          AppColors.c505762,
                          AppColors.c232427,
                        ])),
                child: InnerShadow(
                  shadows: [
                    BoxShadow(
                      color: AppColors.c0B0F14,
                      offset: Offset(7.w, 7.w),
                      blurRadius: 7.w,
                      spreadRadius: 7.w,
                    )
                  ],
                  child: SizedBox(
                    width: 28.w,
                    height: 47.w,
                  ),
                ),
              ),
              SizedBox(
                width: 28.w,
                height: 47.w,
                child: PageViewItem(
                    index: value,
                    initIndex: value,
                    step: step,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          index.toString().padLeft(2, "0"),
                          style: 16.w5(
                            color: AppColors.cFFE8A0,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
          6.vGap,
          Text(
            text,
            style: 10.w4(
              color: AppColors.c706950,
              height: 1,
              fontFamily: FontFamily.fRobotoRegular,
            ),
          )
        ],
      ),
    );
  }
}

class PageViewItem extends StatefulWidget {
  const PageViewItem(
      {super.key,
      required this.itemBuilder,
      this.initIndex = 0,
      required this.index,
      this.step = 60});

  final Widget Function(BuildContext context, int index) itemBuilder;
  final int initIndex;
  final int index;
  final int step;

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    var initialPage = widget.initIndex == 0 ? widget.step : widget.initIndex;
    pageController = PageController(initialPage: initialPage);
  }

  @override
  void didUpdateWidget(covariant PageViewItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      pageController
          .animateToPage(widget.index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut)
          .then((_) {
        if (widget.index == 0) {
          pageController.jumpToPage(widget.step);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.step + 1,
        controller: pageController,
        scrollDirection: Axis.vertical,
        reverse: true,
        itemBuilder: (context, index) {
          return widget.itemBuilder(context, index % widget.step);
        });
  }
}
