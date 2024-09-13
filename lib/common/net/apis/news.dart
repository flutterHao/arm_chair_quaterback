import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_list.dart';
import 'package:arm_chair_quaterback/common/net/index.dart';

class NewsApi {
  static Future<NewsList> getNewsList() async {
    var json = await HttpUtil().get(Api.getNewsList);
    return NewsList.fromJson(json);
  }

  static Future<NewsDetail> getNewsDetail(String id) async {
    var json =
        await HttpUtil().get(Api.getNewsDetail, queryParameters: {"id": id});
    return NewsDetail.fromJson(json);
  }

  static Future<NewsDetail> newsLike(String id) async {
    var json = await HttpUtil().post(Api.newsLike, data: {"id": id});
    return NewsDetail.fromJson(json);
  }

  static Future<NewsDetail> newsUnLike(String id) async {
    var json = await HttpUtil().post(Api.newsUnLike, data: {"id": id});
    return NewsDetail.fromJson(json);
  }

  static Future<NewsDetail> sendReviews(
    String newsId,
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

  static Future<NewsDetail> deleteReviews(String id) async {
    var json = await HttpUtil().post(Api.deleteReviews, data: {"id": id});
    return NewsDetail.fromJson(json);
  }

  static Future<NewsDetail> likeReviews(String id) async {
    var json = await HttpUtil().post(Api.likeReviews, data: {"id": id});
    return NewsDetail.fromJson(json);
  }
}
