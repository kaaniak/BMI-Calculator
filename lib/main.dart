import 'package:flutter/material.dart';
import 'bmi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BMIScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.lightGreen,
            padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
          ),
          child: Text(
            'BMI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
