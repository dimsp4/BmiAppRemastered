import 'package:bmi_app/pages/drawer/what_bmi.dart';
import 'package:flutter/material.dart';

import 'how_calculate.dart';
import 'how_get_result.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            height: 150,
            color: Colors.blueGrey,
            child: Text(
              "Menu",
              style: TextStyle(fontSize: 25, color: Colors.white),
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
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "What is BMI?",
                    style: TextStyle(color: Colors.blueGrey),
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
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "How to calculate BMI?",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HowResult()));
              },
              child: Row(
                children: [
                  Icon(
                    Icons.help,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "How to get result by gender?",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
