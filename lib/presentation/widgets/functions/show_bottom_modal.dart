import 'package:flutter/material.dart';

void showCustomModalBottomSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      builder: (_) => child);
}
