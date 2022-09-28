enum ButtonAction {
  setting,
}

extension ButtonActionValue on ButtonAction {
  String get value {
    switch (this) {
      case ButtonAction.setting:
        return 'setting';
    }
  }
}
