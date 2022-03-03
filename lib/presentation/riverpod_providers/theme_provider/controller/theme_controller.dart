import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../features/theme/domain/entities/user_theme.dart';
import '../../../../features/theme/domain/usescases/change_user_theme_usescases.dart';
import '../../../../features/theme/domain/usescases/params/change_user_theme_params.dart';

class ThemeController extends StateNotifier<bool> {
  final ChangeUserThemeUsecases _changeUserThemeUsecases;
  ThemeController(bool state, this._changeUserThemeUsecases) : super(state);

  void switchLightTheme() {
    final _params =
        ChangeUserThemeParams(UserTheme(themeType: ThemeType.light));
    _changeUserThemeUsecases.trigger(_params);
    state = false;
  }

  void switchDarkTheme() {
    final _params = ChangeUserThemeParams(UserTheme(themeType: ThemeType.dark));
    _changeUserThemeUsecases.trigger(_params);
    state = true;
  }
}
