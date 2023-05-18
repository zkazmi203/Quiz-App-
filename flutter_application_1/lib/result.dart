import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // const Result({super.key});
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {super.key});

  String get resultPhrase {
    String resultText;
    if (resultScore <= 30) {
      resultText = 'Your score is = $resultScore \n Try Again!';
    } else {
      resultText = 'Your score is = $resultScore \n You have succeeded!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 239, 236, 240).withOpacity(0.9),
            offset: const Offset(0, 8),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              resultPhrase,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
              textAlign: TextAlign.center,
              selectionColor: const Color.fromARGB(255, 181, 148, 187),
            ),
            Column(
              children: [
                TextButton(
                  onPressed: resetHandler,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                  ),
                  child: const Text(
                    'Restart Quiz!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
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
