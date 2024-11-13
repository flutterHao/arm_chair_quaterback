import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/guess_top_reviews_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/guess_top_reviews_entity.g.dart';

@JsonSerializable()
class GuessTopReviewsEntity {
	late int gameId;
	late int parentReviewId;
	late String teamLogo;
	late String teamName;
	late bool isLike;
	late int targetId;
	late int updateTime;
	late int createTime;
	late int teamId;
	late String context;
	late int sonReviews;
	late int id;
	late int likes;
	late int playerId;

	GuessTopReviewsEntity();

	factory GuessTopReviewsEntity.fromJson(Map<String, dynamic> json) => $GuessTopReviewsEntityFromJson(json);

	Map<String, dynamic> toJson() => $GuessTopReviewsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}