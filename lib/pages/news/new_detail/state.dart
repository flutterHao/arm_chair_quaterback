import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';

class NewDetailState {
  // title
  // final _title = "".obs;
  // set title(value) => _title.value = value;
  // get title => _title.value;
  // RxBool isLoading = true.obs;

  bool isLoading = true;
  NewsDetail newDetail = NewsDetail();
  List<NewsDetail> moreList = [];
}
