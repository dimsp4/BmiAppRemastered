import 'package:bmi_app/components/calculate_button.dart';
import 'package:bmi_app/components/gender.dart';
import 'package:bmi_app/components/textfield_number.dart';
import 'package:bmi_app/pages/calculate/bmi/bmi_result_page.dart';
import 'package:flutter/material.dart';

import 'bmr_result_page.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController heightController = TextEditingController(text: "0");
  TextEditingController ageController = TextEditingController(text: "0");
  TextEditingController weightController = TextEditingController(text: "0");
  int currentIndex = 0;
  late double hasil;
  late String kondisi, info, condition, risk, saran;
  late Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(
                    "BMR Calculator",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GenderSection(
                  currentIndex: currentIndex,
                  onChange: (valueGender) {
                    currentIndex = valueGender;
                  },
                ),
                Column(
                  children: [
                    TextFieldNumber(
                      text: "Age",
                      controller: ageController,
                      spress: () {
                        double valueWeight = double.parse(ageController.text);
                        valueWeight++;
                        ageController.text = valueWeight.toString();
                      },
                      ppress: () {
                        double valueWeight = double.parse(ageController.text);
                        valueWeight--;
                        ageController.text = valueWeight.toString();
                      },
                      hint: '0',
                    ),
                    TextFieldNumber(
                      text: "Weight (kg)",
                      controller: weightController,
                      spress: () {
                        double valueWeight =
                            double.parse(weightController.text);
                        valueWeight++;
                        weightController.text = valueWeight.toString();
                      },
                      ppress: () {
                        double valueWeight =
                            double.parse(weightController.text);
                        valueWeight--;
                        weightController.text = valueWeight.toString();
                      },
                      hint: '0',
                    ),
                    TextFieldNumber(
                      text: "Height (cm)",
                      controller: heightController,
                      spress: () {
                        double valueHeight =
                            double.parse(heightController.text);
                        valueHeight++;
                        heightController.text = valueHeight.toString();
                      },
                      ppress: () {
                        double valueHeight =
                            double.parse(heightController.text);
                        valueHeight--;
                        heightController.text = valueHeight.toString();
                      },
                      hint: '0',
                    ),
                    Row(
                      children: [],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CalculateButton(
            onPress: () async {
              // if (weightController.text == 0.0.toString() ||
              //     heightController.text == 0.0.toString()) {
              //   SnackBar(
              //     duration: Duration(seconds: 60),
              //     content: Text("Please fill Height and Weight section."),
              //     action: SnackBarAction(
              //       label: "dismiss",
              //       onPressed: () {},
              //     ),
              //   );
              // }

              if (currentIndex == 0) {
                hasil = 66.5 +
                    (13.7 * double.parse(weightController.text)) +
                    (5 * double.parse(weightController.text)) -
                    (6.8 * double.parse(weightController.text));
                if (hasil <= 1400) {
                  kondisi = "Rendah";
                  color = Colors.blueGrey;
                } else if (hasil >= 1401 && hasil <= 3000) {
                  kondisi = "Normal";
                  color = Colors.blueGrey;
                } else if (hasil >= 3100) {
                  kondisi = "Tinggi";
                  color = Colors.red;
                } else {
                  kondisi = "belum ditentukan";
                }
              } else {
                hasil = 655 +
                    (9.6 * double.parse(weightController.text)) +
                    (1.8 * double.parse(heightController.text)) -
                    (4.7 * double.parse(ageController.text));
                if (hasil <= 1400) {
                  kondisi = "Rendah";
                  color = Colors.blueGrey;
                } else if (hasil >= 1401 && hasil <= 3000) {
                  kondisi = "Normal";
                  color = Colors.blueGrey;
                } else if (hasil >= 3100) {
                  kondisi = "Tinggi";
                  color = Colors.red;
                } else {
                  kondisi = "belum ditentukan";
                }
              }
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BmrResult(
                        value: kondisi,
                        valueNumber: hasil.toStringAsFixed(2),
                        color: color,
                      )));

              hasil = 0;
              heightController.text = "0";
              weightController.text = "0";
              currentIndex = 0;
              setState(() {});
            },
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
