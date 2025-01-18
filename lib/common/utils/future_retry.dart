import 'dart:async';

import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:flutter/foundation.dart';

///
///@auther gejiahui
///created at 2025/1/17/14:54

abstract class FutureRetryAbstract<T> {
  bool _isSuccess = false;
  StreamSubscription? _subscription;
  int _retryCount = 0;
  bool _isDispose = false;

  Stream retry();

  Completer<List<T>>? _completer;

  bool get isSuccess => _isSuccess;

  int get retryCount => _retryCount;

  Future<List<T>> wait(Iterable<Future<T>> futures,
      {bool eagerError = false, void Function(T successValue)? cleanUp}) {
    _completer = Completer();
    _wait(futures, _completer!, eagerError: eagerError, cleanUp: cleanUp);
    return _completer!.future;
  }

  _wait(Iterable<Future<T>> futures, Completer<List<T>> completer,
      {bool eagerError = false, void Function(T successValue)? cleanUp}) {
    Future.wait(List<Future<T>>.from(futures), eagerError: eagerError, cleanUp: cleanUp).then(
        (result) {
      _isSuccess = true;
      completer.complete(result);
      _subscription?.cancel();
    }, onError: (e) {
      if (_isDispose) {
        return;
      }
      _subscription ??= retry().listen((_) {
        _retryCount++;
        print('重试第$_retryCount次');
        _wait(List<Future<T>>.from(futures), completer, eagerError: eagerError, cleanUp: cleanUp);
      });
    });
  }

  dispose() {
    _isDispose = true;
    _subscription?.cancel();
  }
}


class FutureRetry<T> extends FutureRetryAbstract<T> {
  @override
  Stream retry() {
    return WSInstance.netStream;
  }

}
