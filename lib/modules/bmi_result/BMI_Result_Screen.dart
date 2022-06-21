import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {

  final bool isMale;
  final double result;
  final int age;

  BMIResultScreen({
    required this.isMale,
    required this.result,
    required this.age
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
              Icons.arrow_back_ios
          ),
        ),
        backgroundColor: isMale ? Colors.blue : Colors.pink,
        title: Text(
          'BMI Result',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender: ${isMale ? 'MALE' : 'FEMALE'}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'RESULT: ${result.round()}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'AGE: ${age}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
