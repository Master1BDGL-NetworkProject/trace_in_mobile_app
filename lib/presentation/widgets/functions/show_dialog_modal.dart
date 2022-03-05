import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/assets/app_assets.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';

void handleAbout(BuildContext context) {
  showAboutDialog(
      context: context,
      applicationIcon: const Image(image: AssetImage(AppAssets.pingImage)),
      applicationName: 'TraceIn',
      applicationVersion: '1.0',
      children: [
        const Text(
            "Cette application est un utilitaire reseau qui permet de faire le 'traceroute' et le 'ping'.\n\nCette application est en realité un projet qui est fait dans le cadre du cours de reseaux et protocoles\n\nProfesseur du cours:\nM. Diallo Mohamed\n\nContributeurs:\n- Laurie\n- Jonas\n- Ismaël\n- Obed   "),
        const SizedBox(
          height: 15,
        ),
        const Text("Code source Mobile App :"),
        GestureDetector(
            onTap: () => launchUrl(AppConstants.appSourceCodeUrl),
            child: Text(AppConstants.appSourceCodeUrl,
                style: const TextStyle().copyWith(color: AppColors.darkBlue))),
        const SizedBox(
          height: 15,
        ),
        const Text("Code source Desktop App :"),
        GestureDetector(
            onTap: () => launchUrl(AppConstants.desktopSourceCodeUrl),
            child: Text(
              AppConstants.desktopSourceCodeUrl,
              style: const TextStyle().copyWith(color: AppColors.darkBlue),
            )),
        const SizedBox(
          height: 15,
        ),
        const Text("Code source TraceIn API Server :"),
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
