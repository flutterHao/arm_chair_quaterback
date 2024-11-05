import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/news_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/news_entity.g.dart';

@JsonSerializable()
class NewsEntity {
  @JSONField(name: "Trade")
  late List<NewsDetail> trade = [];
  @JSONField(name: "Draft")
  late List<NewsDetail> draft = [];
  late Map<String, NewsDetail> teamRumors = {};
  late List<NewsDetail> match = [];
  // late NewsTeamNews teamNews;
  late Map<String, NewsDetail> playerRumors = {};
  @JSONField(name: "Latest")
  late List<NewsDetail> latest = [];
  late Map<String, List<NewsDetail>> playerNews;
  @JSONField(name: "Injuries")
  late List<NewsDetail> injuries = [];

  NewsEntity();

  factory NewsEntity.fromJson(Map<String, dynamic> json) =>
      $NewsEntityFromJson(json);

  Map<String, dynamic> toJson() => $NewsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
