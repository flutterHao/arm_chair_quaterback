import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/card_pack_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_card_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/low_resources_bottomsheet.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';

import 'package:arm_chair_quaterback/pages/team/team_index/open_box_simple/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OpenBoxSimpleController extends GetxController
    with GetTickerProviderStateMixin {
  OpenBoxSimpleController();

  final runSpacing = 10.w;
  final cardWidth = 98.w + 6.w;
  final cardHeight = 136.w + 6.w;
  final maxRow = 3; // 假设每行最多3个卡片

  CardPackInfoCard currentCardPack = CardPackInfoCard();

  CardPackInfoEntity cardPackInfo = CardPackInfoEntity();
  bool recieved = false;

  //step:0 开宝箱 1选卡 2 展示选中的卡牌 3 展示所有,
  int step = 0;
  int selectIndex = -1;

  //背景入场动画
  RxBool showCollect = false.obs;

  // bool isOpen = false; //防止重复点击
  bool isStartting = false;
  var showClick = false.obs;
  bool isOpen = false;

  late AnimationController boxAniCtrl;
  late AnimationController fallOutAnimatedCtrl;
  late Animation<double> fallOutAnimation;

  @override
  void onInit() {
    super.onInit();

    fallOutAnimatedCtrl = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fallOutAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: fallOutAnimatedCtrl,
        curve: Curves.bounceOut,
      ),
    );
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   // initData();
  // }

  Future toOpenBoxPage(int playerId) async {
    showCollect.value = false;
    showClick.value = false;

    CardPackInfoCard item = CardPackInfoCard();
    item.playerCards = [PlayerCardEntity(playerId: playerId)];
    isStartting = false;
    step = 0;
    for (var e in item.playerCards) {
      e.isOpen.value = false;
      e.isSelect.value = false;
    }
    setCardPosition(Get.context!, 0);
    currentCardPack = item;
    selectIndex = 0;
    fallOutAnimatedCtrl.reset();

    await Get.to(() => const OpenBoxSimplePage(),
        opaque: false, transition: Transition.fadeIn);

    ///判断球员位置ovr是否大于当前值
    TeamController teamCtrl = Get.find();
    teamCtrl.ovrChange = 0;
    teamCtrl.playerIdOld = 0;
    teamCtrl.showChangeAnimated.value = false;
    teamCtrl.playerIdNew = playerId;
    var teamPlayers = teamCtrl.myTeamEntity.teamPlayers;
    var lineList = teamPlayers.where((e) => e.position > 0).toList();
    var subList = teamPlayers.where((e) => e.position == 0).toList();
    // teamCtrl.
    var newNbaInfo = Utils.getPlayBaseInfo(playerId);

    ///找出ovr最小的球员
    for (var myPlayer in lineList) {
      var oldNbaInfo = Utils.getPlayBaseInfo(myPlayer.playerId);
      String position = Utils.getPosition(myPlayer.position);
      //新的球员ovr大于队伍中的球员
      if (newNbaInfo.position.contains(position)) {
        if (newNbaInfo.playerScore > oldNbaInfo.playerScore) {
          teamCtrl.playerIdOld = myPlayer.playerId;
          teamCtrl.ovrChange = newNbaInfo.playerScore - oldNbaInfo.playerScore;
          break;
        }
      }
    }
    //如果没有找到，从替补中找
    if (teamCtrl.playerIdOld == 0) {
      for (var myPlayer in subList) {
        var oldNbaInfo = Utils.getPlayBaseInfo(myPlayer.playerId);
        var positions = oldNbaInfo.position.split("/");

        bool isPositionMatch(String position) =>
            newNbaInfo.position.contains(position);
        bool isScoreHigher() => newNbaInfo.playerScore > oldNbaInfo.playerScore;

        if (positions.any(isPositionMatch) && isScoreHigher()) {
          teamCtrl.playerIdOld = myPlayer.playerId;
          teamCtrl.ovrChange = newNbaInfo.playerScore - oldNbaInfo.playerScore;
          break;
        }
      }
    }
    teamCtrl.showExChange = teamCtrl.playerIdOld != 0;
    teamCtrl.update();
  }

  Future clickkBox() async {
    //如果只有一张牌跳过第一步选牌
    showCollect.value = false;
    step = 2;
    update(["open_box_simple"]);
    await Future.delayed(const Duration(milliseconds: 300));
    var player = currentCardPack.playerCards.first;
    player.isOpen.value = true;
    player.isSelect.value = true;
    update(["open_box_simple"]);
    await Future.delayed(const Duration(milliseconds: 500)).then((v) {
      showCollect.value = true;
      update(["open_box_simple"]);
    });

    update(["open_box_simple"]);
    setCardPosition(Get.context!, 1, duration: 10);
  }

  //type=0;合拢 初始化, 1分散卡牌
  Future setCardPosition(BuildContext ctx, int type,
      {int duration = 80}) async {
    if (type == 0) {
      double cneterX = (MediaQuery.of(ctx).size.width - cardWidth) / 2 - 44.5.w;
      double centerY = (cardHeight + runSpacing) / 2;
      for (var e in currentCardPack.playerCards) {
        e.offset.value = Offset(cneterX, centerY);
      }
    } else {
      int lenght = currentCardPack.playerCards.length;

      if (currentCardPack.playerCards.length > 3) {
        //第一行
        double totalWidth =
            (cardWidth * maxRow) + (runSpacing * (maxRow - 1)) + 89.w;
        double startX = (MediaQuery.of(ctx).size.width - totalWidth) / 2;
        //第二行
        double totalWidth1 =
            (cardWidth * (lenght - 3)) + (runSpacing * (lenght - 4)) + 89.w;
        double startX1 = (MediaQuery.of(ctx).size.width - totalWidth1) / 2;
        for (int i = 0; i < lenght; i++) {
          double dx = 0;
          if (i < 3) {
            dx = startX + (i % maxRow) * (cardWidth + runSpacing);
          } else {
            dx = startX1 + (i - 3) * (cardWidth + runSpacing);
          }
          double dy = (i ~/ maxRow) * (cardHeight + 15.w) + 20.w;
          currentCardPack.playerCards[i].offset.value = Offset(dx, dy);
          await Future.delayed(Duration(milliseconds: duration));
        }
      } else {
        double totalWidth = (cardWidth * 2) + runSpacing + 89.w;
        double startX = (MediaQuery.of(ctx).size.width - totalWidth) / 2;
        //第二行
        double totalWidth1 = cardWidth + 89.w;
        double startX1 = (MediaQuery.of(ctx).size.width - totalWidth1) / 2;
        for (int i = 0; i < lenght; i++) {
          double dx = 0;
          if (i < 2) {
            dx = startX + (i % 2) * (cardWidth + runSpacing);
          } else {
            dx = startX1 + (i - 2) * (cardWidth + runSpacing);
          }
          double dy = (i ~/ 2) * (cardHeight + 15.w) + 20.w;
          currentCardPack.playerCards[i].offset.value = Offset(dx, dy);
          await Future.delayed(Duration(milliseconds: duration));
        }
      }
    }
  }

  //洗牌
  void shuffleCards(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    //翻转卡牌到背面
    for (var e in currentCardPack.playerCards) {
      e.isOpen.value = false;
      e.isSelect.value = false;
      await Future.delayed(const Duration(milliseconds: 300));
    }
    //聚拢卡牌
    await setCardPosition(context, 0);
    //洗牌
    await shuffleAnimation();
    currentCardPack.playerCards.shuffle();
    await Future.delayed(const Duration(milliseconds: 300));

    //发放卡牌
    await setCardPosition(context, 1);
    isStartting = true;
  }

  //洗牌
  Future shuffleAnimation() async {
    Random random = Random();
    int len = currentCardPack.playerCards.length;
    for (int i = 0; i <= 15; i++) {
      int index = random.nextInt(len);
      var e = currentCardPack.playerCards[index];
      e.rotation.value = 0.05;
      await Future.delayed(Duration(milliseconds: len > 3 ? 80 : 120))
          .then((v) {
        // 将当前卡片移到卡组末尾
        currentCardPack.playerCards
            .sort((a, b) => a.rotation.value.compareTo(b.rotation.value));
        update(["open_box_simple"]);
      });
    }
  }

  //one more，返回到第一步
  Future oneMore(int coinNum) async {
    if (coinNum >
        HomeController.to.userEntiry.teamLoginInfo!.getCoin().toInt()) {
      LowResourcesBottomsheet.show(ResourceType.coins);
      return;
    }
    step = 1;
    update(["open_box_simple"]);
  }

  //确定该卡,翻开所有卡结束
  Future gotIt() async {
    step = 4;
    update(["open_box_simple"]);
    for (var e in currentCardPack.playerCards) {
      await Future.delayed(const Duration(milliseconds: 100));
      e.isOpen.value = true;
    }
  }

  Future buyCardPack() async {
    await TeamApi.buyCardPack().then((v) async {
      HomeController.to.updateMoney();
      OpenBoxSimpleController controller = Get.find();
      await controller.toOpenBoxPage(v.playerId);
      TeamController teamCtrl = Get.find();
      teamCtrl.getBagPlayers();
    });
  }
}
