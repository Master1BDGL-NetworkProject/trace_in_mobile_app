import 'package:flutter/material.dart';

import '../../core/assets/app_assets.dart';

class InfoCardWidget extends StatelessWidget {
  final String label;
  const InfoCardWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 2),
              color: Theme.of(context).scaffoldBackgroundColor)
        ],
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          const Image(image: AssetImage(AppAssets.lampImage)),
          const SizedBox(
            width: 7,
          ),
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12.5,
                  height: 1.15,
                  color: Theme.of(context).colorScheme.tertiary),
            ),
          ),
        ],
      ),
    );
  }
}
