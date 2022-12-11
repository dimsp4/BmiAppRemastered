import 'package:flutter/material.dart';

class TextFieldNumber extends StatefulWidget {
  const TextFieldNumber({
    Key? key,
    required this.controller,
    required this.text,
    required this.spress,
    required this.ppress,
    required this.hint,
  }) : super(key: key);

  final String text;
  final TextEditingController controller;
  final Function() spress;
  final Function() ppress;
  final String hint;

  @override
  State<TextFieldNumber> createState() => _TextFieldNumberState();
}

class _TextFieldNumberState extends State<TextFieldNumber> {
  // int height = 0;
  // int weight = 0;
  late double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: this.widget.controller,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: widget.hint,
                          hintStyle: TextStyle(color: Colors.black26),
                          prefixIcon: IconButton(
                            onPressed: widget.ppress,
                            icon: Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: widget.spress,
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                        cursorColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // void incrementHeight() {
  //   setState(() {
  //     height++;
  //   });
  // }

  // void incrementWeight() {
  //   setState(() {
  //     height++;
  //   });
  // }

  // void decrementHeight() {
  //   setState(() {
  //     height--;
  //   });
  // }

  // void decrementWeight() {
  //   setState(() {
  //     height--;
  //   });
  // }
}
