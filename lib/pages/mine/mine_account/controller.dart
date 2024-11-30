import 'dart:io';

import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'index.dart';

class MineAccountController extends GetxController {
  MineAccountController();

  final state = MineAccountState();

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  WebSocketChannel? channel;
  testWebSocket() async {
    if(channel != null){
      print('testWebSocket---already start--');
      channel?.sink.add('ping'); // 发送心跳包
      print('testWebSocket---Sent: ping');
      return;
    }
    print('testWebSocket---start--');

    final wsUrl = Uri.parse('ws://192.168.12.46:9003');
    channel = WebSocketChannel.connect(wsUrl);

    await channel?.ready;
    print('testWebSocket---ready--');

    channel?.sink.add('ping'); // 发送心跳包
    print('testWebSocket---Sent: ping');

    channel?.stream.listen((message) {
      channel?.sink.add('received!');
      channel?.sink.close(WebSocketStatus.goingAway);
    },onError: (e){
      print('testWebSocket---onError--:$e');
    },onDone: (){
      print('testWebSocket---onDone--:');
    });
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
