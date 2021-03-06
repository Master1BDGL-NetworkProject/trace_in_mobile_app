import 'package:flutter/material.dart';

import '../../presentation/screens/home.dart';
import '../../presentation/screens/page_switcher.dart';
import 'app_route_path.dart';

class AppRoutes {
  static getRoutes(BuildContext context) {
    return {
      AppRoutePath.homePath: (context) => const Home(),
      AppRoutePath.pageSwitcherpath: (context) => const PageSwitcher()
    };
  }

  static goToScreen(BuildContext context, int index) =>
      Navigator.pushReplacementNamed(context, AppRoutePath.pageSwitcherpath,
          arguments: index);
}
