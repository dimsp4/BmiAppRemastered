import 'package:flutter/material.dart';

class WhatBmi extends StatelessWidget {
  const WhatBmi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("What is BMI?"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset('assets/images/bmi_picture.png')),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women',
            )
          ],
        ),
      ),
    );
  }
}
