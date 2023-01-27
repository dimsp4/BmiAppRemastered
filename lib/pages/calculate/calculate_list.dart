import 'package:flutter/material.dart';

class CalculateList extends StatelessWidget {
  const CalculateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculate",
        ),
        foregroundColor: Colors.black54,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Choose what you want to calculate!",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculateButtonNav(
                    title: "BMI",
                    route: 'bmi',
                  ),
                  CalculateButtonNav(
                    title: "BMR",
                    route: 'bmr',
                  ),
                  CalculateButtonNav(
                    title: "RHR",
                    route: 'rhr',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculateButtonNav extends StatelessWidget {
  const CalculateButtonNav({
    Key? key,
    required this.title,
    required this.route,
  }) : super(key: key);

  final String title, route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.pushNamed(context, route);
      }),
      child: Container(
        height: 80,
        width: 100,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey,
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
