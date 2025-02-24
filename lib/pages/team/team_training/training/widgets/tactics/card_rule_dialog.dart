/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-24 18:53:16
 * @LastEditTime: 2025-02-24 18:24:58
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/tactic_grade_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardRuleDialog extends StatefulWidget {
  const CardRuleDialog({super.key});

  @override
  State<CardRuleDialog> createState() => _CardRuleDialogState();
}

class _CardRuleDialogState extends State<CardRuleDialog>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    if (_list.isNotEmpty) return;
    TeamApi.tacticsDefine().then((v) {
      _list = _ruleMap.map((e) {
        TacticGradeEntity item = TacticGradeEntity.fromJson(e);
        for (var tactics in v) {
          if (item.id == tactics.tacticTypeId) {
            item.percent = (tactics.degreeAdd * 100).round();
          }
        }
        return item;
      }).toList();
      _list.sort((a, b) => b.id.compareTo(a.id));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          var item = _list[index];
          return Container(
            width: 323.w,
            height: 74.w,
            margin: EdgeInsets.symmetric(horizontal: 23.5.w),
            padding: EdgeInsets.only(left: 14.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: AppColors.cF2F2F2),
            child: Row(
              children: [
                Container(
                  width: 110.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: 19.w4(
                            fontFamily: FontFamily.fOswaldMedium, height: 0.8),
                      ),
                      12.5.vGap,
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.c000000,
                            borderRadius: BorderRadius.circular(4.w)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.5.w, vertical: 5.w),
                        child: Text(
                          "Prep: +${item.percent}%",
                          style: 16.w4(
                              color: AppColors.cFFFFFF,
                              height: 1,
                              fontFamily: FontFamily.fOswaldRegular),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 49.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(0),
                            itemBuilder: (context, index) {
                              return SmallTacticCard(
                                color: item.cards[index].color,
                                num: item.cards[index].value,
                                width: 35.5.w,
                              );
                            },
                            separatorBuilder: (context, index) => 3.hGap,
                            itemCount: item.cards.length),
                        if (_list[index].cards.isNotEmpty) 14.hGap,
                        if (_list[index].cards.isNotEmpty)
                          SizedBox(
                            height: 41.5.w,
                            child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(0),
                                itemBuilder: (context, index) {
                                  // Random random = Random();
                                  // int color = random.nextInt(5) + 9;
                                  // int num = random.nextInt(4) + 1;
                                  return Opacity(
                                    opacity: 0.5,
                                    child: SmallTacticCard(
                                      key: Key("${index}_${item.id}"),
                                      color: index,
                                      num: index + 9,
                                      width: 30.w,
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => 3.hGap,
                                itemCount: 5 - _list[index].cards.length),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => 9.5.vGap,
        itemCount: _list.length);
  }

  @override
  bool get wantKeepAlive => true;
}

List<TacticGradeEntity> _list = [];
final _colomns = ["Pattern", "Example", "Preparation"];
final _colomnsWidth = [96.0, 177.0, 65.0];
final _ruleMap = [
  {
    "id": 1001,
    "name": "High Card",
    "cards": [
      {"color": 4, "value": 9},
      {"color": 4, "value": 11},
      {"color": 2, "value": 12},
      {"color": 3, "value": 13},
      {"color": 4, "value": 14}
    ],
    "percent": 0,
  },
  {
    "id": 1002,
    "name": "One Pair",
    "cards": [
      {"color": 1, "value": 10},
      {"color": 2, "value": 10},
    ],
    "percent": 3,
  },
  {
    "id": 1003,
    "name": "Two Pair",
    "cards": [
      {"color": 1, "value": 10},
      {"color": 2, "value": 10},
      {"color": 1, "value": 11},
      {"color": 2, "value": 11},
    ],
    "percent": 4,
  },
  {
    "id": 1004,
    "name": "Three Kind",
    "cards": [
      {"color": 1, "value": 10},
      {"color": 2, "value": 10},
      {"color": 3, "value": 10},
    ],
    "percent": 7,
  },
  {
    "id": 1005,
    "name": "Flush",
    "cards": [
      {"color": 1, "value": 9},
      {"color": 1, "value": 11},
      {"color": 1, "value": 12},
      {"color": 1, "value": 13},
      {"color": 1, "value": 14},
    ],
    "percent": 9,
  },
  {
    "id": 1006,
    "name": "Straight",
    "cards": [
      {"color": 1, "value": 10},
      {"color": 2, "value": 11},
      {"color": 3, "value": 12},
      {"color": 4, "value": 13},
      {"color": 1, "value": 14},
    ],
    "percent": 9,
  },
  {
    "id": 1007,
    "name": "Full House",
    "cards": [
      {"color": 1, "value": 10},
      {"color": 2, "value": 10},
      {"color": 3, "value": 10},
      {"color": 1, "value": 11},
      {"color": 2, "value": 11},
    ],
    "percent": 13,
  },
  {
    "id": 1008,
    "name": "Four Kind",
    "cards": [
      {"color": 1, "value": 14},
      {"color": 4, "value": 14},
      {"color": 3, "value": 14},
      {"color": 2, "value": 14},
    ],
    "percent": 15,
  },
  {
    "id": 1009,
    "name": "Straight Flush",
    "cards": [
      {"color": 4, "value": 9},
      {"color": 4, "value": 10},
      {"color": 4, "value": 11},
      {"color": 4, "value": 12},
      {"color": 4, "value": 13},
    ],
    "percent": 18
  },
  {
    "id": 1010,
    "name": "Royal Flush",
    "cards": [
      {"color": 1, "value": 10},
      {"color": 1, "value": 11},
      {"color": 1, "value": 12},
      {"color": 1, "value": 13},
      {"color": 1, "value": 14}
    ],
    "percent": 18
  },
];
