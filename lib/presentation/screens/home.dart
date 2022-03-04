import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/assets/app_assets.dart';
import '../../core/routes/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../riverpod_providers/theme_provider/theme_provider.dart';
import '../widgets/action_widget.dart';
import '../widgets/extra_button_widget.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  final String _appSourceCodeUrl =
      "https://github.com/SiProgramming/trace_in_mobile_app";
  final String _desktopSourceCodeUrl =
      "https://github.com/SiProgramming/trace-in-desktop-app";
  final String _apiSourceCodeUrl =
      "https://github.com/SiProgramming/tracerouteAPI";

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
            onPressed: () => _handleAbout(context),
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
          'Pour chacune des fonctions ci-dessous, cliquer dont vous avez besoin.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      const SizedBox(
        height: 35,
      ),
      ActionWidget(
          onPressed: () => AppRoutes.goToScreen(context, 0),
          description:
              "Permet de déterminer l'état du réseau et de divers hôtes étrangers ou simplement permet de verifier l'existence d'une machine sur un reseau",
          actionType: ActionType.ping,
          actionName: 'Ping'),
      const SizedBox(
        height: 15,
      ),
      ActionWidget(
          onPressed: () => AppRoutes.goToScreen(context, 1),
          description:
              "Permet de connaitre l'itineraire emprunter par un paquet pour atteindre sa destination. Il trouvera les differents machines intermediaire du circuit",
          actionType: ActionType.traceroute,
          actionName: 'Traceroute')
    ]);
  }

  void _handleAbout(BuildContext context) {
    showAboutDialog(
        context: context,
        applicationIcon: const Image(image: AssetImage(AppAssets.pingImage)),
        applicationName: 'TraceIn',
        applicationVersion: '1.0',
        children: [
          const Text(
              "Cette application est un utilitaire reseau qui permet de faire le 'traceroute' et le 'ping'.\n\nCette application est en realité un projet qui est fait dans le cadre du cours de reseaux et protocoles\n\nProfesseur du cours:\nM. Diallo Mohamed\n\nContributeurs:\n- Laurie\n- Jonas\n- Ismaël\n- Obed   "),
          const Text("Code source Mobile App :"),
          GestureDetector(
              onTap: () => _launchUrl(_appSourceCodeUrl),
              child: Text(
                _appSourceCodeUrl,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.darkBlue),
              )),
          const SizedBox(
            height: 7,
          ),
          const Text("Code source Desktop App :"),
          GestureDetector(
              onTap: () => _launchUrl(_desktopSourceCodeUrl),
              child: Text(
                _desktopSourceCodeUrl,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.darkBlue),
              )),
          const Text("Code source TraceIn API Server :"),
          GestureDetector(
              onTap: () => _launchUrl(_apiSourceCodeUrl),
              child: Text(
                _apiSourceCodeUrl,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.darkBlue),
              )),
        ]);
  }

  void _handleSwitchTheme(bool currentValue, WidgetRef ref) {
    if (currentValue) {
      ref.read(themeProvider.notifier).switchDarkTheme();
    } else {
      ref.read(themeProvider.notifier).switchLightTheme();
    }
  }

  void _launchUrl(String url) async {
    if (!await launch(url)) throw Exception("Can open URL");
  }
}
