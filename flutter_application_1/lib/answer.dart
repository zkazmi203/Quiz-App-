import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 9.0),
      child: ElevatedButton(
        // by default it takes the background color as blue or the default color of the system
        // style: ElevatedButton.styleFrom(primary: Colors.black26,onPrimary: Colors.white),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 55, 71, 79))),
        onPressed: selectHandler,
        child: Text(
          answerText,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                // fontWeight: FontWeight.bold
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}
