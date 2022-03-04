import 'dart:async';

import 'package:flutter/material.dart';

enum ButtonType { grey, blue }

class ButtonWidget extends StatefulWidget {
  final Function() _function;
  final String _label;
  final ButtonType _buttonType;
  final bool willLoad;

  const ButtonWidget(
      {Key? key,
      required this.willLoad,
      required Function() function,
      required ButtonType buttonType,
      required String label})
      : _function = function,
        _buttonType = buttonType,
        _label = label,
        super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  late final StreamController<bool> _buttonStatusStreamController;

  @override
  void initState() {
    super.initState();
    _buttonStatusStreamController = StreamController.broadcast();
  }

  @override
  void dispose() {
    _buttonStatusStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: _buttonStatusStreamController.stream,
        initialData: false,
        builder: (context, buttonStatus) {
          if (buttonStatus.data!) {
            return TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: buttonStatus.data!
                      ? Theme.of(context).colorScheme.background
                      : widget._buttonType == ButtonType.grey
                          ? Theme.of(context).colorScheme.background
                          : Theme.of(context).colorScheme.primaryContainer),
              onPressed: _onPressed,
              child: SizedBox(
                  width: Theme.of(context).buttonTheme.height - 10,
                  height: Theme.of(context).buttonTheme.height - 10,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                  )),
            );
          }
          return TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: widget._buttonType == ButtonType.grey
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).colorScheme.primaryContainer),
            onPressed: _onPressed,
            child: Text(
              widget._label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: widget._buttonType == ButtonType.grey
                      ? Theme.of(context).textTheme.headlineMedium!.color!
                      : Theme.of(context).colorScheme.tertiary),
            ),
          );
        });
  }

  void _onPressed() async {
    if (widget.willLoad) {
      _buttonStatusStreamController.add(true);
      await widget._function();
      _buttonStatusStreamController.add(false);
    } else {
      widget._function();
    }
  }
}
