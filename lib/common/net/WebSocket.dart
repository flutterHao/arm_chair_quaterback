import 'dart:async';
import 'dart:developer';
import 'dart:math';
import 'dart:typed_data';

import 'package:arm_chair_quaterback/common/entities/web_socket/web_socket_entity.dart';
import 'package:arm_chair_quaterback/common/net/address.dart';
import 'package:arm_chair_quaterback/common/net/index.dart';
import 'package:arm_chair_quaterback/common/store/config.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

///
///@auther gejiahui
///created at 2024/11/30/18:57

class WSInstance {
  static WebSocketChannel? _channel;
  static int _msgCounter = 1;
  static bool _ready = false;

  static Timer? _pingTimer; // 心跳定时器
  static DateTime _lastPongTime = DateTime.now(); // 记录最后一次收到 pong 的时间
  static final _streamController =
      StreamController<ResponseMessage>.broadcast();

  /// 用来当作网络状态监听器,只有连上服务器才会有通知，断开是没有通知的
  static final _networkConnectedStreamController =
      StreamController<int>.broadcast();
  static StreamSubscription? _streamSubscription;
  static int authCount = 0;

  ///登录重试次数

  WSInstance._();

  static init() async {
    if (_channel != null) {
      print('WebSocket--already start--');
      return;
    }
    print('WebSocket--start--');
    final wsUrl = Uri.parse(_getUrl);
    _channel = WebSocketChannel.connect(wsUrl);
    try {
      await _channel?.ready;
      print('WebSocket--ready--');
      _ready = true;
      await _streamSubscription?.cancel();
      _streamSubscription = _channel?.stream
          .listen(_onMessageReceive, onError: _onError, onDone: _onDone);
      authCount = 0;
      await _auth();
      _startPingTimer();
      _lastPongTime = DateTime.now();
    } catch (e) {
      print('WebSocket--ready--error:$e');
      _ready = false;
      _onDone();
    }
  }

  static _auth() async {
    if (!_ready) {
      return;
    }
    authCount++;
    if (Get.find<HomeController>().userEntiry.teamLoginInfo == null) {
      try {
        await Get.find<HomeController>().login();
      } finally {
        if (Get.find<HomeController>().userEntiry.teamLoginInfo == null) {
          await Future.delayed(Duration(seconds: pow(2, authCount).toInt()));
          _auth();
        } else {
          _authAccount(Get.find<HomeController>()
              .userEntiry
              .teamLoginInfo!
              .team!
              .teamId!);
        }
      }
    } else {
      _authAccount(
          Get.find<HomeController>().userEntiry.teamLoginInfo!.team!.teamId!);
    }
  }

  // 启动心跳定时器
  static void _startPingTimer() {
    print('WebSocket--ping--pong--start----');
    _pingTimer?.cancel();
    _pingTimer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      // if(_reconnectTimer?.isActive == true){
      //   //正在重连
      //   return;
      // }
      // 每 10 秒发送一个 ping 消息
      // print('WebSocket--发送 ping:${DateTime.now().millisecondsSinceEpoch}');
      _ping();

      // 检查是否超时
      if (DateTime.now().difference(_lastPongTime).inSeconds > 15) {
        print('没有收到 pong 响应，尝试重连');
        await close(); // 如果 15 秒内没有收到 pong，则认为连接断开，进行重连
        _reconnect();
      }
    });
  }

  static void _onDone() async {
    print('WebSocket 连接意外关闭');
    _ready = false;
    await close();
    Future.delayed(Duration(seconds: 3), _reconnect);
  }

  static _onError(e) {
    print('WebSocket--onError--:$e');
    _streamController.sink.addError(e);
    _onDone();
  }

  static void _onMessageReceive(message) {
    var result = _decoder(message);
    if (kDebugMode) {
      print('WebSocket--message--:${result.serviceId}');
    }
    if (result.serviceId == Api.wsHeartBeat) {
      // print('WebSocket--result--TeamService.heartBeat');
      _lastPongTime = DateTime.now();
    } else {
      // print('WebSocket--result--:$result');
      // log('result.serviceId--:${result.payload}');
      _streamController.sink.add(result);

      /// 有此返回说明网络可以用，服务器正常
      if (result.serviceId == Api.wsAuthAccount) {
        _networkConnectedStreamController.sink.add(1);
      }
    }
  }

  // 手动关闭连接
  static close() async {
    _ready = false;
    _pingTimer?.cancel();
    _channel?.sink.close();
    await _streamSubscription?.cancel();
    _channel = null;
  }

  // 重连逻辑
  static void _reconnect() {
    print('尝试重新连接...');
    init();
  }

  static void setUrl(String url) {
    ConfigStore.to.setWsServiceUrl(url);
  }

  static String get _getUrl {
    String url = ConfigStore.to.getWsServiceUrl();

    /// 把美服的都转到国服
    if (url == Address.wsPubDevUrl) {
      url = Address.wsPublicDevUrl;
    }
    // print('ws url ------ : $url');
    return url;
  }

  static Stream<ResponseMessage> get stream => _streamController.stream;

  static Stream<int> get netStream => _networkConnectedStreamController.stream;

  static void _sendMessage(List message, {String path = ""}) {
    if (!_ready) {
      print ('WSInstance not ready');
      return;
    }
    if (_channel == null) {
      print('channel null...');
      return;
    }
    if (path != Api.wsHeartBeat && kDebugMode) {
      print('WebSocket--sendMessage--message:$message');
      print('WebSocket--sendMessage--path:$path');
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

  static void _authAccount(int teamId) {
    WSInstance._sendMessage([teamId], path: Api.wsAuthAccount);
  }

  static void _ping() {
    WSInstance._sendMessage(["ping"], path: Api.wsHeartBeat);
  }

  static Stream<ResponseMessage> teamMatch() {
    WSInstance._sendMessage(["teamMatch"], path: Api.wsTeamMatch);
    return stream;
  }

  ///进入聊天室 id: gameId或playerId
  static Stream<ResponseMessage> enterRoom({int? gameId, int? playerId}) {
    WSInstance._sendMessage([gameId ?? 0, playerId ?? 0],
        path: Api.wsEnterRoom);
    return stream;
  }

  ///离开聊天室 id: gameId或playerId
  static void exitRoom({int? gameId, int? playerId}) {
    WSInstance._sendMessage([gameId ?? 0, playerId ?? 0], path: Api.wsExitRoom);
  }

  ///进入ovr聊天室
  static Stream<ResponseMessage> enterOVRRoom() {
    WSInstance._sendMessage([], path: Api.wsEnterOVRRoom);
    return stream;
  }

  ///离开ovr聊天室
  static void exitOVRRoom() {
    WSInstance._sendMessage([], path: Api.wsExitOVRRoom);
  }
}
