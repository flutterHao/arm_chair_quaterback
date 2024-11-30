import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:web_socket_channel/web_socket_channel.dart';

///
///@auther gejiahui
///created at 2024/11/30/18:57

class WebSocket {
  static WebSocketChannel? _channel;
  static int msgCounter = 1;

  WebSocket._();

  init() async {
    if (_channel != null) {
      print('testWebSocket---already start--');
      _channel?.sink.add('ping'); // 发送心跳包
      print('testWebSocket---Sent: ping');
      return;
    }
    print('testWebSocket---start--');

    final wsUrl = Uri.parse('ws://192.168.12.46:9003');
    _channel = WebSocketChannel.connect(wsUrl);

    await _channel?.ready;
    print('testWebSocket---ready--');

    _channel?.sink.add('ping'); // 发送心跳包
    print('testWebSocket---Sent: ping');

    _channel?.stream.listen((message) {
      _channel?.sink.add('received!');
      _channel?.sink.close(WebSocketStatus.goingAway);
    }, onError: (e) {
      print('testWebSocket---onError--:$e');
    }, onDone: () {
      print('testWebSocket---onDone--:');
    });
  }

  static void sendMessage(String json,{String path=""}) {
    var byteData = RequestMessage(path: path,json: json,msgCounter: "${msgCounter++}").encoder();
    _channel?.sink.add(byteData.buffer);
  }


  decoder() {}
}

class RequestMessage {
  final String json;final String path;final String msgCounter;

  RequestMessage({required this.path, required this.json,required this.msgCounter});


  ByteData encoder(){
    var byteData = ByteData(8);
    String si = path;
    List rps = [json];
    String ri = msgCounter;
    String ss = jsonEncode(rps);
    var body = Uint8List.fromList(utf8.encode(ss));
    var serviceId = Uint8List.fromList(utf8.encode(si));
    var capacity = 12 + serviceId.length+body.length;
    var buf = Uint8List(capacity);
    // byteData.setInt32(byteOffset, value)
    return byteData;
  }
}
