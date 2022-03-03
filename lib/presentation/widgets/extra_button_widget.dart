import 'package:flutter/material.dart';

class ExtraButtonWidget extends StatelessWidget {
  final String iconPath;
  const ExtraButtonWidget({Key? key, required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          color: Theme.of(context).colorScheme.primary),
      child: Image(image: AssetImage(iconPath)),
    );
  }
}
