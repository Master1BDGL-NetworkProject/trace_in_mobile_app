import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeController extends StateNotifier<bool> {
  ThemeController(bool state) : super(state);

  void switchLightTheme() {
    state = false;
  }

  void switchDarkTheme() {
    state = true;
  }
}
