/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 17:28:14
 * @LastEditTime: 2024-11-19 12:06:51
 */
import 'package:arm_chair_quaterback/common/entities/news_banner.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/reviews.dart';

import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/receive_prop_entity.dart';
import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';
import 'package:arm_chair_quaterback/common/net/index.dart';
import 'package:arm_chair_quaterback/common/utils/image_ext.dart';
import 'package:common_utils/common_utils.dart';
import 'package:extended_image/extended_image.dart';
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
    return NewsListDetail.fromJson(json["newsContent"]);
  }

  static Future<bool> newsLike(int id) async {
    var json = await HttpUtil().post(Api.newsLike, data: {"newsId": id});
    return json["isSuccess"];
  }

  static Future<bool> newsUnLike(int id) async {
    var json = await HttpUtil().post(Api.newsUnLike, data: {"newsId": id});
    return json["isSuccess"];
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

  static Future<List<StarsTeamRank>> starTeamList(
      {required String seasonId, required String seasonType}) async {
    List list = await HttpUtil().post(Api.teamStatRank,
        data: {"seasonId": seasonId, "seasonType": seasonType});
    return list.map((e) => StarsTeamRank.fromJson(e)).toList();
  }

  static Future<List<TeamRankEntity>> getTeamList(
      {required String seasonId, required String seasonType}) async {
    List list = await HttpUtil().post(Api.teamRank,
        data: {"seasonId": seasonId, "seasonType": seasonType});
    return list.map((e) => TeamRankEntity.fromJson(e)).toList();
  }

  static Future<List<NbaPlayerStat>> startRank(
      {required String season,
      required String statType,
      String seasonType = "Regular%20Season"}) async {
    List list = await HttpUtil().post(Api.playerStats, data: {
      "season": season,
      "statType": statType,
      "seasonType": seasonType,
    });
    return list
        .map((e) => NbaPlayerStat.fromJson(e as Map<String, dynamic>))
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
      var newsDetail = NewsListDetail.fromJson(e);
      if (ObjectUtil.isNotEmpty(newsDetail.imgUrl)) {
        final ExtendedNetworkImageProvider provider =
            ExtendedNetworkImageProvider(newsDetail.imgUrl);
        provider.getImageSize().then((size) {
          if (size != null) {
            if (size.width > 250.w) {
              newsDetail.type = 1;
              newsDetail.imageHeight = size.height / size.width * 343.w;
            } else {
              if (newsDetail.imgUrl.contains(".gif")) {
                newsDetail.type = 1;
              } else {
                newsDetail.type = size.width > size.height ? 2 : 3;
                newsDetail.imamgeWidth = size.width / size.height * 97.w;
              }
            }
          }
        });
      }
      return newsDetail;
    }).toList();
    return Future.wait(details);
  }

  static Future<List<Reviews>> getReviewsByNewsId(
      newsId, int page, int limit) async {
    List list = await HttpUtil().post(Api.getReviewsByNewsId,
        data: {"newsId": newsId, "page": page, "limit": limit});
    return list.map((e) => Reviews.fromJson(e)).toList();
  }

  static Future<List<Reviews>> getSonReviews(
      newsId, int reviewId, int page, int limit) async {
    List list = await HttpUtil().post(Api.getSonReviews, data: {
      "newsId": newsId,
      "reviewId": reviewId,
      "page": page,
      "limit": limit
    });
    return list.map((e) => Reviews.fromJson(e)).toList();
  }
}
