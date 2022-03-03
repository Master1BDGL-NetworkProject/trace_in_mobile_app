import 'package:flutter/material.dart';

import '../../features/ping/presentation/screens/ping_form.dart';
import '../../presentation/screens/home.dart';
import 'app_route_path.dart';

class AppRoutes {
  static getRoutes(BuildContext context) {
    return {
      AppRoutePath.homePath: (context) => const Home(),
      AppRoutePath.pingPath: (context) => const PingForm()
    };
  }

  static goToPing(BuildContext context) =>
      Navigator.pushReplacementNamed(context, AppRoutePath.pingPath);
}
