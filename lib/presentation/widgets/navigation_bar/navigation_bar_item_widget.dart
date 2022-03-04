import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class NavigationBarItemWidget extends StatelessWidget {
  final Either<IconData, String> icon;
  final String label;
  final int currentIndex;
  final int ownIndex;
  final double iconSize;
  final Function(int) onPressed;

  const NavigationBarItemWidget(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.ownIndex,
      required this.currentIndex,
      required this.label,
      this.iconSize = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: InkWell(
        onTap: () => onPressed(ownIndex),
        child: Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: currentIndex == ownIndex
                  ? Theme.of(context).colorScheme.primary
                  : null,
              borderRadius: BorderRadius.circular(10)),
          child: icon.fold(
              (_icon) => Icon(_icon),
              (imagePath) => Image(
                    color: currentIndex == ownIndex
                        ? Theme.of(context).colorScheme.tertiary
                        : null,
                    image: AssetImage(imagePath),
                    width: iconSize,
                    height: iconSize,
                  )),
        ),
      ),
    );
  }
}
