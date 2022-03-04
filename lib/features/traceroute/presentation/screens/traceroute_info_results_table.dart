// import 'package:flutter/material.dart';
// import 'package:trace_in_mobile_app/features/traceroute/domain/entities/traceroute_info.dart';

// import '../../domain/entities/traceroute_info.dart';

// class TracerouteInfoResultsTable extends StatelessWidget {
//   final List<TracerouteInfo> tracerouteInfos;
//   const TracerouteInfoResultsTable({Key? key, required this.tracerouteInfos})
//       : super(key: key);

//   List<DataColumn> _getDataColumns(BuildContext context) {
//     return [
//       DataColumn(
//           label: Text(
//         'Seq',
//         style:
//             Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 13),
//       )),
//       DataColumn(
//           label: Text(
//         'host',
//         style:
//             Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 13),
//       )),
//       DataColumn(
//           label: Text(
//         'Time 1(ms)',
//         style:
//             Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 13),
//       )),
//       DataColumn(
//           label: Text(
//         'Time 2(ms)',
//         style:
//             Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 13),
//       )),
//       DataColumn(
//           label: Text(
//         'Time 3(ms)',
//         style:
//             Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 13),
//       )),

//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
//             decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15)),
//                 color: Theme.of(context).colorScheme.secondary),
//             child: Text('Traceroute: ${tracerouteInfos.first.host}',
//                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: Theme.of(context).colorScheme.tertiary)),
//           ),
//           DataTable(
//               columns: _getDataColumns(context),
//               rows: _mapPinfosToDataRow(tracerouteInfos, context)),
//         ],
//       ),
//     );
//   }

//   List<DataRow> _mapPinfosToDataRow(
//       List<tracerouteInfo> tracerouteInfos, BuildContext context) {
//     return tracerouteInfos
//         .map((_tracerouteInfo) => DataRow(
//                 color: MaterialStateProperty.resolveWith<Color?>(
//                     (Set<MaterialState> states) {
//                   if (_tracerouteInfo.sequenceNo.isEven) {
//                     return Theme.of(context)
//                         .colorScheme
//                         .background
//                         .withOpacity(.7);
//                   }
//                   return Theme.of(context).colorScheme.primary;
//                 }),
//                 cells: [
//                   DataCell(Text(
//                     _tracerouteInfo.sequenceNo.toString(),
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         fontSize:
//                             Theme.of(context).textTheme.bodyMedium!.fontSize! -
//                                 2),
//                   )),
//                   DataCell(Text(
//                     _tracerouteInfo.bits.toString(),
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         fontSize:
//                             Theme.of(context).textTheme.bodyMedium!.fontSize! -
//                                 2),
//                   )),
//                   DataCell(Text(
//                     _tracerouteInfo.ttl.toString(),
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         fontSize:
//                             Theme.of(context).textTheme.bodyMedium!.fontSize! -
//                                 2),
//                   )),
//                   DataCell(Text(
//                     _tracerouteInfo.time.toString(),
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         fontSize:
//                             Theme.of(context).textTheme.bodyMedium!.fontSize! -
//                                 2),
//                   )),
//                 ]))
//         .toList();
//   }
// }
