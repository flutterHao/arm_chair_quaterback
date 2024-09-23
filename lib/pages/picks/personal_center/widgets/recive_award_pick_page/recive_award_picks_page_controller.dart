import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/23/21:02
class ReciveAwardPicksPageController extends GetxController{

  List<List<ReciveAwardEntity>> guessHistoryList = [];

  NewsDefineEntity? newsDefineEntity;

  @override
  void onInit() {
    super.onInit();
    _initData();
    PicksApi.getNewsDefine().then((result) {
      newsDefineEntity = result;
    });
  }

  void _initData() {
    PicksApi.getGuessInfos().then((result) {
      /// 剔除status为1（未开奖）的数据项
      guessHistoryList = result;
      update();
    });
  }
}