import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/review_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/review_entity.g.dart';

@JsonSerializable()
class ReviewEntity {
	late int parentReviewId = 0;
	late String teamLogo = '';
	late String teamName = '';
	late bool isLike = false;
	late int targetId = 0;
	late int updateTime = 0;
	late int newsId = 0;
	late int createTime = 0;
	late int teamId = 0;
	late String context = '';
	late int sonReviews = 0;
	late int id = 0;
	late int likes = 0;

	ReviewEntity();

	factory ReviewEntity.fromJson(Map<String, dynamic> json) => $ReviewEntityFromJson(json);

	Map<String, dynamic> toJson() => $ReviewEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}