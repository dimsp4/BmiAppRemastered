import 'dart:html';

import 'package:bmi_app/components/calculate_button.dart';
import 'package:bmi_app/components/gender.dart';
import 'package:bmi_app/components/textfield_number.dart';
import 'package:bmi_app/pages/calculate/bmi/bmi_result_page.dart';
import 'package:bmi_app/pages/calculate/rhr/rhr_result_page.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController heightController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double heartRate = 60;
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
                    "RHR Calculator",
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
                    this.currentIndex = valueGender;
                  },
                ),
                Text(
                  'Date of Birth',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 3),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 3),
                    ),
                    hintText: DateTime.now().toString().split(" ")[0],
                    hintStyle: const TextStyle(color: Colors.black54),
                  ),
                  style: const TextStyle(color: Colors.black54),
                  onTap: () async {
                    var date = await showDatePicker(
                      initialDatePickerMode: DatePickerMode.year,
                      initialEntryMode: DatePickerEntryMode.calendar,
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.fromSwatch(
                              primarySwatch: Colors.blueGrey,
                            ),
                            dialogBackgroundColor: Colors.white,
                          ),
                          child: child!,
                        );
                      },
                    );
                    dateController.text = date.toString().split(" ")[0];
                    if (date == null) {
                      dateController.text =
                          DateTime.now().toString().split(" ")[0];
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Heart Rate (bpm/beat per minute)',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    heartRate.toInt().toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 15,
                    thumbColor: Colors.blueGrey,
                    activeTrackColor: Colors.blueGrey,
                    inactiveTrackColor: Colors.blueGrey[100],
                    overlayColor: Colors.transparent,
                    minThumbSeparation: 100,
                    rangeThumbShape: RoundRangeSliderThumbShape(
                      enabledThumbRadius: 10,
                      disabledThumbRadius: 10,
                    ),
                  ),
                  child: Slider(
                    label: heartRate.toString(),
                    min: 0,
                    max: 200,
                    onChanged: (val) {
                      setState(() {
                        heartRate = val;
                      });
                    },
                    value: heartRate,
                  ),
                ),
                Text(
                  "The best time to check your resting heart rate is in the morning before getting out of bed. To take your pulse, do it in two ways below.\n– Place your index finger and middle finger on the opposite wrist just below the thumb.\n– Place your index and middle finger on the lower neck, just above down the throat.\nCount the beats in 15 seconds. Multiply the result by 4 to get your resting heart rate.",
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
              if (heartRate <= 40) {
                kondisi = "Rendah";
                color = Colors.yellow;
              } else if (heartRate > 40 && heartRate <= 140) {
                kondisi = "Normal";
                color = Colors.green;
              } else {
                kondisi = "Abnormal";
                color = Colors.yellow;
              }

              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RhrResult(
                        value: kondisi,
                        color: color,
                      )));

              hasil = 0;
              this.heightController.text = "";
              this.weightController.text = "";
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
