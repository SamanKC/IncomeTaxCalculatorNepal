import 'package:flutter/material.dart';
import 'package:incometaxcalculatornepal/utils/config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppDetails appDetails = AppDetails();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppDetails.appName),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,

          //Data Table for Couple
          child: DataTable(border: TableBorder.all(), columns: const [
            DataColumn(
                label:
                    Text("Slab", style: TextStyle(fontWeight: FontWeight.bold)),
                numeric: true),
            DataColumn(
                label: Text("Cumulative",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Rate",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Taxable Amount",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text("Tax @ Slab Rate",
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ], rows: const [
            DataRow(cells: [
              DataCell(Text("600,000")),
              DataCell(Text("600,000")),
              DataCell(Text("1%")),
              DataCell(Text("600,000")),
              DataCell(Text("")),
            ]),
            DataRow(cells: [
              DataCell(Text("200,000")),
              DataCell(Text("800,000")),
              DataCell(Text("10%")),
              DataCell(Text("200,000")),
              DataCell(Text("")),
            ]),
            DataRow(cells: [
              DataCell(Text("300,000")),
              DataCell(Text("11, 00,000")),
              DataCell(Text("20%")),
              DataCell(Text("300,000")),
              DataCell(Text("")),
            ]),
            DataRow(cells: [
              DataCell(Text("1,100,000")),
              DataCell(Text("2,000,000")),
              DataCell(Text("30%")),
              DataCell(Text("1,100,000")),
              DataCell(Text("")),
            ]),
            DataRow(cells: [
              DataCell(Text(">20,00,000")),
              DataCell(Text("")),
              DataCell(Text("36%")),
              DataCell(Text("500,000")),
              DataCell(Text("")),
            ]),
            DataRow(cells: [
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Text("Grand Total",
                  style: TextStyle(fontWeight: FontWeight.bold))),
              DataCell(
                Text(""),
              ),
            ]),
          ]),
        ),
      ],
    );
  }
}
