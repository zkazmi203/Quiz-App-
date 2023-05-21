import 'package:flutter/material.dart';
import 'splash/splash.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  // const Result({super.key});
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 30) {
      resultText = 'Your score is = $resultScore \n \n  Try Again!';
    } else {
      resultText = 'Your score is = $resultScore \n \n  You have succeeded!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(0, 142, 141, 143).withOpacity(0.9),
              // color: Color.fromARGB(255, 239, 236, 240).withOpacity(0.9),
              // offset: Offset(0, 8),
              // blurRadius: 4,
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: Offset(0, 2)),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              resultPhrase,
              style: GoogleFonts.oswald(
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 55, 71, 79)),
              ),
              textAlign: TextAlign.center,
              selectionColor: Color.fromARGB(255, 181, 148, 187),
            ),
            Column(
              children: [
                Container(
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()),
                      );
                    },
                    child: Text(
                      'Restart Quiz!',
                      style: GoogleFonts.robotoMono(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 55, 71, 79)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
