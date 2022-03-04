import 'package:flutter/material.dart';

abstract class IInfoResults<T> {
  List<DataColumn> getDataColumns(BuildContext context);

  List<DataRow> mapPinfosToDataRow(List<T> pingInfos, BuildContext context);

  Widget buildDataTable(BuildContext context);
}
