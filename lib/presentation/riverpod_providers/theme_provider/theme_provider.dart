import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dependency_inversion.dart';
import '../../../features/theme/domain/entities/user_theme.dart';
import '../../../features/theme/domain/usescases/change_user_theme_usescases.dart';
import '../../../features/theme/domain/usescases/get_user_theme_usescases.dart';
import '../../../features/theme/domain/usescases/params/no_params.dart';
import 'controller/theme_controller.dart';

final themeProvider = StateNotifierProvider<ThemeController, bool>((_) {
  final _userTheme = (getIt.get<GetUserThemeUsecases>().trigger(NoParams()))
      .fold((l) => l, (r) => r);
  late final bool _isDark;
  if (_userTheme is UserTheme) {
    _isDark = _getTheme(_userTheme.themeType);
  } else {
    _isDark = false;
  }
  return ThemeController(_isDark, getIt.get<ChangeUserThemeUsecases>());
});

bool _getTheme(ThemeType themeType) {
  switch (themeType) {
    case ThemeType.light:
      return false;
    case ThemeType.dark:
      return true;
    default:
      throw Exception('Theme type not supported');
  }
}
