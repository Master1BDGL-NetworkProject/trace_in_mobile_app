import 'package:flutter/material.dart';

import '../../../../core/utils/info_results_interface.dart';
import '../../../../presentation/widgets/table/table_display_widget.dart';
import '../../domain/entities/ping_info.dart';

class PingInfoResultsTable extends StatelessWidget
    implements IInfoResults<PingInfo> {
  final List<PingInfo> pingInfos;
  final String? hostEntered;
  const PingInfoResultsTable(
      {Key? key, required this.pingInfos, this.hostEntered})
      : super(key: key);

  @override
  List<DataColumn> getDataColumns(BuildContext context) {
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
      child: TableDisplay(
          dataType: DataType.ping,
          dataTableBuilder: buildDataTable,
          ipAdress: pingInfos.first.host,
          domaineName: hostEntered),
    );
  }

  @override
  List<DataRow> mapPinfosToDataRow(
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

  @override
  Widget buildDataTable(BuildContext context) {
    return DataTable(
        columns: getDataColumns(context),
        rows: mapPinfosToDataRow(pingInfos, context));
  }
}
