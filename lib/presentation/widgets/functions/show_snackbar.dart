import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

void showNetworkErrorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      backgroundColor: AppColors.errorColor,
      content: Text(
        "Vous n'etes pas connecté à internet",
        textAlign: TextAlign.center,
      )));
}
