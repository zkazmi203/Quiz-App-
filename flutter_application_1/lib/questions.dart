import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold
            // color: Colors.deepOrange,
            // backgroundColor: Colors.deepPurple,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
