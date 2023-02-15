import 'package:flutter/material.dart';
import 'package:incometaxcalculatornepal/utils/config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropDownValue = "Unmarried";
  var options = ["Unmarried", "Married"];

  String defaultDate = "Yearly";
  var date = ["Yearly", "Monthly"];

  bool name = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                AppDetails.appName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              //Dropdown menu for unmarried and married
              Padding(
                padding: const EdgeInsets.all(18.0),
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

              //Amount Text
              Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 12),
                  child: const Text(
                    "Enter Your Amount:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),

              //for enter Amount Text Field
              enterAmount(),

              //for Date Option
              Padding(
                padding: const EdgeInsets.all(18.0),
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
                    // if (dropDownValue == "Unmarried") {
                    //   name = true;
                    // } else if (dropDownValue == "Married") {
                    //   name = false;
                    // } else {
                    //   const Text("Invalid Input");
                    // }
                    // setState(() {});
                  },
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              name ? unmarriedTable() : marriedTable(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget unmarriedTable() {
  return //For Individual
      Table(
    border: TableBorder.all(
      width: 2,
    ),
    children: const [
      //1st Row title
      TableRow(
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
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("0"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("5,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("1%"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("5,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
        ],
      ),

      //3rd row 5-7lakhs
      TableRow(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("5,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("7,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("10%"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("2,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
        ],
      ),

      //4th row 7-10lakhs
      TableRow(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("7,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("10,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("20%"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("3,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
        ],
      ),
      //5th row 10-20 lakhs
      TableRow(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("10,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("20,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("30%"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("10,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
        ],
      ),

      //6th row more than 20lakhs
      TableRow(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(">20,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("36%"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Remaining"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
        ],
      ),

      //7th Row For Grand Total

      TableRow(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Grand Total",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "6500000",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget marriedTable() {
  return Table(
    border: TableBorder.all(
      width: 2,
    ),
    children: const [
      //1st Row for title
      TableRow(
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
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("0"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("6,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("1%"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("6,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
        ],
      ),

      //3rd row 6-8lakhs
      TableRow(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("6,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("8,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("10%"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("2,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
        ],
      ),

      //4th row 8-11 lakhs
      TableRow(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("8,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("11,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("20%"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("3,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
        ],
      ),
      //5th row 11-20 lakhs
      TableRow(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("11,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("20,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("30%"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("9,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
        ],
      ),

      //6th row more than 20lakhs
      TableRow(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(">20,00,000"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("36%"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Remaining"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
        ],
      ),

      //7th Row

      TableRow(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(""),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Grand Total",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "6500000",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget enterAmount() {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
      decoration: InputDecoration(
          hintText: "600000",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white),
    ),
  );
}
