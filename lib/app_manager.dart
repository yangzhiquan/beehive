import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final AppManager appMgr = AppManager.instance;

const String _methodChannelName = 'beeHive_channel';
const String _kChannelMethodClipboardChange = 'ClipboardChange';

class AppManager {
  static const MethodChannel _channel = MethodChannel(_methodChannelName);

  static final AppManager _instance = AppManager._();

  static AppManager get instance => _instance;

  factory AppManager() => _instance;

  AppManager._() {
    _channel.setMethodCallHandler(_nativeMsgHandler);
  }

  /// 处理native消息
  Future<dynamic> _nativeMsgHandler(MethodCall call) async {
    switch (call.method) {
      case _kChannelMethodClipboardChange:
        debugPrint('clipboard call ${call.method} ${call.arguments}');
        break;
      default:
        debugPrint('native call ${call.method} ${call.arguments}');
    }
  }

  /// 发消息给native
  Future<T?> invokeMethod<T>(String method, [dynamic arguments]) {
    return _channel.invokeMethod<T>(method, arguments);
  }
}
