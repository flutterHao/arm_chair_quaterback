import 'package:arm_chair_quaterback/common/entities/news_banner.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';

class NewListState {
  // // title
  // final _title = "".obs;
  // set title(value) => _title.value = value;
  // get title => _title.value;

  List<NewsDetail> newsList = [];
  List<NewsBanner> banners = [];
  NewsDetail newsDetail = NewsDetail();

  NewListState() {
    ///Initialize variables
  }
}
