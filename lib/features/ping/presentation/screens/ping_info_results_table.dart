import 'package:flutter/material.dart';

import '../../domain/entities/ping_info.dart';

class PingInfoResultsTable extends StatelessWidget {
  final List<PingInfo> pingInfos;
  const PingInfoResultsTable({Key? key, required this.pingInfos})
      : super(key: key);

  List<DataColumn> _getDataColumns(BuildContext context) {
    return [
      DataColumn(
          label: Text(
        'Seq',
        style:
            Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 13),
      )),
      DataColumn(
          label: Text(
        'Bits',
        style:
            Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 13),
      )),
      DataColumn(
          label: Text(
        'TTL',
        style:
            Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 13),
      )),
      DataColumn(
          label: Text(
        'Temps(ms)',
        style:
            Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 13),
      )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                color: Theme.of(context).colorScheme.secondary),
            child: Text('Ping: ${pingInfos.first.host}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary)),
          ),
          DataTable(
              columns: _getDataColumns(context),
              rows: _mapPinfosToDataRow(pingInfos, context)),
        ],
      ),
    );
  }

  List<DataRow> _mapPinfosToDataRow(
      List<PingInfo> pingInfos, BuildContext context) {
    return pingInfos
        .map((_pingInfo) => DataRow(
                color: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (_pingInfo.sequenceNo.isEven) {
                    return Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(.7);
                  }
                  return Theme.of(context).colorScheme.primary;
                }),
                cells: [
                  DataCell(Text(
                    _pingInfo.sequenceNo.toString(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize! -
                                2),
                  )),
                  DataCell(Text(
                    _pingInfo.bits.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize! -
                                2),
                  )),
                  DataCell(Text(
                    _pingInfo.ttl.toString(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize! -
                                2),
                  )),
                  DataCell(Text(
                    _pingInfo.time.toString(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize! -
                                2),
                  )),
                ]))
        .toList();
  }
}
