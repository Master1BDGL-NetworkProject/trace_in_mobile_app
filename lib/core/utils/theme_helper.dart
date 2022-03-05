import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/riverpod_providers/theme_provider/theme_provider.dart';

class ThemeHelper {
  static void handleSwitchTheme(bool currentValue, WidgetRef ref) {
    if (currentValue) {
      ref.read(themeProvider.notifier).switchDarkTheme();
    } else {
      ref.read(themeProvider.notifier).switchLightTheme();
    }
  }
}
