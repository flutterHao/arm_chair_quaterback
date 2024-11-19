import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/pages/league/controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///
///@auther gejiahui
///created at 2024/11/19/11:54

class ScorePageController extends GetxController{

  late RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
    Get.find<LeagueController>().loadStatus.listen((v){
      print('------:$v');
      if(v != LoadDataStatus.loading){

        print('------ttt---${this.toString()}');
        refreshController.refreshCompleted();
      }
    });
  }
}