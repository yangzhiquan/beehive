import 'app_manager.dart';

const String kChannelMethodClipboardChanged = 'ClipboardHasChanged';
const String kChannelMethodClipboardSelected = 'ClipboardSelected';

class ClipboardProvider extends BaseChangeNotifier {
  final strings = <String>[];
  // 处理剪切板数据变化
  void handlerChange(dynamic args) {
    if (args is Iterable) {
      strings.clear();
      final str = List<String>.from(args);
      strings.addAll(str);
      notifyListeners();
    }
  }

  void select(int index) => appMgr.invokeMethod(kChannelMethodClipboardSelected, index);
}
