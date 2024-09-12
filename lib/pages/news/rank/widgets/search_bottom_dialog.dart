import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:arm_chair_quaterback/pages/news/rank/controller.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/border_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchBottomDialog extends GetView<RankController> {
  const SearchBottomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 375.w,
          height: 353.w,
          decoration: BoxDecoration(
              color: AppColors.cFF7954,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.w),
                  topRight: Radius.circular(16.w))),
        ),
        GetBuilder<RankController>(
            id: "search",
            builder: (_) {
              return Container(
                  width: 375.w,
                  height: 350.w,
                  margin: EdgeInsets.only(top: 3.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.w),
                  decoration: BoxDecoration(
                    color: AppColors.c262626,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.w),
                        topRight: Radius.circular(16.w)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 88.w,
                        child: Column(
                          children: [
                            ShadowContainer(
                                backgroudColor: Colors.black54,
                                child: Text("Division",
                                    style: 14.w7(color: AppColors.c666666))),
                            Expanded(
                                child: ListView.builder(
                                    itemCount: 10,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.w),
                                    itemBuilder: (context, index) {
                                      bool isCurren =
                                          controller.divisionIndex.value ==
                                              index;
                                      return SearchItem(
                                        index: index,
                                        isCurren: isCurren,
                                        onTap: () {
                                          controller.divisionIndex.value =
                                              index;
                                          controller.update(["search"]);
                                        },
                                      );
                                    }))
                          ],
                        ),
                      ),
                      20.hGap,
                      SizedBox(
                        width: 204.w,
                        child: Column(
                          children: [
                            ShadowContainer(
                                backgroudColor: Colors.black54,
                                child: Text("Sersion",
                                    style: 14.w7(color: AppColors.c666666))),
                            Expanded(
                                child: ListView.builder(
                                    itemCount: 10,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.w),
                                    itemBuilder: (context, index) {
                                      bool isCurren =
                                          controller.seasonIndex.value == index;
                                      return SearchItem(
                                        index: index,
                                        isCurren: isCurren,
                                        onTap: () {
                                          controller.seasonIndex.value = index;
                                          controller.update(["search"]);
                                        },
                                      );
                                    }))
                          ],
                        ),
                      )
                    ],
                  ));
            }),
      ],
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem(
      {super.key,
      required this.index,
      required this.isCurren,
      required this.onTap});
  final int index;
  final bool isCurren;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: isCurren
          ? BorderContainer(
              // width: 87.w,
              height: 36.w,
              borderColor: AppColors.cFF7954,
              child: Text(
                "Sersion $index",
                style: 14.w7(color: AppColors.cFF7954),
              ),
            )
          : Container(
              width: 87.w,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 8.w),
              child: Text(
                "Division $index",
                style: 14.w7(color: AppColors.c666666),
              ),
            ),
    );
  }
}
