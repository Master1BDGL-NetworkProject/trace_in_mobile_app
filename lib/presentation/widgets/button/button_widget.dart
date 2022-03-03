import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

enum ButtonType { grey, blue }

class ButtonWidget extends StatelessWidget {
  final Function() _function;
  final String _label;
  final ButtonType _buttonType;

  const ButtonWidget(
      {Key? key,
      required Function() function,
      required ButtonType buttonType,
      required String label})
      : _function = function,
        _buttonType = buttonType,
        _label = label,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            backgroundColor: _buttonType == ButtonType.grey
                ? Theme.of(context).colorScheme.background
                : Theme.of(context).colorScheme.primaryContainer),
        onPressed: _function,
        child: Text(
          _label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: _buttonType == ButtonType.grey
                  ? Theme.of(context).textTheme.headlineMedium!.color!
                  : Theme.of(context).colorScheme.tertiary),
        ));
  }
}
