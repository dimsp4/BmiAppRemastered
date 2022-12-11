import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 80,
            child: ElevatedButton(
              onPressed: () {
                onPress();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 20),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              ),
              child: Text(
                "Calculate",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
