/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-15 17:48:12
 * @LastEditTime: 2024-11-22 11:24:42
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/review_entity.g.dart';
import 'dart:convert';

import 'package:get/get.dart';
export 'package:arm_chair_quaterback/generated/json/review_entity.g.dart';

@JsonSerializable()
class ReviewEntity {
  late int parentReviewId = 0;
  late String teamLogo = '';
  late String teamName = '';
  // late bool isLike = false;
  late int targetId = 0;
  late int updateTime = 0;
  late int newsId = 0;
  late int createTime = 0;
  late int teamId = 0;
  late String context = '';
  late int sonReviews = 0;
  late int id = 0;
  @JSONField(deserialize: false, serialize: false)
  late RxInt likes = 0.obs;
  @JSONField(deserialize: false, serialize: false)
  late RxBool isLike = false.obs;
  List<ReviewEntity> subList = [];
  @JSONField(deserialize: false, serialize: false)
  int page = 0;
  @JSONField(deserialize: false, serialize: false)
  int size = 10;
  @JSONField(deserialize: false, serialize: false)
  int current = 0;

  ReviewEntity();

  factory ReviewEntity.fromJson(Map<String, dynamic> json) {
    ReviewEntity data = $ReviewEntityFromJson(json);
    bool v = (json['isLike'] == 1 || json['isLike'] == true) ? true : false;
    data.isLike.value = v;
    data.likes.value = json['likes'] ?? 0;
    return data;
  }

  Map<String, dynamic> toJson() => $ReviewEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
