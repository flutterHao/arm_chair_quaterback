import 'package:arm_chair_quaterback/common/entities/config/game_constant_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:get/get.dart';

class SelectPlayerController extends GetxController {
  SelectPlayerController();
  RxInt selectIndex = 0.obs;
  GameConstantEntity? gameConstantEntity;
  RxList<String> playerList = RxList();
  _initData() async {
    await Future.wait([
      CacheApi.getGameConstant(),
      CacheApi.getNBATeamDefine(),
    ]);
    gameConstantEntity = Utils.getGameConstant(10023);
    if (gameConstantEntity != null) {
      playerList.value = gameConstantEntity!.constantValues;
    }
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
