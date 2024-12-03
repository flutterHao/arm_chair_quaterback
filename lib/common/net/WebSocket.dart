import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:arm_chair_quaterback/common/entities/web_socket/web_socket_entity.dart';
import 'package:arm_chair_quaterback/common/net/index.dart';
import 'package:arm_chair_quaterback/common/store/config.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

///
///@auther gejiahui
///created at 2024/11/30/18:57

class WSInstance {
  static WebSocketChannel? _channel;
  static int _msgCounter = 1;
  static bool _isClosed = false; // 标记手动关闭
  static Timer? _reconnectTimer; // 重连定时器

  static Timer? _pingTimer; // 心跳定时器
  static DateTime? _lastPongTime; // 记录最后一次收到 pong 的时间
  static final _streamController =
      StreamController<ResponseMessage>.broadcast();

  WSInstance._();

  static init() async {
    if (_channel != null) {
      print('WebSocket--already start--');
      return;
    }
    print('WebSocket--start--');
    final wsUrl = Uri.parse(_getUrl);
    _channel = WebSocketChannel.connect(wsUrl);

    _startPingTimer();

    await _channel?.ready;
    print('WebSocket--ready--');
    _auth();
    _reconnectTimer?.cancel();
    _lastPongTime = DateTime.now();

    _channel?.stream
        .listen(_onMessageReceive, onError: _onError, onDone: _onDone);
  }

  static void _auth() {
    auth(
        Get.find<HomeController>().userEntiry.teamLoginInfo?.team?.teamId ?? 0);
  }

  // 启动心跳定时器
  static void _startPingTimer() {
    return;
    _pingTimer?.cancel();
    _pingTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if(_reconnectTimer?.isActive == false){
        //正在重连
        return;
      }
      // 每 10 秒发送一个 ping 消息
      // print('发送 ping');
      ping();

      // 检查是否超时
      if (_lastPongTime != null &&
          DateTime.now().difference(_lastPongTime!).inSeconds > 15) {
        print('没有收到 pong 响应，尝试重连');
        close(); // 如果 15 秒内没有收到 pong，则认为连接断开，进行重连
        _reconnect();
      }
    });
  }

  static void _onDone() {
    if (!_isClosed) {
      print('WebSocket 连接意外关闭');
      close();
      _reconnect();
    }
  }

  static _onError(e) {
    print('WebSocket--onError--:$e');
    _streamController.sink.addError(e);
  }

  static void _onMessageReceive(message) {
    // print('WebSocket--message--:$message');
    var result = _decoder(message);
    if (result.serviceId == Api.wsHeartBeat) {
      // print('WebSocket--result--TeamService.heartBeat');
      _lastPongTime = DateTime.now();
    } else {
      print('WebSocket--result--:$result');
      // log('result.serviceId--:${result.payload}');
      _streamController.sink.add(result);
    }
  }

  // 手动关闭连接
  static close() {
    _isClosed = true;
    _pingTimer?.cancel();
    _reconnectTimer?.cancel(); // 停止重连
    _channel?.sink.close();
    _channel = null;
  }

  // 重连逻辑
  static void _reconnect() {
    print('尝试重新连接...');
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 5), init); // 每 5 秒尝试重连
  }

  void setUrl(String url) {
    ConfigStore.to.setWsServiceUrl(url);
  }

  static String get _getUrl {
    String url = ConfigStore.to.getWsServiceUrl();
    return url;
  }

  static Stream<ResponseMessage> get stream => _streamController.stream;

  static void _sendMessage(dynamic message, {String path = ""}) {
    if (path != Api.wsHeartBeat) {
      print('WebSocket--message:$message');
      log('WebSocket--path:$path');
    }
    // print('WebSocket--_msgCounter:$_msgCounter');
    var byteData = WebSocketDataHandler.encoder(
        RequestMessage(path: path, json: message, msgCounter: _msgCounter++));
    // print('byteData:$byteData');
    _channel?.sink.add(byteData);
  }

  static ResponseMessage _decoder(Uint8List message) {
    ByteBuf buf = ByteBuf(16);
    buf.writeArrayBuffer(message, 4, message.length - 4);
    var responseMessage = WebSocketDataHandler.decode(
        ByteBuf.fromList(buf.getBytes()), buf.length);
    return responseMessage;
  }

  static void auth(int teamId) {
    WSInstance._sendMessage(teamId, path: Api.wsAuthAccount);
  }

  static void ping() {
    WSInstance._sendMessage("ping", path: Api.wsHeartBeat);
  }

  static Stream<ResponseMessage> teamMatch() {
    WSInstance._sendMessage("", path: Api.wsTeamMatch);
    return stream;
  }
}
