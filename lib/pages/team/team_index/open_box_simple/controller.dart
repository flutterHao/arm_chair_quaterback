import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/card_pack_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_data.dart';
import 'package:arm_chair_quaterback/common/entities/player_card_entity.dart';
import 'package:arm_chair_quaterback/common/entities/trade_entity/trade_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/net/apis/user.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/low_resources_bottomsheet.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';

import 'package:arm_chair_quaterback/pages/team/team_index/open_box/card_fly_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box_simple/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/entities/card_pack_player_entity.dart';

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
  RxBool showBackground1 = false.obs;
  RxBool showBackground2 = false.obs;
  RxBool showBackground3 = false.obs;
  Duration showBgDuration = const Duration(milliseconds: 200);
  RxBool showChangeText = false.obs;

  // bool isOpen = false; //防止重复点击
  bool loadDataSuccess = false;
  bool isLoading = true;
  bool isStartting = false;

  late StreamSubscription<int> subscription;
  late AnimationController fallOutAnimatedCtrl;
  late Animation<double> fallOutAnimation;

  var heartCountDownStr = "00:00:00".obs;
  CardPackPlayerEntity cardPackPlayerEntity = CardPackPlayerEntity();

  //获取球员
  // var getPlayerCount = 0.obs;
  // var showGetPlayerTip = false.obs;
  final overlayEntry = OverlayEntry(
    builder: (context) {
      return CardFlyWidget(duration: 800.milliseconds);
    },
  );

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

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Future toOpenBoxPage(int playerId) async {
    showBackground1.value = false;
    showBackground2.value = false;
    showBackground3.value = false;

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
    teamCtrl.showExChange = true;
    teamCtrl.update();
  }

  Future clickkBox() async {
    //如果只有一张牌跳过第一步选牌
    if (currentCardPack.playerCards.length == 1) {
      step = 2;
      var player = currentCardPack.playerCards.first;
      player.isSelect.value = true;
      update(["open_box_simple"]);
      await Future.delayed(const Duration(milliseconds: 500));

      showBigCard(player);
    } else {
      step = 1;
    }

    showChangeText.value = false;
    update(["open_box_simple"]);
    setCardPosition(Get.context!, 1, duration: 10);
    Future.delayed(1000.milliseconds).then((v) {
      showChangeText.value = true;
    });
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

  void selectCard(PlayerCardEntity player) async {
    if (!isStartting) return;
    if (step != 1 || player.isOpen.value) return;
    if (!player.isSelect.value) {
      // 如果还没有选择先选牌
      for (var element in currentCardPack.playerCards) {
        if (player.playerId == element.playerId) {
          player.isSelect.value = true;
          selectIndex = currentCardPack.playerCards.indexOf(element);
        } else {
          if (!element.isOpen.value) element.isSelect.value = false;
        }
      }
      update(["open_box_simple"]);
    } else {
      showBigCard(player);
    }
  }

  Future showBigCard(PlayerCardEntity card) async {
    update(["open_box_simple"]);
    showBackground1.value = true;
    await Future.delayed(showBgDuration);
    showBackground2.value = true;
    await Future.delayed(showBgDuration);
    showBackground3.value = true;
    step = 2;
    await Future.delayed(showBgDuration);
    await Future.delayed(showBgDuration);
    card.isOpen.value = true;
    update(["open_box_simple"]);
  }

  //展示打卡后继续
  void toContinue(
    BuildContext ctx,
  ) async {
    //下一步显示小卡或者one more
    if (step == 2) {
      if (currentCardPack.playerCards.length == 1) {
        await closeBigBox();
        back(ctx);
      } else {
        await closeBigBox();
        gotIt();
        update(["open_box_simple"]);
      }
    } else if (step == 4) {
      back(ctx);
    }
  }

  void back(context) {
    // TeamApi.closeCard(currentCardPack.index).then((v) {
    //   getBattleBox();
    //   IllustratiionsController ctrl = Get.find();
    //   ctrl.getPlayerCollectInfo();
    //   HomeController.to.updateMoney();
    // });

    Get.back();
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

  Future closeBigBox() async {
    showBackground1.value = false;
    await Future.delayed(showBgDuration);
    showBackground2.value = false;
    await Future.delayed(100.milliseconds);
    showBackground3.value = false;
    await Future.delayed(showBgDuration);
  }

  Future buyCardPack() async {
    await TeamApi.buyCardPack().then((v) async {
      HomeController.to.updateMoney();
      OpenBoxSimpleController controller = Get.find();
      await controller.toOpenBoxPage(v.playerId);
      cardPackPlayerEntity = v;
    });
  }
}

Map<String, int> _gradeMap = {
  "S+": 0,
  "S": 1,
  "S-": 2,
  "A+": 3,
  "A": 4,
  "A-": 5,
  "B+": 6,
  "B": 7,
  "B-": 8,
  "C+": 9,
  "C": 10,
  "C-": 11,
  "D+": 12,
  "D": 13,
  "D-": 14,
};
