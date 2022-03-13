import 'package:flutter/material.dart';

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
              color: Theme.of(context).colorScheme.tertiary),
          child: Text(_displayLabel(dataType),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.primary)),
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
    if (domaineName != null) {
      return '$ipAdress($domaineName)';
    }
    return ipAdress;
  }
}
