import 'package:arm_chair_quaterback/common/entities/chart_sample_data.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class SummaryController extends GetxController {
  SummaryController(this.playerId);
  final int playerId;


  var currentIndex = 0.obs;

  var loadStatus = LoadDataStatus.loading.obs;

  NbaPlayerBaseInfoEntity? nbaPlayerBaseInfoEntity;

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    initData();
  }

  initData(){
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      PicksApi.getNBAPlayerBaseInfo(playerId),
    ]).then((result){
      nbaPlayerBaseInfoEntity = result[0];
      loadStatus.value = LoadDataStatus.noData;

      loadStatus.value = LoadDataStatus.success;

    },onError: (e){
      loadStatus.value = LoadDataStatus.error;

    });
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  List<LineSeries<ChartSampleData, num>> getDefaultLineSeries() {
    return <LineSeries<ChartSampleData, num>>[
      LineSeries<ChartSampleData, num>(
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 1, y: 50,),
            ChartSampleData(x: 2, y: 40),
            ChartSampleData(x: 3, y: 10),
            ChartSampleData(x: 4, y: 40),
            ChartSampleData(x: 5, y: 45),
            ChartSampleData(x: 6, y: 25),
            ChartSampleData(x: 7, y: 43),
            ChartSampleData(x: 8, y: 10,),
            ChartSampleData(x: 9, y: 40),
            ChartSampleData(x: 10, y: 45),
            ChartSampleData(x: 11, y: 60),
            ChartSampleData(x: 12, y: 45),
            ChartSampleData(x: 13, y: 25),
            ChartSampleData(x: 14, y: 70)
          ],
          width: 1,
          xValueMapper: (ChartSampleData sales, _) => sales.x,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          color: Colors.black,
          pointColorMapper: (ChartSampleData sales, _) => sales.x%2==0?Colors.red:Colors.green,
          markerSettings: const MarkerSettings(isVisible: true,height: 3,width: 3,borderWidth: 5)),
    ];
  }


  List<ColumnSeries<ChartSampleData, String>> getDefaultColumnSeries() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        spacing: 0.8,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.w)),
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Sep 15\nvs das', y: 28.5,pointColor: AppColors.cFF7954),
          ChartSampleData(x: 'Sep 19\nvs  phx', y: 20,pointColor: AppColors.cD9D9D9),
          ChartSampleData(x: 'Sep 29\nvs  lal', y: 22,pointColor: AppColors.cD9D9D9),
          ChartSampleData(x: 'Oct 05\nvs  sac', y: 38.5,pointColor: AppColors.cFF7954),
          ChartSampleData(x: 'Oct 14\nvs orl', y: 33,pointColor: AppColors.cFF7954),
        ],
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        pointColorMapper: (ChartSampleData sales, _) => sales.pointColor,
        dataLabelSettings:  DataLabelSettings(
            isVisible: true, textStyle: 10.w7(color: AppColors.c262626)),
      )
    ];
  }
}
