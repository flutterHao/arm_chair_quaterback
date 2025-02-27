import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/2/27/15:33

class StarUpgradeGameController extends GetxController {
  StarUpgradeGameController(this.playerUuid);

  final String playerUuid;

  List<String> propertyList = [
    "FGM",
    "3PM",
    "FTM",
    "PASS",
    "REB",
    "BLK",
    "STL",
    "TECH",
  ];

  int currentIndex = 7;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  /// 获取最大升星次数
  int getMaxStarTimes(){
    return 25;
  }

  /// 获取bonus 的下标列表
  List<int> getBonusList(){
    return [5,10,15,20,25];
  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
