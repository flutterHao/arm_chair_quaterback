/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 17:35:51
 * @LastEditTime: 2024-09-13 17:40:56
 */
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';


class NewsList {
  List<NewsDetail>? nbaNewsList;

  NewsList({this.nbaNewsList});

  factory NewsList.fromJson(Map<String, dynamic> json) => NewsList(
        nbaNewsList: (json['nbaNewsList'] as List<dynamic>?)
            ?.map((e) => NewsDetail.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'nbaNewsList': nbaNewsList?.map((e) => e.toJson()).toList(),
      };
}
