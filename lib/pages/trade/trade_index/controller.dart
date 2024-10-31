import 'package:arm_chair_quaterback/common/entities/trade_entity/trade_info_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/trade.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TradeIndexController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TradeIndexController();

  final RefreshController buyRefreshController = RefreshController();
  final RefreshController sellRefreshController = RefreshController();


  var loadStatus = LoadDataStatus.loading.obs;

  TradeInfoEntity? tradeInfoEntity;
  late List<TradeInfoTradePlayers> sellAllTradePlayers;

  late TabController tabController;
  List<String> tabs = ["Buy", "Sell"];

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    _initData();
  }

  _initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      TradeApi.getTradeInfo(),
      CacheApi.getNBAPlayerInfo(),
      TradeApi.getAllTeamPlayerByTrend(),
    ]).then((result) {
      tradeInfoEntity = result[0] as TradeInfoEntity;
      sellAllTradePlayers = result[2] as List<TradeInfoTradePlayers>;
      if (tradeInfoEntity!.tradePlayers.isEmpty) {
        loadStatus.value = LoadDataStatus.noData;
      }
      loadStatus.value = LoadDataStatus.success;
      buyRefreshController.refreshCompleted();
      sellRefreshController.refreshCompleted();

      update([idTradeIndexMain]);
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
      buyRefreshController.refreshCompleted();
      sellRefreshController.refreshCompleted();

    });
  }

  static get idTradeIndexMain => "id_trade_index_main";

  refreshData() {
    if (loadStatus.value == LoadDataStatus.loading) {
      buyRefreshController.refreshCompleted();
      sellRefreshController.refreshCompleted();

      return;
    }
    _initData();
  }

  sell(String uuid) async {
    EasyLoading.show();
    await TradeApi.sellPlayer(uuid).then((result) {
      refreshData();
      Get.find<HomeController>().refreshMoneyCoinWidget();
    }, onError: (e) {
      EasyLoading.showError("SERVER ERROR");
    });
    EasyLoading.dismiss();
  }

  buy(int playerId) async{
    EasyLoading.show();
    await TradeApi.buyPlayer(playerId).then((result) {
      refreshData();
      Get.find<HomeController>().refreshMoneyCoinWidget();
    }, onError: (e) {
      EasyLoading.showError("SERVER ERROR");
    });
    EasyLoading.dismiss();
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: AppColors.c262626,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text("${value.toInt()}", style: 10.w4(color: AppColors.cB3B3B3)),
    );
  }

  FlTitlesData get titlesData => const FlTitlesData(show: false);


  FlBorderData get borderData => FlBorderData(
        show: false,
      );

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
    tabController.dispose();
    buyRefreshController.dispose();
    sellRefreshController.dispose();

    super.dispose();
  }
}
