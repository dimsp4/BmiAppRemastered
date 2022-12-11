import 'package:bmi_app/pages/drawer/how_calculate.dart';
import 'package:bmi_app/pages/drawer/how_get_result.dart';
import 'package:bmi_app/pages/drawer/what_bmi.dart';
import 'package:flutter/material.dart';

import 'bmr_body.dart';

class BmrPage extends StatelessWidget {
  const BmrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: 30,
            padding: EdgeInsets.all(20),
            icon: Icon(
              Icons.help,
              color: Colors.black54,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Body(),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              height: 150,
              color: Colors.white,
              child: Text(
                "Menu",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => WhatBmi()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.help,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "What is BMI?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HowCalculate()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.help,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "How to calculate BMI?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HowResult()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.help,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "How to get result by gender?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
