import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/news_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/news_entity.g.dart';

@JsonSerializable()
class NewsEntity {
  @JSONField(name: "Trade")
  late List<NewsListDetail> trade = [];
  @JSONField(name: "Draft")
  late List<NewsListDetail> draft = [];
  late Map<String, NewsListDetail> teamRumors = {};
  late List<NewsListDetail> match = [];
  // late NewsTeamNews teamNews;
  late Map<String, NewsListDetail> playerRumors = {};
  @JSONField(name: "Latest")
  late List<NewsListDetail> latest = [];
  late Map<String, List<NewsListDetail>> playerNews;
  @JSONField(name: "Injuries")
  late List<NewsListDetail> injuries = [];

  NewsEntity();

  factory NewsEntity.fromJson(Map<String, dynamic> json) =>
      $NewsEntityFromJson(json);

  Map<String, dynamic> toJson() => $NewsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
