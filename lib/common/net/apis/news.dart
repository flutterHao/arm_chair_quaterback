/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 17:28:14
 * @LastEditTime: 2024-09-20 12:14:38
 */
import 'package:arm_chair_quaterback/common/entities/news_banner.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/reviews.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_list.dart';
import 'package:arm_chair_quaterback/common/entities/stats_rank/stats_rank.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank.dart';
import 'package:arm_chair_quaterback/common/net/index.dart';

class NewsApi {
  static Future<List<NewsBanner>> getNewsBanner() async {
    List list = await HttpUtil().get(Api.cNewsBanner);
    List<NewsBanner> banners = list.map((e) => NewsBanner.fromJson(e)).toList();
    return banners;
  }

  static Future<NewsList> getNewsList() async {
    var json = await HttpUtil().post(Api.getNewsList);
    return NewsList.fromJson(json);
  }

  static Future<NewsDetail> getNewsDetail(id) async {
    var json = await HttpUtil().post(Api.getNewsDetail, data: {"newsId": id});
    return NewsDetail.fromJson(json["newsContent"]);
  }

  static Future<NewsDetail> newsLike(int id) async {
    var json = await HttpUtil().post(Api.newsLike, data: {"newsId": id});
    return NewsDetail.fromJson(json["newsContent"]);
  }

  static Future<NewsDetail> newsUnLike(int id) async {
    var json = await HttpUtil().post(Api.newsUnLike, data: {"newsId": id});
    return NewsDetail.fromJson(json["newsContent"]);
  }

  static Future<Reviews> sendReviews(
    int newsId,
    String content, {
    int targetId = 0,
    int parentReviewId = 0,
  }) async {
    var json = await HttpUtil().post(Api.sendReviews, data: {
      "newsId": newsId,
      "context": content,
      "targetId": targetId,
      "parentReviewId": parentReviewId
    });
    return Reviews.fromJson(json);
  }

  static Future<NewsDetail> deleteReviews(int id, int reviewsId) async {
    var json = await HttpUtil()
        .post(Api.deleteReviews, data: {"newsId": id, "reviewsId": reviewsId});
    return NewsDetail.fromJson(json);
  }

  static Future<NewsDetail> likeReviews(int newsId, int reviewsId) async {
    var json = await HttpUtil().post(Api.likeReviews,
        data: {"newsId": newsId, "reviewsId": reviewsId});
    return NewsDetail.fromJson(json);
  }

  static Future<TeamRank> teamRank({int page = 0, int pageSize = 30}) async {
    var json = await HttpUtil()
        .post(Api.teamRank, data: {"page": page, "pageSize": pageSize});
    return TeamRank.fromJson(json);
  }

  static Future<StatsRank> startRank(
      {required String season,
      required String statType,
      String seasonType = "Regular"}) async {
    var json = await HttpUtil().post(Api.playerStats, data: {
      "season": season,
      "statType": statType,
      "seasonType": seasonType,
    });
    return StatsRank.fromJson(json["rankInfo"]);
  }
}
