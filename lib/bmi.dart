import 'package:flutter/material.dart';
import 'package:bmi/colors.dart';
import 'package:bmi/left.dart';
import 'package:bmi/right.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            BMIScreen(),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  TextEditingController _wysokosc = TextEditingController();
  TextEditingController _waga = TextEditingController();
  String bmiResult = '0';
  String textResult = '';

  @override
  Widget build(BuildContext context) {
    // Sprawdź, czy klawiatura jest widoczna
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.lightGreen, fontSize: 18),
        ),
        backgroundColor: glownyHexColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        color: glownyHexColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _waga,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.lightGreen,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                          fontSize: 40,
                          color: Colors.white.withOpacity(.9),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _wysokosc,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.lightGreen,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                          fontSize: 40,
                          color: Colors.white.withOpacity(.9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  calculateBMI();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                ),
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '$bmiResult',
                style: TextStyle(
                  fontSize: 64.0,
                  color: Colors.lightGreen,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Text(
                '$textResult',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.lightGreen,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              if (!isKeyboardVisible) ...[
                SizedBox(height: 70),
                LeftBar(barWidth: 40),
                SizedBox(height: 20),
                LeftBar(barWidth: 70),
                SizedBox(height: 20),
                LeftBar(barWidth: 40),
                SizedBox(height: 20),
                RightBar(barWidth: 70),
                SizedBox(height: 50),
                RightBar(barWidth: 70),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.tryParse(_wysokosc.text) ?? 0.0;
    double weight = double.tryParse(_waga.text) ?? 0.0;

    if (height > 0 && weight > 0) {
      double bmi = weight / ((height / 100) * (height / 100));
      setState(() {
        bmiResult = bmi.toStringAsFixed(2);

        if (bmi > 25) {
          textResult = "Over weight";
        } else if (bmi >= 18.5 && bmi <= 25) {
          textResult = "Normal weight";
        } else {
          textResult = "Under weight";
        }
      });
    } else {
      setState(() {
        bmiResult = 'Invalid input';
        textResult = '';
      });
    }
  }
}
