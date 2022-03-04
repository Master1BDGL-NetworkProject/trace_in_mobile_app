import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trace_in_mobile_app/core/routes/app_routes.dart';

import '../../core/assets/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../riverpod_providers/theme_provider/theme_provider.dart';
import '../widgets/action_widget.dart';
import '../widgets/extra_button_widget.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(context, ref),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: _buildColumnItems(context),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 0,
      title: Text(
        'TraceIn',
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(letterSpacing: 1.2, fontSize: 15),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      titleSpacing: 25,
      actions: [
        Consumer(
          builder: (__, reff, ___) {
            final _isDark = reff.watch(themeProvider);
            return Switch.adaptive(
                inactiveThumbImage: const AssetImage(AppAssets.lightModeImage),
                activeThumbImage: const AssetImage(AppAssets.darkModeImage),
                value: _isDark,
                activeColor: AppColors.lightOrange,
                onChanged: (_) => _handleSwitchTheme(_, ref));
          },
        ),
        IconButton(
            onPressed: _handleAbout,
            icon: const ExtraButtonWidget(iconPath: AppAssets.aboutImage))
      ],
    );
  }

  Widget _buildColumnItems(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 25,
      ),
      Text(
        'Faites votre choix',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam quis hendrerit turpis. Ut iaculis justo a feugiat scelerisque.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      const SizedBox(
        height: 35,
      ),
      ActionWidget(
          onPressed: () => AppRoutes.goToPing(context),
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam quis hendrerit turpis. Ut iaculis justo a feugiat scelerisque.',
          actionType: ActionType.ping,
          actionName: 'Ping'),
      const SizedBox(
        height: 15,
      ),
      ActionWidget(
          onPressed: () => AppRoutes.goToPing(context),
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam quis hendrerit turpis. Ut iaculis justo a feugiat scelerisque.',
          actionType: ActionType.traceroute,
          actionName: 'Traceroute')
    ]);
  }

  void _handleAbout() {
    //TODO
  }

  void _handleSwitchTheme(bool currentValue, WidgetRef ref) {
    if (currentValue) {
      ref.read(themeProvider.notifier).switchDarkTheme();
    } else {
      ref.read(themeProvider.notifier).switchLightTheme();
    }
  }
}
