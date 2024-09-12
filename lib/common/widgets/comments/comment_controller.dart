import 'package:get/get.dart';

class CommentController extends GetxController {
  int total = 5;
  RxInt count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    count.value = (total < 3 ? total : 3);
  }
}
