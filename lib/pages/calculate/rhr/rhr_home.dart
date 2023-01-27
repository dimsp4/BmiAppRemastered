import 'package:bmi_app/pages/drawer/how_calculate.dart';
import 'package:bmi_app/pages/drawer/how_get_result.dart';
import 'package:bmi_app/pages/drawer/what_bmi.dart';
import 'package:flutter/material.dart';

import 'rhr_body.dart';

class RhrPage extends StatelessWidget {
  const RhrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      appBar: AppBar(
        foregroundColor: Colors.blueGrey,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Body(),
    );
  }
}
