import 'dart:convert';
import 'dart:typed_data';

///
///@auther gejiahui
///created at 2024/12/2/10:03

class RequestMessage {
  final dynamic json;
  final String path;
  final int msgCounter;

  RequestMessage(
      {required this.path, required this.json, required this.msgCounter});
}

class ByteBuf {
  ByteData byteData;
  Uint8List byteView;

  int _position = 0;

  ByteBuf(int length)
      : byteData = ByteData(length),
        byteView = Uint8List(length);

  ByteBuf.fromList(Uint8List data)
      : byteData = ByteData.sublistView(data),
        byteView = data;

  void addInt32(int value) {
    byteData.setInt32(_position, value, Endian.big); // 使用大端字节序
    _position += 4; // 32 位整数占 4 字节
  }

  void addInt16(int value) {
    byteData.setInt16(_position, value, Endian.big); // 使用大端字节序
    _position += 2; // 16 位整数占 2 字节
  }

  void addBytes(Uint8List bytes) {
    for (int i = 0; i < bytes.length; i++) {
      byteData.setUint8(_position, bytes[i]);
      _position++;
    }
  }

  int readShort() {
    final value = byteData.getInt16(_position, Endian.big);
    _position += 2;
    return value;
  }

  int readInt() {
    final value = byteData.getInt32(_position, Endian.big);
    _position += 4;
    return value;
  }

  int readLong() {
    // 假定是大端字节序 (Big-endian)
    int long = 0;
    for (int i = 0; i < 8; i++) {
      // 按顺序将每个字节读取，并按位移组合成一个整数
      long = (long << 8) | byteData.getUint8(_position++);
    }
    return long;
  }

  Uint8List readBytes(int length) {
    final bytes = byteData.buffer.asUint8List(_position, length);
    _position += length;
    return bytes;
  }

  String readString(Uint8List data) {
    return String.fromCharCodes(data);
  }

  /// 确保容量足够，动态扩展
  void _ensureWrite(int requiredLength) {
    if (requiredLength > byteData.lengthInBytes) {
      final newLength = requiredLength * 2;
      final newByteData = ByteData(newLength);
      final newByteView = Uint8List.view(newByteData.buffer);

      newByteView.setRange(0, byteData.lengthInBytes, byteView);
      byteData = newByteData;
      byteView = newByteView;
    }
  }

  /// 将一个 `Uint8List` 写入到 `ByteBuf`
  void writeArrayBuffer(Uint8List arraybuffer,
      [int offset = 0, int length = 0]) {
    if (offset < 0 || length < 0) {
      throw ArgumentError("writeArrayBuffer error - Out of bounds");
    }

    if (length == 0) {
      length = arraybuffer.length - offset;
    }

    _ensureWrite(_position + length);

    // 写入数据
    byteView.setRange(_position, _position + length,
        arraybuffer.sublist(offset, offset + length));
    _position += length;
  }

  Uint8List get data => byteView;

  int get position => _position;

  int get length => _position;

  Uint8List getBytes() {
    return byteData.buffer.asUint8List(0, _position);
  }
}

class ResponseMessage {
  late int requestId;
  late int payloadType;
  /// 接口名
  late String serviceId;
  late int timestamp;
  late int statusCode;
  late String statusMsg;
  /// 参数
  late String payload;



  @override
  String toString() {
    return 'ResponseMessage{requestId: $requestId, payloadType: $payloadType, serviceId: $serviceId, timestamp: $timestamp, statusCode: $statusCode, statusMsg: $statusMsg, payload: $payload}';
  }
}

class WebSocketDataHandler {
  WebSocketDataHandler._();

  static Uint8List encoder(RequestMessage message) {
    String si = message.path;
    List rps = [message.json];
    int ri = message.msgCounter;
    String ss = jsonEncode(rps);
    var body = Uint8List.fromList(utf8.encode(ss));
    var serviceId = Uint8List.fromList(utf8.encode(si));
    var capacity = 12 + serviceId.length + body.length;
    ByteBuf buf = ByteBuf(capacity);
    buf.addInt32(capacity);
    buf.addInt16(5);
    buf.addInt32((ri));
    buf.addInt16(si.length);
    buf.addBytes(serviceId);
    buf.addBytes(body);
    return buf.getBytes();
  }

  static ResponseMessage decode(ByteBuf socketBuf, int bodyLength) {
    final payLoadType = socketBuf.readShort();
    final requestId = socketBuf.readInt();
    final timeStamp = socketBuf.readLong();
    final statusCode = socketBuf.readShort();
    final statusMsgLength = socketBuf.readShort();
    final serviceIdLength = socketBuf.readShort();

    // 读取状态信息
    final statusBytes = socketBuf.readBytes(statusMsgLength);

    // 读取服务ID
    final serviceBytes = socketBuf.readBytes(serviceIdLength);

    // 计算剩余的 payload 长度
    final payloadLength = bodyLength - 20 - statusMsgLength - serviceIdLength;
    final payload = socketBuf.readBytes(payloadLength);

    // 构造返回的 ResponsMessage 对象
    final respons = ResponseMessage();
    respons.requestId = requestId;
    respons.payloadType = payLoadType;
    respons.serviceId = socketBuf.readString(serviceBytes);
    respons.timestamp = timeStamp;
    respons.statusCode = statusCode;
    respons.statusMsg = socketBuf.readString(statusBytes);
    respons.payload = utf8.decode(payload);

    return respons;
  }
}
