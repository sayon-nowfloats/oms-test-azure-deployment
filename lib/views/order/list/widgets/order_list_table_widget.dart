import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

@override
Widget build(BuildContext context) {
  return DataTable2(
    columnSpacing: 12,
    horizontalMargin: 12,
    border: TableBorder(
        top: const BorderSide(color: Colors.black),
        bottom: BorderSide(color: Colors.grey[300]!),
        left: BorderSide(color: Colors.grey[300]!),
        right: BorderSide(color: Colors.grey[300]!),
        verticalInside: BorderSide(color: Colors.grey[300]!),
        horizontalInside: const BorderSide(color: Colors.grey, width: 1)),
    dividerThickness: 1,
    bottomMargin: 10,
    minWidth: 900,
    sortArrowIcon: Icons.keyboard_arrow_up,
    // custom arrow
    sortArrowAnimationDuration: const Duration(milliseconds: 500),
    // custom animation duration
    columns: const [
      DataColumn2(
        label: Text('Desert'),
        size: ColumnSize.S,
        // example of fixed 1st row
        fixedWidth: 200,
      ),
      DataColumn2(
        label: Text('Calories'),
        size: ColumnSize.S,
        numeric: true,
      ),
      DataColumn2(
        label: Text('Fat (gm)'),
        size: ColumnSize.S,
        numeric: true,
      ),
      DataColumn2(
        label: Text('Carbs (gm)'),
        size: ColumnSize.S,
        numeric: true,
      ),
      DataColumn2(
        label: Text('Protein (gm)'),
        size: ColumnSize.S,
        numeric: true,
      ),
      DataColumn2(
        label: Text('Sodium (mg)'),
        size: ColumnSize.S,
        numeric: true,
      ),
      DataColumn2(
        label: Text('Calcium (%)'),
        size: ColumnSize.S,
        numeric: true,
      ),
      DataColumn2(
        label: Text('Iron (%)'),
        size: ColumnSize.S,
        numeric: true,
      ),
    ],
    empty: Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.grey[200],
        child: const Text('No data'),
      ),
    ),
    rows: List<DataRow>.generate(
      100,
      (index) => DataRow(
        color: MaterialStateProperty.all(Theme.of(context).highlightColor),
        cells: List<DataCell>.generate(
          8,
          (index) => const DataCell(
            Text("asd"),
          ),
        ),
      ),
    ),
  );
}
