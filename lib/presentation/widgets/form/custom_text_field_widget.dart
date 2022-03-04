import 'package:flutter/material.dart';
import 'package:trace_in_mobile_app/features/traceroute/domain/usescases/params/get_traceroute_info_params.dart';

import '../../../core/sizes/app_sizes.dart';
import '../../../core/theme/app_colors.dart';

typedef Validator = String? Function(String?, [String?])?;

class CustomTextFieldWidget extends StatelessWidget {
  final String _label;
  final String _placeholder;
  final TextEditingController _editingController;
  final TextInputType? textInputType;
  final Validator validator;

  const CustomTextFieldWidget(
      {Key? key,
      this.textInputType,
      required this.validator,
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
            validator: (value) => validator!(value, _label),
            controller: _editingController,
            keyboardType: textInputType,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).textTheme.headlineMedium!.color),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(overflow: TextOverflow.clip, fontSize: 12),
              hintText: _placeholder,
              errorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.errorColor, width: 1),
                  borderRadius: BorderRadius.circular(AppSizes.buttonRadius2)),
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

class CustomTextFieldWidget2 extends StatelessWidget {
  final String _label;
  final void Function(Protocol?) onPressed;
  final Protocol currentProtocolSelected;

  const CustomTextFieldWidget2({
    Key? key,
    required this.onPressed,
    required this.currentProtocolSelected,
    required String label,
  })  : _label = label,
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
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius2)),
            child: DropdownButton<Protocol>(
                borderRadius: BorderRadius.circular(10),
                alignment: Alignment.center,
                isExpanded: true,
                underline: Container(),
                value: currentProtocolSelected,
                items: [
                  {'label': 'udp', 'protocol': Protocol.udp},
                  {'label': 'icmp', 'protocol': Protocol.icmp}
                ]
                    .map((_item) => DropdownMenuItem<Protocol>(
                          child: Text(
                            _item['label'] as String,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          value: _item['protocol'] as Protocol,
                        ))
                    .toList(),
                onChanged: onPressed)),
      ],
    );
  }
}
