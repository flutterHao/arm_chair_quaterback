/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 17:28:14
 * @LastEditTime: 2025-03-13 10:59:22
 */
import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nab_player_season_game_rank_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_banner.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_stats_entity.dart';
import 'package:arm_chair_quaterback/common/entities/receive_prop_entity.dart';
import 'package:arm_chair_quaterback/common/entities/review_entity.dart';
import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';
import 'package:arm_chair_quaterback/common/net/index.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsApi {
  static Future<List<NewsBanner>> getNewsBanner() async {
    List list = await HttpUtil().get(Api.cNewsBanner);
    List<NewsBanner> banners = list.map((e) => NewsBanner.fromJson(e)).toList();
    return banners;
  }

  static Future<NewsListEntity> getNewsList() async {
    var json =
        await HttpUtil().post(Api.getNewsList, data: {"page": 0, "size": 7});
    return NewsListEntity.fromJson(json);
  }

  static Future<NewsListDetail> getNewsDetail(id) async {
    var json = await HttpUtil().post(Api.getNewsDetail, data: {"newsId": id});
    return NewsListDetail.fromJson(json);
  }

  static Future<bool> newsLike(int id) async {
    var json = await HttpUtil().post(Api.newsLike, data: {"newsId": id});
    return json["isSuccess"];
  }

  static Future<bool> newsUnLike(int id) async {
    var json = await HttpUtil().post(Api.newsUnLike, data: {"newsId": id});
    return json["isSuccess"];
  }

  static Future<ReviewEntity> sendReviews(
    NewsListDetail item,
    String content, {
    int targetId = 0,
    int parentReviewId = 0,
  }) async {
    var json = await HttpUtil().post(Api.sendReviews, data: {
      "newsId": item.id,
      "context": content,
      "targetId": targetId,
      "parentReviewId": parentReviewId
    });
    return ReviewEntity.fromJson(json);
  }

  static Future<NewsListDetail> deleteReviews(int id, int reviewsId) async {
    var json = await HttpUtil()
        .post(Api.deleteReviews, data: {"newsId": id, "reviewsId": reviewsId});
    return NewsListDetail.fromJson(json);
  }

  static Future<NewsListDetail> likeReviews(
      int newsId, int reviewsId, bool isLike) async {
    var json = await HttpUtil().post(Api.likeReviews,
        data: {"newsId": newsId, "reviewsId": reviewsId, "isLike": isLike});
    return NewsListDetail.fromJson(json);
  }

  static Future<List<StatsEntity>> statTeamList(
      {String seasonId = "2024-25",
      String seasonType = "Regular%20Season"}) async {
    List list = await HttpUtil().post(Api.statTeamRank,
        data: {"seasonId": seasonId, "seasonType": seasonType});
    return list.map((e) => StatsEntity.fromJson(e)).toList();
  }

  static Future<List<TeamRankEntity>> getTeamList(
      {String seasonId = "2024-25",
      String seasonType = "Regular%20Season"}) async {
    List list = await HttpUtil().post(Api.teamRank,
        data: {"seasonId": seasonId, "seasonType": seasonType});
    return list.map((e) => TeamRankEntity.fromJson(e)).toList();
  }

  static Future<List<TeamRankEntity>> getTeamListNew(int type) async {
    String typeStr = type == 1 ? "conf" : "div";
    List list = await HttpUtil().post(Api.teamRank, data: {"groupBy": typeStr});
    return list.map((e) => TeamRankEntity.fromJson(e)).toList();
  }

  static Future<List<StatsEntity>> startRank(
      {String season = "2024-25",
      String statType = "PTS",
      String seasonType = "Regular%20Season"}) async {
    List list = await HttpUtil().post(Api.playerStats, data: {
      "season": season,
      "statType": statType,
      "seasonType": seasonType,
      "perMode": "PerGame"
    });
    return list
        .map((e) => StatsEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static Future<ReceivePropEntity?> getAward() async {
    var json = await HttpUtil().post(Api.getAward);
    if (json == null) return null;
    return ReceivePropEntity.fromJson(json);
  }

  static Future<List<NewsListDetail>> newsFlow(int page, int limit) async {
    List list = await HttpUtil()
        .post(Api.newsFlow, data: {"page": page, "limit": limit});
    var details = list.map((e) async {
      var item = NewsListDetail.fromJson(e);
      getImageWith(item);
      return item;
    }).toList();
    return Future.wait(details);
  }

  static Future<List<NewsListDetail>> getPlayerNews(int playerId, int page,
      {int limit = 10}) async {
    List list = await HttpUtil().post(Api.getPlayerNews,
        data: {"playerId": playerId, "page": page, "limit": limit});
    var details = list.map((e) async {
      var item = NewsListDetail.fromJson(e);
      getImageWith(item);
      return item;
    }).toList();
    return Future.wait(details);
  }

  static void getImageWith(NewsListDetail item) {
    if (ObjectUtil.isNotEmpty(item.imgUrl)) {
      final uri = Uri.parse(item.imgUrl);
      double? h = double.tryParse(uri.queryParameters["height"] ?? '');
      double? w = double.tryParse(uri.queryParameters["width"] ?? '');
      if (ObjectUtil.isNotEmpty(h) && ObjectUtil.isNotEmpty(w)) {
        if (w! > 250.w) {
          item.type = 1;
          item.imageHeight = h! / w * 343.w;
        } else {
          if (item.imgUrl.contains(".gif")) {
            item.type = 1;
          } else {
            item.type = w > h! ? 2 : 3;
            item.imamgeWidth = w / h * 97.w;
          }
        }
      }
    } else {
      item.type = 0;
    }
  }

  static Future<List<NewsListDetail>> getRelevantNews(int newsId) async {
    List list =
        await HttpUtil().post(Api.getRelevantNews, data: {"newsId": newsId});
    var details = list.map((e) {
      var item = NewsListDetail.fromJson(e);
      getImageWith(item);
      return item;
    }).toList();
    return details;
  }

  static Future<List<ReviewEntity>> getReviewsByNewsId(
      newsId, int page, int limit) async {
    List list = await HttpUtil().post(Api.getReviewsByNewsId,
        data: {"newsId": newsId, "page": page, "limit": limit});
    return list.map((e) => ReviewEntity.fromJson(e)).toList();
  }

  static Future<List<ReviewEntity>> getSonReviews(
      newsId, int reviewId, int page, int limit) async {
    List list = await HttpUtil().post(Api.getSonReviews, data: {
      "newsId": newsId,
      "reviewId": reviewId,
      "page": page,
      "limit": limit
    });
    return list.map((e) => ReviewEntity.fromJson(e)).toList();
  }

  /// 分享新闻
  static Future shareNews() async {
    await httpUtil.post(Api.shareNews);
  }

  static Future<Map<String, List<GuessGameInfoEntity>>> getNewsGuessInfo(
      int newsId) async {
    Map<String, dynamic> json =
        await HttpUtil().post(Api.getNewsGuessInfo, data: {"newsId": newsId});
    Map<String, List<GuessGameInfoEntity>> result = json.map((k, v) {
      return MapEntry(
          k, (v as List).map((e) => GuessGameInfoEntity.fromJson(e)).toList());
    });
    return result;
  }

/*
type 类型：1：新闻，2：评论，3：竞猜评论
targetId 目标id，如果是新闻或者新闻评论，则是新闻id
subgoal 子目标id，如果是新闻则是新闻id，如果是评论则是评论id
 */
  static Future<bool> sendEmoji(
    int type,
    int targetId,
    int subgoal,
    int emojiId,
  ) async {
    bool result = await httpUtil.post(Api.sendEmoji, data: {
      "type": type,
      "targetId": targetId,
      "subgoal": subgoal,
      "emojiId": emojiId
    });
    return result;
  }
}
