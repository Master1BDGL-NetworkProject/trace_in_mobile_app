import 'package:flutter/material.dart';

import '../../../../core/utils/info_results_interface.dart';
import '../../../../presentation/widgets/table/table_display_widget.dart';
import '../../domain/entities/traceroute_info.dart';

class TracerouteInfoResultsTable extends StatelessWidget
    implements IInfoResults<TracerouteInfo> {
  final List<TracerouteInfo> tracerouteInfos;
  final String? hostEntered;
  const TracerouteInfoResultsTable(
      {Key? key, required this.tracerouteInfos, this.hostEntered})
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
        'host',
        style:
            Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 13),
      )),
      DataColumn(
          label: Text(
        'Time 1(ms)',
        style:
            Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 13),
      )),
      DataColumn(
          label: Text(
        'Time 2(ms)',
        style:
            Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 13),
      )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TableDisplay(
          dataType: DataType.traceroute,
          dataTableBuilder: buildDataTable,
          ipAdress: tracerouteInfos.first.hopsIpAdress,
          domaineName: hostEntered),
    );
  }

  @override
  List<DataRow> mapPinfosToDataRow(
      List<TracerouteInfo> tracerouteInfos, BuildContext context) {
    int _index = 0;
    // debugPrint(tracerouteInfos[0].packetTime[0].toString());
    return tracerouteInfos.map((_tracerouteInfo) {
      _index++;
      return DataRow(
          color: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (_index.isEven) {
              return Theme.of(context).colorScheme.background.withOpacity(.7);
            }
            return Theme.of(context).colorScheme.primary;
          }),
          cells: [
            DataCell(Text(
              _index.toString(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize:
                      Theme.of(context).textTheme.bodyMedium!.fontSize! - 2),
            )),
            DataCell(Text(
              _tracerouteInfo.hopsIpAdress.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize:
                      Theme.of(context).textTheme.bodyMedium!.fontSize! - 2),
            )),
            DataCell(Text(
              _tracerouteInfo.packetTime[0] != 0.0
                  ? _tracerouteInfo.packetTime[0].toString()
                  : '*',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize:
                      Theme.of(context).textTheme.bodyMedium!.fontSize! - 2),
            )),
            DataCell(Text(
              _tracerouteInfo.packetTime[1] != 0.0
                  ? _tracerouteInfo.packetTime[1].toString()
                  : '*',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize:
                      Theme.of(context).textTheme.bodyMedium!.fontSize! - 2),
            )),
          ]);
    }).toList();
  }

  @override
  Widget buildDataTable(BuildContext context) {
    return FittedBox(
      child: DataTable(
          columns: getDataColumns(context),
          rows: mapPinfosToDataRow(tracerouteInfos, context)),
    );
  }
}
