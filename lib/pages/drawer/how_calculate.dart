import 'package:flutter/material.dart';

class HowCalculate extends StatelessWidget {
  const HowCalculate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text("How to calculate BMI?"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset('assets/images/bmi_picture1.png')),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'The formula is:\nBMI = kg / (m x m)\nwhere kg is a person’s weight in kilograms and m is their height in metres squared.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
