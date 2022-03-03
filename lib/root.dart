import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/dark_app_theme_impl.dart';
import 'presentation/riverpod_providers/theme_provider/theme_provider.dart';

import 'core/theme/light_app_theme_impl.dart';
import 'presentation/screens/home.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, __) {
        final _isDarkMode = watch.watch(themeProvider);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const Home(),
          darkTheme: DarkAppTheme().theme,
          themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: LightAppTheme().theme,
        );
      },
    );
  }
}
