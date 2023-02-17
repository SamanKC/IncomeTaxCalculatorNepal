import 'package:flutter/material.dart';
import 'package:incometaxcalculatornepal/controller/function.dart';
import 'package:incometaxcalculatornepal/utils/config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController amountController = TextEditingController();
  double amount = 0;
  String dropDownValue = "Unmarried";
  var options = ["Unmarried", "Married"];

  String defaultDate = "Yearly";
  var date = ["Yearly"];

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
  void clear() {
    setState(() {
      amountController.text = "0";
      amount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "${AppDetails.appName} ${AppDetails.fiscalYear}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _showDialog(context, "About App",
                    "Income Tax Calculator Nepal is an easy-to-use app that helps you calculate your income tax quickly and accurately. \nPlease kindly note that while we have made every effort to ensure accuracy, we cannot be held responsible for any errors. \n\nDeveloped By Students of Flutter Batch 2023 by Bishworaj Poudel:\n- Ajaya Kandel\n- Bikram Twayana\n- Manish Ghorashainee\n- Rajesh Pangeni\n- Ram Giri\n- Saman KC\n- Santosh Adhikari\n- Bijay Kumal\n- Dikshya Poudel\n- Saroj Ojha\n- Sabin Kumpakha\n- Bijayraj Poudel");
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
                    clear();
                    dropDownValue = newValue!;
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
                    "Enter Income:",
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
                              hintText: "Rs, 120000",
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
                                //set for table, tax rate, amount in hand
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
                          clear();
                          defaultDate = newValue!;
                          if (defaultDate == "Monthly") {
                            amount = amount * 12;
                            //
                          } else {
                            //
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
              dropDownValue == options[0]
                  ? unmarriedTable(amount)
                  : marriedTable(amount),

              const SizedBox(
                height: 10,
              ),
              //Effective Tax Rate
              Text(
                "Effective tax rate: ${amount == 0 ? "0" : "${((taxCalculateIndividual(amount).reduce((a, b) => a + b)) * 100 / amount).toStringAsFixed(2)}%"}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              //Amount In Hand
              Text(
                "Amount In Hand: Rs.${amount == 0 ? "0" : (amount - ((taxCalculateIndividual(amount).reduce((a, b) => a + b)))).toStringAsFixed(2)}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
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
                  : (amount - 500000) < 0
                      ? const Text('0')
                      : Text((amount - 500000).toString())),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 1
                ? taxCalculateIndividual(amount)[1].toStringAsFixed(2)
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
                : (amount - 700000) < 0
                    ? const Text('0')
                    : Text((amount - 700000).toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 2
                ? taxCalculateIndividual(amount)[2].toStringAsFixed(2)
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
                : (amount - 1000000) < 0
                    ? const Text('0')
                    : Text((amount - 1000000).toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 3
                ? taxCalculateIndividual(amount)[3].toStringAsFixed(2)
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
                : const Text("0"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 4
                ? taxCalculateIndividual(amount)[4].toStringAsFixed(2)
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
            child: Text(
                "Rs. ${(taxCalculateIndividual(amount).reduce((a, b) => a + b)).toStringAsFixed(2)}"),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: amount > 500000
                ? const Text("600,000")
                : Text(amount.toString()),
            // Text("6,00,000"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).isNotEmpty
                ? taxCalculateIndividual(amount)[0].toStringAsFixed(2)
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: amount > 800000
                ? const Text("200,000")
                : (amount - 600000) < 0
                    ? const Text('0')
                    : Text((amount - 600000).toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 1
                ? taxCalculateIndividual(amount)[1].toStringAsFixed(2)
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: amount > 1100000
                ? const Text("300,000")
                : (amount - 800000) < 0
                    ? const Text('0')
                    : Text((amount - 800000).toString()),
            // Text("3,00,000"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 2
                ? taxCalculateIndividual(amount)[2].toStringAsFixed(2)
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: amount > 2000000
                ? const Text("1100,000")
                : (amount - 1100000) < 0
                    ? const Text('0')
                    : Text((amount - 1100000).toString()),
            // Text("11,00,000"),
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
            child: Text("---"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("36%"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: amount > 2000000
                ? Text(
                    (amount - 2000000).toString(),
                  )
                : const Text("0"),
            // Text("500,000"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(taxCalculateIndividual(amount).length > 4
                ? taxCalculateIndividual(amount)[4].toStringAsFixed(2)
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
            child: Text(
                "Rs. ${(taxCalculateIndividual(amount).reduce((a, b) => a + b)).toStringAsFixed(2)}"),
          ),
        ],
      ),
    ],
  );
}
