import 'package:flutter/material.dart';

import '../../../core/sizes/app_sizes.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String _label;
  final String _placeholder;
  final TextEditingController _editingController;
  final TextInputType? textInputType;

  const CustomTextFieldWidget(
      {Key? key,
      this.textInputType,
      required TextEditingController textEditingController,
      required String label,
      required String placeholder})
      : _editingController = textEditingController,
        _placeholder = placeholder,
        _label = label,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _label,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(AppSizes.buttonRadius2)),
          child: TextFormField(
            controller: _editingController,
            keyboardType: textInputType,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(overflow: TextOverflow.clip, fontSize: 12),
              hintText: _placeholder,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary, width: 1),
                  borderRadius: BorderRadius.circular(AppSizes.buttonRadius2)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.background,
                      width: 0),
                  borderRadius: BorderRadius.circular(AppSizes.buttonRadius2)),
            ),
          ),
        ),
      ],
    );
  }
}
