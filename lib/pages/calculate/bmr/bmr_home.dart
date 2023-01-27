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
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.blueGrey,
      ),
      body: Body(),
    );
  }
}
