import 'package:flutter/material.dart';
import 'package:incometaxcalculatornepal/controller/function.dart';
import 'package:incometaxcalculatornepal/utils/config.dart';
// import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController amountController = TextEditingController();
  double amount = 0;
  List taxSlab = [];
  String dropDownValue = "Unmarried";
  var options = ["Unmarried", "Married"];

  String defaultDate = "Yearly";
  var date = ["Yearly", "Monthly"];

  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  bool name = false;

  // Dialog Start
  _showDialog(context, String title, String body) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        scrollable: true,
        title: Text(title),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              body,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }
  // Dialog End

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppDetails.appName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _showDialog(
                    context, "About App", "This App is Developed By Students");
              },
              icon: const Icon(Icons.info))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Dropdown menu for unmarried and married
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white),
                  value: dropDownValue,
                  items: options.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    dropDownValue = newValue!;
                    if (dropDownValue == "Unmarried") {
                      name = true;
                    } else if (dropDownValue == "Married") {
                      name = false;
                    } else {
                      const Text("Invalid Input");
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              //Amount Text
              Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 12),
                  child: const Text(
                    "Enter Your Amount:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),

              //for enter Amount Text Field
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, right: 12, left: 12),
                      child: TextFormField(
                          controller: amountController,
                          decoration: InputDecoration(
                              hintText: "120000",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          keyboardType: TextInputType.number,
                          onChanged: (val) {
                            setState(() {
                              // if value contain non numeric value then clear it and make it 0
                              if (double.tryParse(val) == null) {
                                amountController.clear();
                                amount = 0;
                                return;
                              }

                              if (val.isEmpty) {
                                amount = 0;
                              } else {
                                amount = double.parse(val);
                              }
                            });
                          }),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, right: 12, left: 12),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white),
                        value: defaultDate,
                        items: date.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          defaultDate = newValue!;
                          if (defaultDate == "Monthly") {
                            amount = amount * 12;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              //Table
              name ? unmarriedTable(amount) : marriedTable(amount),

              //Effective Tax Rate
              const SizedBox(
                height: 10,
              ),
              amount != 0
                  ? Text(
                      "Effective tax rate: ${((taxCalculateIndividual(amount).reduce((a, b) => a + b)) * 100 / amount).toStringAsFixed(2)}%",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  : const Text(""),

              //Amount In Hand
              amount != 0
                  ? Text(
                      "Amount In Hand: ${amount - ((taxCalculateIndividual(amount).reduce((a, b) => a + b)))}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  : const Text(""),

              // PieChart(
              //   chartRadius: 300,
              //   dataMap: dataMap,
              //   animationDuration: const Duration(milliseconds: 1000),
              //   chartLegendSpacing: 32,
              //   initialAngleInDegree: 0,
              //   chartType: ChartType.disc,
              //   ringStrokeWidth: 32,
              //   legendOptions: const LegendOptions(
              //     showLegendsInRow: false,
              //     legendPosition: LegendPosition.right,
              //     showLegends: true,
              //     legendTextStyle: TextStyle(
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   chartValuesOptions: const ChartValuesOptions(
              //     showChartValueBackground: true,
              //     showChartValues: true,
              //     showChartValuesInPercentage: false,
              //     showChartValuesOutside: false,
              //     decimalPlaces: 1,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

Widget unmarriedTable(amount) {
  return //For Individual
      Table(
    border: TableBorder.all(
      width: 2,
    ),
    children: [
      //1st Row title
      const TableRow(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Slab",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Cumulative",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Rate",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Taxable Amount",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Tax @slab",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),

      //2nd Row 0-5lakhs
      TableRow(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("5,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("5,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("1%"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: amount > 500000
                ? const Text("500,000")
                : Text(amount.toString()),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(taxCalculateIndividual(amount).isNotEmpty
                  ? taxCalculateIndividual(amount)[0].toStringAsFixed(2)
                  : "N/A")),
        ],
      ),

      //3rd row 5-7lakhs
      TableRow(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("2,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("7,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("10%"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: amount > 700000
                ? const Text("200,000")
                : Text((amount - 500000).toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 1
                ? taxCalculateIndividual(amount)[1].toString()
                : "N/A"),
          ),
        ],
      ),

      //4th row 7-10lakhs
      TableRow(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("3,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("10,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("20%"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: amount > 1000000
                ? const Text("300,000")
                : Text((amount - 700000).toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 2
                ? taxCalculateIndividual(amount)[2].toString()
                : "N/A"),
          ),
        ],
      ),
      //5th row 10-20 lakhs
      TableRow(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("10,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("20,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("30%"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: amount > 2000000
                ? const Text("1,000,000")
                : Text((amount - 1000000).toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 3
                ? taxCalculateIndividual(amount)[3].toString()
                : "N/A"),
          ),
        ],
      ),

      //6th row more than 20lakhs
      TableRow(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(">20,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("36%"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: amount > 2000000
                ? Text((amount - 2000000).toString())
                : const Text(""),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 4
                ? taxCalculateIndividual(amount)[4].toString()
                : "N/A"),
          ),
        ],
      ),

      //7th Row For Grand Total

      TableRow(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Grand Total",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text((taxCalculateIndividual(amount).reduce((a, b) => a + b))
                .toString()),
          ),
        ],
      ),
    ],
  );
}

Widget marriedTable(amount) {
  return Table(
    border: TableBorder.all(
      width: 2,
    ),
    children: [
      //1st Row for title
      const TableRow(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Slab",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Cumulative",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Rate",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Taxable Amount",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Tax @slab",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),

      //2nd Row 0-6lakhs
      TableRow(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("6,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("6,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("1%"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("6,00,000"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).isNotEmpty
                ? taxCalculateIndividual(amount)[0].toString()
                : "N/A"),
          ),
        ],
      ),

      //3rd row 6-8lakhs
      TableRow(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("2,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("8,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("10%"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("2,00,000"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 1
                ? taxCalculateIndividual(amount)[1].toString()
                : "N/A"),
          ),
        ],
      ),

      //4th row 8-11 lakhs
      TableRow(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("3,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("11,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("20%"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("3,00,000"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 2
                ? taxCalculateIndividual(amount)[2].toString()
                : "N/A"),
          ),
        ],
      ),
      //5th row 11-20 lakhs
      TableRow(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("11,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("20,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("30%"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("11,00,000"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 3
                ? taxCalculateIndividual(amount)[3].toString()
                : "N/A"),
          ),
        ],
      ),

      //6th row more than 20lakhs
      TableRow(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(">20,00,000"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("36%"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("500,000"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 4
                ? taxCalculateIndividual(amount)[4].toString()
                : "N/A"),
          ),
        ],
      ),

      //7th Row

      TableRow(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Grand Total",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text((taxCalculateIndividual(amount).reduce((a, b) => a + b))
                .toString()),
          ),
        ],
      ),
    ],
  );
}
