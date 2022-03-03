import 'package:flutter/material.dart';

import '../../core/assets/app_assets.dart';
import '../../core/sizes/app_sizes.dart';

enum ActionType { ping, traceroute }

class ActionWidget extends StatelessWidget {
  final ActionType _actionType;
  final String actionName;
  final Function() onPressed;
  final String description;

  const ActionWidget(
      {Key? key,
      required this.onPressed,
      required this.description,
      required ActionType actionType,
      required this.actionName})
      : _actionType = actionType,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(_getImagePath(_actionType))),
            const SizedBox(
              height: 5,
            ),
            Text(
              actionName,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: AppSizes.header2),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }

  String _getImagePath(ActionType actionType) {
    switch (actionType) {
      case ActionType.ping:
        return AppAssets.pingImage;
      case ActionType.traceroute:
        return AppAssets.tracerouteImage;
      default:
        throw Exception('Type not supported');
    }
  }
}
