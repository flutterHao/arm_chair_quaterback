import 'package:get/get.dart';

import 'index.dart';

class NewListController extends GetxController {
  NewListController();

  final state = NewListState();

  final List<String> images = [
    'https://via.placeholder.com/343x150.png?text=Banner+1',
    'https://via.placeholder.com/343x150.png?text=Banner+2',
    'https://via.placeholder.com/343x150.png?text=Banner+3',
  ];

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
