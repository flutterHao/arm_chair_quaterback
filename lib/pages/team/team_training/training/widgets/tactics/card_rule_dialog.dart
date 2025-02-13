/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-24 18:53:16
 * @LastEditTime: 2024-12-30 20:04:41
 */
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

class _CardRuleDialogState extends State<CardRuleDialog> {
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
    return Builder(builder: (context) {
      return Container(
        width: double.infinity,
        height: 469.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(9.w)),
        ),
        child: Column(
          children: [
            Container(
              width: 44.w,
              height: 4.w,
              margin: EdgeInsets.symmetric(vertical: 8.w),
              decoration: BoxDecoration(
                color: AppColors.c000000.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2.w),
              ),
            ),
            10.vGap,
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 15.w),
              child: Text(
                "Tactics Grade",
                style: 19.w4(
                    color: Colors.black, fontFamily: FontFamily.fOswaldMedium),
              ),
            ),
            25.vGap,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _colomns
                    .map((e) => Text(
                          e,
                          style: 12.w4(
                            height: 0.8,
                            fontFamily: FontFamily.fRobotoMedium,
                          ),
                        ))
                    .toList(),
              ),
            ),
            10.vGap,
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.cD1D1D1,
            ),
            Expanded(
              child: SingleChildScrollView(
                  // physics: const BouncingScrollPhysics(),
                  child: Table(
                      columnWidths: {
                    for (var k in _colomnsWidth.asMap().keys)
                      k: FixedColumnWidth(_colomnsWidth[k])
                  },
                      textBaseline: TextBaseline.alphabetic,
                      border: const TableBorder.symmetric(
                        inside: BorderSide(color: AppColors.cE6E6E),
                      ),
                      children: _list.map((e) {
                        return TableRow(children: [
                          Container(
                              height: 60.w,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left: 4.w),
                              child: Text(
                                e.name,
                                style:
                                    14.w4(fontFamily: FontFamily.fOswaldMedium),
                              )),
                          Container(
                              height: 60.w,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 10.w),
                              child: SizedBox(
                                // height: 36.w,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      var item = e.cards[index];
                                      return Center(
                                        child: Container(
                                          width: 25.w,
                                          height: 36.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.cFFFFFF,
                                              borderRadius:
                                                  BorderRadius.circular(6.w),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: AppColors.c000000
                                                        .withOpacity(0.2),
                                                    offset:
                                                        const Offset(0, 0.5),
                                                    blurRadius: 1.5.w)
                                              ]),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                geCardtName(item.value),
                                                style: 12.w4(
                                                    color: getCardColor(
                                                        item.color),
                                                    height: 0.9),
                                              ),
                                              3.vGap,
                                              Image.asset(
                                                  getCardImage(item.color),
                                                  width: 14.w,
                                                  height: 14.w),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        5.hGap,
                                    itemCount: e.cards.length),
                              )),
                          Container(
                              height: 60.w,
                              alignment: Alignment.center,
                              child: Text(
                                "+${e.percent}%",
                                style: 12.w4(),
                              )),
                        ]);
                      }).toList())

                  // child: Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                  //   child: DataTable(
                  //     border: TableBorder.symmetric(
                  //         inside: BorderSide(color: AppColors.cE6E6E)),
                  //     columns: _colomns.map((e) {
                  //       return DataColumn(label: Text(e));
                  //     }).toList(),
                  //     rows: list.map((e) {
                  //       return DataRow(cells: [
                  //         DataCell(Text(e.name)),
                  //         DataCell(Text(e.name)),
                  //         DataCell(Text("+${e.percent}%")),
                  //       ]);
                  //     }).toList(),
                  //   ),
                  // ),
                  ),
            ),
          ],
        ),
      );
    });
  }
}

List<TacticGradeEntity> _list = [];
final _colomns = ["Pattern", "Example", "Preparation"];
final _colomnsWidth = [96.0, 177.0, 65.0];
final _ruleMap = [
  {
    "id": 1001,
    "name": "High Card",
    "cards": [],
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
    "name": "Three of a Kind",
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
    "name": "Four of a Kind",
    "cards": [
      {"color": 1, "value": 10},
      {"color": 4, "value": 10},
      {"color": 3, "value": 10},
      {"color": 2, "value": 10},
    ],
    "percent": 15,
  },
  {
    "id": 1009,
    "name": "Straight Flush",
    "cards": [
      {"color": 1, "value": 9},
      {"color": 1, "value": 10},
      {"color": 1, "value": 11},
      {"color": 1, "value": 12},
      {"color": 1, "value": 13},
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
