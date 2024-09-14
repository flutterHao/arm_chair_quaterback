/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 17:28:14
 * @LastEditTime: 2024-09-14 12:42:00
 */
import 'package:arm_chair_quaterback/common/entities/news_banner.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_list.dart';
import 'package:arm_chair_quaterback/common/net/index.dart';

class NewsApi {
  static Future<List<NewsBanner>> getNewsBanner() async {
    List list = await HttpUtil().get(Api.getNewsBanner);
    return list.map((e) => NewsBanner.fromJson(e)).toList();
  }

  static Future<NewsList> getNewsList() async {
    var json = await HttpUtil().post(Api.getNewsList);
    return NewsList.fromJson(json);
  }

  static Future<NewsDetail> getNewsDetail(int id) async {
    var json =
        await HttpUtil().post(Api.getNewsDetail, queryParameters: {"id": id});
    return NewsDetail.fromJson(json);
  }

  static Future<NewsDetail> newsLike(int id) async {
    var json = await HttpUtil().post(Api.newsLike, data: {"newsId": id});
    return NewsDetail.fromJson(json);
  }

  static Future<NewsDetail> newsUnLike(int id) async {
    var json = await HttpUtil().post(Api.newsUnLike, data: {"newsId": id});
    return NewsDetail.fromJson(json);
  }

  static Future<NewsDetail> sendReviews(
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
    return NewsDetail.fromJson(json);
  }

  static Future<NewsDetail> deleteReviews(int id, int reviewsId) async {
    var json = await HttpUtil()
        .post(Api.deleteReviews, data: {"newsId": id, "reviewsId": reviewsId});
    return NewsDetail.fromJson(json);
  }

  static Future<NewsDetail> likeReviews(int id, int reviewsId) async {
    var json = await HttpUtil()
        .post(Api.likeReviews, data: {"newsId": id, "reviewsId": reviewsId});
    return NewsDetail.fromJson(json);
  }
}
