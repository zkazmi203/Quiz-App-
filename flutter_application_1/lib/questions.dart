import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: GoogleFonts.oswald(
          textStyle: const TextStyle(
              fontSize: 40,
              // fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        textAlign: TextAlign.center,
        selectionColor: const Color.fromARGB(255, 181, 148, 187),
      ),
    );
  }
}
