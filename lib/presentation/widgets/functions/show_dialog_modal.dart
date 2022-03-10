import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/assets/app_assets.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../riverpod_providers/theme_provider/theme_provider.dart';

void handleAbout(BuildContext context, WidgetRef ref) {
  showAboutDialog(
      context: context,
      applicationIcon: const Image(
          width: 60,
          height: 60,
          image: AssetImage(
            AppAssets.tracerouteImage,
          )),
      applicationName: 'TraceIn',
      applicationVersion: '1.0',
      children: [
        Text(
            "Cette application est un utilitaire reseau qui permet de faire le 'traceroute' et le 'ping'.\n\nCette application est en realité un projet qui est fait dans le cadre du cours de reseaux et protocoles\n\nProfesseur du cours:\nM. Diallo Mohamed\n\nContributeurs:\n- Laurie\n- Jonas\n- Ismaël\n- Obed   ",
            style: ref.read(themeProvider) != true
                ? Theme.of(context).textTheme.displayMedium
                : null),
        const SizedBox(
          height: 15,
        ),
        Text("Code source Mobile App :",
            style: ref.read(themeProvider) != true
                ? Theme.of(context).textTheme.displayMedium
                : null),
        GestureDetector(
            onTap: () => launchUrl(AppConstants.appSourceCodeUrl),
            child: Text(AppConstants.appSourceCodeUrl,
                style: const TextStyle().copyWith(color: AppColors.darkBlue))),
        const SizedBox(
          height: 15,
        ),
        Text("Code source Desktop App :",
            style: ref.read(themeProvider) != true
                ? Theme.of(context).textTheme.displayMedium
                : null),
        GestureDetector(
            onTap: () => launchUrl(AppConstants.desktopSourceCodeUrl),
            child: Text(
              AppConstants.desktopSourceCodeUrl,
              style: const TextStyle().copyWith(color: AppColors.darkBlue),
            )),
        const SizedBox(
          height: 15,
        ),
        Text("Code source TraceIn API Server :",
            style: ref.read(themeProvider) != true
                ? Theme.of(context).textTheme.displayMedium
                : null),
        GestureDetector(
            onTap: () => launchUrl(AppConstants.apiSourceCodeUrl),
            child: Text(
              AppConstants.apiSourceCodeUrl,
              style: const TextStyle().copyWith(color: AppColors.darkBlue),
            )),
      ]);
}

void launchUrl(String url) async {
  if (!await launch(url)) throw Exception("Can open URL");
}
