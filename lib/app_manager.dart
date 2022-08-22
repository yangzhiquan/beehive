import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'clipboard.dart';

final AppManager appMgr = AppManager.instance;

const String _methodChannelName = 'beeHive_channel';

class AppManager {
  static const MethodChannel _channel = MethodChannel(_methodChannelName);

  static final AppManager _instance = AppManager._();

  static AppManager get instance => _instance;

  factory AppManager() => _instance;

  final nativeAddLib = DynamicLibrary.process();

  late final int Function(int x, int y) nativeAdd =
      nativeAddLib.lookup<NativeFunction<Int32 Function(Int32, Int32)>>('native_add').asFunction();

  // 剪切板数据源
  final clipboard = ClipboardProvider();

  AppManager._() {
    debugPrint('5 + 2 == ${nativeAdd(5, 2)}');
    _channel.setMethodCallHandler(_nativeMsgHandler);
  }

  /// 处理native消息
  Future<dynamic> _nativeMsgHandler(MethodCall call) async {
    switch (call.method) {
      case kChannelMethodClipboardChanged:
        clipboard.handlerChange(call.arguments);
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

/// MARK: ChangeNotifier Ex
typedef WidgetUpdateCallback<T> = Widget Function(
  BuildContext context,
  T provider,
  Widget? child,
);

///
abstract class BaseChangeNotifier with ChangeNotifier {
  /// 与widget绑定
  Widget bindWidget<T extends BaseChangeNotifier>(WidgetUpdateCallback<T> builder) {
    return ChangeNotifierProvider.value(
      value: this as T,
      child: Consumer<T>(builder: builder),
    );
  }
}
