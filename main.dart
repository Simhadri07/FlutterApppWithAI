import 'package:flutter/material.dart';

void main() {
  runApp(SalaryCalculatorApp());
}

class SalaryCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salary Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SalaryCalculatorScreen(),
    );
  }
}

class SalaryCalculatorScreen extends StatefulWidget {
  @override
  _SalaryCalculatorScreenState createState() => _SalaryCalculatorScreenState();
}

class _SalaryCalculatorScreenState extends State<SalaryCalculatorScreen> {
  final TextEditingController basicSalaryController = TextEditingController();
  final TextEditingController hraController = TextEditingController();
  final TextEditingController allowancesController = TextEditingController();
  final TextEditingController deductionsController = TextEditingController();
  
  double netSalary = 0.0;

  void calculateNetSalary() {
    double basicSalary = double.tryParse(basicSalaryController.text) ?? 0.0;
    double hra = double.tryParse(hraController.text) ?? 0.0;
    double allowances = double.tryParse(allowancesController.text) ?? 0.0;
    double deductions = double.tryParse(deductionsController.text) ?? 0.0;

    setState(() {
      netSalary = (basicSalary + hra + allowances) - deductions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Salary Calculator")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: basicSalaryController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Basic Salary"),
            ),
            TextField(
              controller: hraController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "HRA"),
            ),
            TextField(
              controller: allowancesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Allowances"),
            ),
            TextField(
              controller: deductionsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Deductions"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateNetSalary,
              child: Text("Calculate"),
            ),
            SizedBox(height: 20),
            Text(
              "Net Salary: ₹${netSalary.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
