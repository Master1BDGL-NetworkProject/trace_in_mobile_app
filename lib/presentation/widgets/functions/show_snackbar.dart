import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

const noConnectionMessage = "Vous n'êtes pas connecté à internet";
const connectionTimedOutMessage = "Il se peut que le serveur soit injoingnable";
const unknowMessage = "Quelque choses s'est mal passé ressayer plutard";

void showNetworkErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      backgroundColor: AppColors.errorColor,
      content: Text(
        message,
        textAlign: TextAlign.center,
      )));
}
