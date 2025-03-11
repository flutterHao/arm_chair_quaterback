/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-12 17:54:17
 * @LastEditTime: 2025-03-05 18:17:40
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-12 17:54:17
 * @LastEditTime: 2024-12-17 21:57:10
 */
import 'package:arm_chair_quaterback/common/entities/player_card_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/card_pack_info_entity.g.dart';
import 'dart:convert';
import 'package:get/get.dart';
export 'package:arm_chair_quaterback/generated/json/card_pack_info_entity.g.dart';

@JsonSerializable()
class CardPackInfoEntity {
  late int position = 1;
  late int rankIndex = 0;
  late int createTime = 0;
  late int teamId = 0;
  late int cardPackGrade = 0;
  late int freeGiftTime = 0;
  late int updateTime = 0;
  late List<CardPackInfoCard> card = [];
  late int freeGiftCount = 0;
  @JSONField(deserialize: false, serialize: false)
  RxString freeTimeString = "00:00:00".obs;

  CardPackInfoEntity();

  factory CardPackInfoEntity.fromJson(Map<String, dynamic> json) =>
      $CardPackInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $CardPackInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CardPackInfoCard {
  @JSONField(deserialize: false, serialize: false)
  int index = 0;
  int position = 1;
  late int cardId = 0;
  late int openTime = 0;

  /// 0:等待 1:倒计时 2:可打开
  late int status = 0;
  @JSONField(deserialize: false)
  late String totalTime = "";
  @JSONField(deserialize: false, serialize: false)
  late int totalTimeValue = 180;
  late RxString remainTime = "00:00".obs;
  @JSONField(deserialize: false)
  double progress = 0;
  @JSONField(deserialize: false, serialize: false)
  RxBool isOpen = false.obs;
  List<int> players = [];
  @JSONField(deserialize: false, serialize: false)
  List<PlayerCardEntity> playerCards = [];
  @JSONField(deserialize: false, serialize: false)
  bool isSimple = false;

  CardPackInfoCard({this.status = 0, this.position = 1});

  factory CardPackInfoCard.fromJson(Map<String, dynamic> json) {
    var entity = $CardPackInfoCardFromJson(json);
    entity.playerCards = entity.players
        .map((e) => PlayerCardEntity.fromJson({"playerId": e}))
        .toList();
    return entity;
  }

  Map<String, dynamic> toJson() => $CardPackInfoCardToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
