import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
        backgroundColor: Theme.of(context).colorScheme.primary,
        minWidth: 55,
        destinations: const [
          NavigationRailDestination(
              icon: Image(image: AssetImage(AppAssets.pingImage)),
              label: Text('')),
          NavigationRailDestination(
              icon: Image(image: AssetImage(AppAssets.tracerouteTinyImage)),
              label: Text(''))
        ],
        selectedIndex: 0);
  }
}
