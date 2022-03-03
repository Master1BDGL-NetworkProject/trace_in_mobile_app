import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trace_in_mobile_app/core/routes/app_routes.dart';
import 'core/theme/dark_app_theme_impl.dart';
import 'presentation/riverpod_providers/theme_provider/theme_provider.dart';

import 'core/theme/light_app_theme_impl.dart';
import 'presentation/screens/home.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      child: const Home(),
      builder: (_, watch, __) {
        final _isDarkMode = watch.watch(themeProvider);
        return MaterialApp(
          routes: AppRoutes.getRoutes(context),
          debugShowCheckedModeBanner: false,
          darkTheme: DarkAppTheme().theme,
          themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: LightAppTheme().theme,
        );
      },
    );
  }
}
