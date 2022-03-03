import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'features/theme/data/local_data_source/local_user_theme_datasource.dart';
import 'features/theme/data/local_data_source/local_user_theme_datasource_interface.dart';
import 'features/theme/domain/entities/user_theme.dart';
import 'features/theme/domain/usescases/change_user_theme_usescases.dart';
import 'features/theme/domain/usescases/get_user_theme_usescases.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  /// Register Hive Adapters
  Hive.registerAdapter<ThemeType>(ThemeTypeAdapter());
  Hive.registerAdapter<UserTheme>(UserThemeAdapter());

  /// Local user theme Dependency
  final _userThemeBox = await Hive.openBox<UserTheme>('user_theme_box');

  getIt.registerLazySingleton<ILocalUserThemeDatasource>(
      () => LocalUserThemeDatasourceImpl(_userThemeBox));

  getIt.registerLazySingleton<GetUserThemeUsecases>(
      () => GetUserThemeUsecases(getIt()));

  getIt.registerLazySingleton<ChangeUserThemeUsecases>(
      () => ChangeUserThemeUsecases(getIt()));
}
