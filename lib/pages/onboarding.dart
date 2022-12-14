import 'package:flutter/material.dart';

class OnBoardingPages extends StatelessWidget {
  const OnBoardingPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueGrey,
            Colors.white,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/64671-removebg-preview.png",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "U-Body",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        letterSpacing: 3,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "U-Body is a mobile application that can makes your body healtier by knowing your body information with BMI, BMR, and RHR calculation.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 0.5,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'splash', (route) => false);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 20),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                      shadowColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Colors.blueGrey,
                      ),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
