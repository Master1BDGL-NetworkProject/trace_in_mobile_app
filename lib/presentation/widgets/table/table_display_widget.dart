import 'package:flutter/material.dart';
import 'package:trace_in_mobile_app/core/extensions/string_validators/string_validators_extension.dart';

enum DataType { traceroute, ping }

class TableDisplay extends StatelessWidget {
  final Widget Function(BuildContext) dataTableBuilder;
  final String ipAdress;
  final String? domaineName;
  final DataType dataType;
  const TableDisplay(
      {Key? key,
      this.domaineName,
      required this.dataType,
      required this.dataTableBuilder,
      required this.ipAdress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              color: Theme.of(context).colorScheme.background),
          child: Text(_displayLabel(dataType),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
        ),
        dataTableBuilder(context),
      ],
    );
  }

  String _displayLabel(DataType dataType) {
    switch (dataType) {
      case DataType.ping:
        return 'Ping: ${_createCustomLabel()}';
      case DataType.traceroute:
        return 'Traceroute: ${_createCustomLabel()}';
    }
  }

  String _createCustomLabel() {
    if (domaineName != null && ipAdress.isIpAdress()) {
      return '$ipAdress($domaineName)';
    }
    return ipAdress;
  }
}
