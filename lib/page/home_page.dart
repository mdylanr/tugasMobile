import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  void calculateBMI() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double bmi = weight / (height * height);
    resultController.text = bmi.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat (kg)',
              ),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi (cm)',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: Text('Hitung BMI'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: resultController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'BMI',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
