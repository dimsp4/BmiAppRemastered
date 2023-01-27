import 'package:flutter/material.dart';

class BmrResult extends StatelessWidget {
  const BmrResult({
    Key? key,
    required this.value,
    required this.valueNumber,
    required this.color,
  }) : super(key: key);

  final String value;
  final String valueNumber;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Result",
                      style: TextStyle(
                          fontSize: 30,
                          color: color,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: color,
                          size: 90,
                        ),
                        Text(
                          valueNumber,
                          style: TextStyle(
                              fontSize: 30,
                              color: color,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 23,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "While certain foods, such as coffee and spices, can increase your basal metabolic rate, the changes are often subtle. Also, the results are short lived and so have little to no impact on weight loss.",
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 30),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                      ),
                      child: Text(
                        "Recalculate",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
