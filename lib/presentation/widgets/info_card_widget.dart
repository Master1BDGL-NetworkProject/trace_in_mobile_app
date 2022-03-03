import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class InfoCardWidget extends StatelessWidget {
  final String label;
  const InfoCardWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightOrange,
      ),
      child: Text(
        label,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
